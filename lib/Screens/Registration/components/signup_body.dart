import 'package:ehatid_passenger_app/Screens/Registration/components/signup_bg.dart';
import 'package:flutter/material.dart';

class SignUpBody extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //total height and width
    return SignUpBackground(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget> [
          Image.asset("assets/images/regLogo.png",
            height: size.height * 0.3,
          ),
        ],
      ),
    );
  }
}