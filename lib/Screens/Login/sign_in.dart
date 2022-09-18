import 'package:ehatid_passenger_app/Screens/Login/components/signin_body.dart';
import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFCEA),
      body: SingleChildScrollView(
        child: SignInBody(),
      ),
    );
  }
}