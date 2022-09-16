import 'package:flutter/material.dart';
import 'package:ehatid_passenger_app/Screens/Welcome/components/background.dart';
import 'package:ehatid_passenger_app/Screens/Registration/components/signup_body.dart';

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    //total height and width
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 100),
            child: Image.asset("assets/images/ehatid logo.png",
              height: size.height * 0.3,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 20, top: 0),
            child: Text(
              "#1 Mobile-based app for \n tricycle booking",
              overflow: TextOverflow.visible,
              textAlign: TextAlign.center,
              style: TextStyle(
                height: 1.171875,
                fontSize: 26.0,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w700,
                color: Color.fromARGB(255, 32, 32, 32),
                letterSpacing: -1.6800000000000002,
              ),
            ),
          ),
          Text(
            "Find and book your tricycle ride from Lourdes \n terminal and get travelling.",
            overflow: TextOverflow.visible,
            textAlign: TextAlign.center,
            style: TextStyle(
              height: 1.171875,
              fontSize: 14.0,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w500,
              color: Color.fromARGB(255, 126, 126, 126),
              /* letterSpacing: -0.48, */
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 0, bottom: 10, right: 0, top: 20),
            child: ElevatedButton(
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                  child: Text(
                    "Register",
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 14,
                        fontWeight: FontWeight.w600
                    ),
                  )),

              style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(
                      Colors.white),
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.black),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(35.0),
                      )
                  )
              ),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => SignUpBody()));
              },
            ),
          ),
          Text(
            "Already have an account?",
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
          GestureDetector(
            child: Text("Sign in.",
              style: TextStyle(
                fontFamily: 'Montserrat',
                height: 1.171875,
                fontSize: 12.0,
                fontWeight: FontWeight.w500,
                color: Color.fromARGB(255, 39, 39, 39),
                decoration: TextDecoration.underline,
                letterSpacing: -0.48,
              ),
            ),
            onTap: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context)=>SignUpBody()));
            },
          ),
        ],
      ),
    );
  }
}