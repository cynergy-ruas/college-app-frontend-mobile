import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/src/ui/Registeration_screen 2.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:frontend/src/ui/stepper.dart';

class RegisterationPage extends StatefulWidget {
  final Function goto;

  const RegisterationPage({Key key, this.goto}) : super(key: key);
  @override
  _RegisterationPageState createState() => _RegisterationPageState();
}

class _RegisterationPageState extends State<RegisterationPage> {
  var _currentStep = 0;

  PickedFile _image;
  ImagePicker imgpicker = ImagePicker();
  imgfromGallery() async {
    print('picker is called');
    PickedFile image = await imgpicker.getImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff393E46),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50),
            SizedBox(
              height: 150,
              width: 150,
              child: Stack(
                children: [
                  CircleAvatar(
                    backgroundColor: Color(0xFFC4C4C4),
                    radius: 80,
                    child: _image != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(80),
                            child: Image.file(File(_image.path),
                                width: 150, height: 150, fit: BoxFit.cover),
                          )
                        : CircleAvatar(
                            backgroundColor: Colors.grey,
                            radius: 80,
                          ),
                  ),
                  Positioned(
                      width: 32,
                      height: 32,
                      bottom: 0,
                      right: 10,
                      child: GestureDetector(
                        onTap: () {
                          imgfromGallery();
                        },
                        child: Container(
                          child: Icon(
                            Icons.photo_camera,
                            size: 20,
                          ),
                          decoration: BoxDecoration(
                              color: Color(0xFFFA947E), shape: BoxShape.circle),
                        ),
                      ))
                ],
              ),
            ),
            SizedBox(height: 30),
            Text(
              'Registration',
              style: TextStyle(
                  fontSize: 30,
                  fontStyle: FontStyle.normal,
                  color: Color(0xFFFA947E)),
            ),

            //stepper widget
            Theme(
              data: ThemeData(canvasColor: Color(0xFF03AFB7)),
              child: Stepper(
                physics: ClampingScrollPhysics(),
                currentStep: this._currentStep,
                onStepContinue: () {
                  setState(() {
                    if (this._currentStep < steps.length - 1) {
                      this._currentStep = this._currentStep + 1;
                    } else {
                      print('completed . Check fields');
                    }
                  });
                },
                controlsBuilder: (BuildContext context,
                    {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
                  return Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      TextButton(
                        onPressed: onStepContinue,
                        child: const Text(
                          'CONTINUE',
                          style:
                              TextStyle(color: Color(0xFF00F4FF), fontSize: 13),
                        ),
                      ),
                      TextButton(
                        onPressed: onStepCancel,
                        child: const Text(
                          'CANCEL',
                          style:
                              TextStyle(color: Color(0xFF86B0B1), fontSize: 13),
                        ),
                      ),
                    ],
                  );
                },
                steps: steps,
                onStepTapped: (step) {
                  setState(() {
                    this._currentStep = step;
                  });
                },
                onStepCancel: () {
                  setState(() {
                    if (this._currentStep > 0) {
                      this._currentStep = this._currentStep - 1;
                    } else {
                      this._currentStep = 0;
                    }
                  });
                },
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: IconButton(
                    alignment: Alignment.center,
                    color: Colors.white,
                    icon: Icon(
                      CupertinoIcons.arrow_right_circle,
                      size: 30.0,
                    ),
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => PinSetup()),
                      // );
                      widget.goto(1);
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
