import 'package:flutter/material.dart';
import 'package:scoltender/screens/auth/login.dart';
import 'package:scoltender/screens/auth/register.dart';

class LoginOrRegisterPage extends StatefulWidget {
  const LoginOrRegisterPage({super.key});

  @override
  State<LoginOrRegisterPage> createState() => LoginOrRegisterPageState();
}

class LoginOrRegisterPageState extends State<LoginOrRegisterPage> {
  //initially show login Page

  bool showLoginPage = true;

  // toggle between login and register page
  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(
        onTap: togglePages,
      );
    } else {
      return RegisterPage(
        onTap: togglePages,
      );
    }
  }
}