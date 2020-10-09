import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class RegisterationPage extends StatefulWidget {
  @override
  _RegisterationPageState createState() => _RegisterationPageState();
}

class _RegisterationPageState extends State<RegisterationPage> {
  var _index = 0;

  File _image;
  imgfromGallery() async {
    print('picker is called');
    File image = await ImagePicker.pickImage(source: ImageSource.gallery);
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
    return Container(
        color: Color(0xFF393E46),
        child: Column(children: [
          Stack(
            children: [
              Padding(
                  padding: const EdgeInsets.only(
                      top: 43.0, left: 113, right: 112, bottom: 0),
                  child: CircleAvatar(
                      backgroundColor: Color(0xFFC4C4C4),
                      radius: 80,
                      child: _image != null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(80),
                              child: Image.file(_image,
                                  width: 150, height: 150, fit: BoxFit.cover),
                            )
                          : CircleAvatar(
                              backgroundColor: Colors.grey,
                              radius: 80,
                            ))),
              Positioned(
                  width: 32,
                  height: 32,
                  left: 215,
                  top: 165,
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
          Text(
            'Registration',
            style: TextStyle(
                fontSize: 30,
                fontStyle: FontStyle.normal,
                color: Color(0xFFFA947E)),
          ),

          //stepper widget
          Theme(
            data: ThemeData(primaryColor: Color(0xFF03AFB7)),
            child: Stepper(
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
                        )),
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
              steps: [
                Step(
                    title: Text(
                      'Name',
                      style: TextStyle(color: Color(0xFF8E8E8E)),
                    ),
                    content: Row(
                      children: [
                        Icon(Icons.account_circle, color: Color(0xFF8E8E8E)),
                        SizedBox(width: 10.0),
                        Expanded(
                          child: TextFormField(
                            style: TextStyle(color: Color(0xFF8E8E8E)),
                            decoration: InputDecoration(
                                hintText: 'Enter your name',
                                hintStyle: TextStyle(color: Color(0xFF8E8E8E))),
                          ),
                        ),
                      ],
                    )),
                Step(
                    title: Text(
                      'Registration Number',
                      style: TextStyle(color: Color(0xFF8E8E8E)),
                    ),
                    content: Row(
                      children: [
                        Icon(Icons.account_circle, color: Color(0xFF8E8E8E)),
                        SizedBox(width: 10.0),
                        Expanded(
                          child: TextFormField(
                            style: TextStyle(color: Color(0xFF8E8E8E)),
                            decoration: InputDecoration(
                                hintText: '1XETXXXXXX',
                                hintStyle: TextStyle(color: Color(0xFF8E8E8E))),
                          ),
                        ),
                      ],
                    )),
                Step(
                    title: Text(
                      'Department',
                      style: TextStyle(color: Color(0xFF8E8E8E)),
                    ),
                    content: Row(
                      children: [
                        Icon(Icons.account_circle, color: Color(0xFF8E8E8E)),
                        SizedBox(width: 10.0),
                        Expanded(
                          child: TextFormField(
                            style: TextStyle(color: Color(0xFF8E8E8E)),
                            decoration: InputDecoration(
                                hintText: 'FET',
                                hintStyle: TextStyle(color: Color(0xFF8E8E8E))),
                          ),
                        ),
                      ],
                    )),
                Step(
                    title: Text(
                      'Batch',
                      style: TextStyle(color: Color(0xFF8E8E8E)),
                    ),
                    content: Row(
                      children: [
                        Icon(Icons.account_circle, color: Color(0xFF8E8E8E)),
                        SizedBox(width: 10.0),
                        Expanded(
                          child: TextFormField(
                            style: TextStyle(color: Color(0xFF8E8E8E)),
                            decoration: InputDecoration(
                                hintText: '20XX',
                                hintStyle: TextStyle(color: Color(0xFF8E8E8E))),
                          ),
                        ),
                      ],
                    )),
              ],
              currentStep: _index,
              onStepTapped: (index) {
                setState(() {
                  _index = index;
                });
              },
              onStepCancel: () {
                print("You are clicking the cancel button.");
              },
              onStepContinue: () {
                print("You are clicking the continue button.");
              },
            ),
          )
        ]));
  }
}
