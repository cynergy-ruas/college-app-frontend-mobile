import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/src/bloc/auth/auth_bloc.dart';
import 'package:frontend/src/ui/Registeration_screen%201.dart';
import 'package:frontend/src/ui/Registeration_screen%202.dart';
import 'package:frontend/src/ui/landing.dart';
import 'package:frontend/src/ui/login.dart';
import 'package:frontend/src/ui/enter_username_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Color(0xFF03AFB7)),
      debugShowCheckedModeBanner: false,
      home: Material(
        child: LandingPageSkeleton(),
      ),
    );
  }
}

class LandingPageSkeleton extends StatefulWidget {
  @override
  _LandingPageSkeletonState createState() => _LandingPageSkeletonState();
}

class _LandingPageSkeletonState extends State<LandingPageSkeleton> {
  AuthBloc _authBloc;
  PageController pageController1;
  PageController pageController2;
  PageController pageController3;
  String user;

  @override
  void initState() {
    super.initState();
    _authBloc = AuthBloc();
    _authBloc.add(AppStart());
    pageController1 = PageController(initialPage: 1);
    pageController2 = PageController();
    pageController3 = PageController();
  }

  void goto1(int page) {
    pageController1.animateToPage(page,
        duration: Duration(milliseconds: 800), curve: Curves.easeInOutQuart);
  }

  void goto2(int page) {
    pageController2.animateToPage(page,
        duration: Duration(milliseconds: 800), curve: Curves.easeInOutQuart);
  }

  void goto3(int page) {
    pageController3.animateToPage(page,
        duration: Duration(milliseconds: 800), curve: Curves.easeInOutQuart);
  }

  void setUser(String s) {
    setState(() {
      user = s;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      cubit: _authBloc,
      builder: (context, state) {
        print(state);
        if (state is AuthInitial || state is Loading) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        return PageView(
          scrollDirection: Axis.vertical,
          controller: pageController1,
          children: [
            PageView(
              controller: pageController2,
              children: [
                EnterUserName(
                  goto: goto2,
                  setUser: setUser,
                ),
                Login(user)
              ],
            ),
            LandingPage(
              goto: goto1,
            ),
            PageView(
              controller: pageController3,
              children: [
                RegisterationPage(
                  goto: goto3,
                ),
                PinSetup(),
              ],
            )
          ],
        );
      },
    );
  }
}
