import 'package:ehatid_passenger_app/Screens/Registration/components/signup_body.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUp createState() => _SignUp();
}
class _SignUp extends State<SignUp> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SignUpBody(),);
  }
}