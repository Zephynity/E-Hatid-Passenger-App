import 'package:ehatid_passenger_app/Screens/Registration/components/signup_body.dart';
import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFED90F),
      body: SingleChildScrollView(
        child: SignUpBody(),
      ),
    );
  }
}