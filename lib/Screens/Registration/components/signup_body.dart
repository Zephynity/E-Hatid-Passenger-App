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
          Padding(
            padding: EdgeInsets.only(bottom: 5, top: 10),
            child: Text(
              "Sign up to E-Hatid",
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
            "Book your next tricycle in just one tap.",
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