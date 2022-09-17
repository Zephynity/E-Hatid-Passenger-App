import 'package:flutter/material.dart';
import 'package:ehatid_passenger_app/Screens/Login/components/signin_bg.dart';

class SignInBody extends StatefulWidget {
  @override
  _SignInBodyState createState() => _SignInBodyState();
}

class _SignInBodyState extends State<SignInBody> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    //total height and width
    return SignInBackground(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget> [
          Image.asset("assets/images/loginLogo.png",
            height: size.height * 0.3,
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 5, top: 10),
            child: Text(
              "Sign in to your Account",
              overflow: TextOverflow.visible,
              textAlign: TextAlign.center,
              style: TextStyle(
                height: 1.171875,
                fontSize: 24.0,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w700,
                color: Color.fromARGB(255, 32, 32, 32),
                letterSpacing: -1.6800000000000002,
              ),
            ),
          ),
          Text(
            "Welcome Back! Ready for your next ride?",
            overflow: TextOverflow.visible,
            textAlign: TextAlign.center,
            style: TextStyle(
              height: 1.171875,
              fontSize: 12.0,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w500,
              color: Color.fromARGB(255, 39, 39, 39),
              letterSpacing: -0.48,
            ),
          ),

        ],
      ),
    );
  }
}