import 'package:ehatid_passenger_app/Screens/Welcome/components/background.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //total height and width
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget> [
          Padding(
            padding: EdgeInsets.only(top: 250),
            child: Image.asset("assets/images/ehatid logo1.png",
              height: size.height * 0.3,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 250),
            child: Text(
              "Version 1.1.1",
              style: TextStyle(
                height: 1.171875,
                fontFamily: 'Rubik',
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Color.fromARGB(255, 39, 39, 39),
              ),
            ),
          ),
        ],
      ),
    );
  }
}