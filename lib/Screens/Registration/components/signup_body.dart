import 'package:animate_do/animate_do.dart';
import 'package:ehatid_passenger_app/Screens/Registration/components/signup_bg.dart';
import 'package:ehatid_passenger_app/Screens/Login/sign_in.dart';
import 'package:ehatid_passenger_app/Screens/Registration/components/google_icon.dart';
import 'package:ehatid_passenger_app/Screens/Registration/components/twitter_icon.dart';
import 'package:ehatid_passenger_app/Screens/Registration/components/facebook_icon.dart';
import 'package:ehatid_passenger_app/Screens/Registration/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:ehatid_passenger_app/FadeAnimation.dart';

class SignUpBody extends StatefulWidget {
  @override
  _SignUpBodyState createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //total height and width
    return SignUpBackground(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget> [
          Padding(
            padding: EdgeInsets.only(top: 100),
            child: Image.asset("assets/images/regLogo.png",
              width: 200,
            ),
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
              fontSize: 13,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w500,
              color: Color.fromARGB(255, 39, 39, 39),
              letterSpacing: -0.48,
            ),
          ),
          FadeInDown(
            child: Container(
              margin: const EdgeInsets.fromLTRB(30, 10, 30, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget> [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 15),
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Color(0xffeeeeee),
                              blurRadius: 10,
                              offset: Offset(0,4)
                          )
                        ],
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: Colors.black.withOpacity(0.13))
                    ),
                    child: Stack(
                      children: [
                        InternationalPhoneNumberInput(
                          onInputChanged: (value) {},
                          cursorColor: Colors.black,
                          formatInput: false,
                          initialValue: PhoneNumber(isoCode: 'PH', dialCode:'+63'),
                          selectorConfig: SelectorConfig(
                              selectorType: PhoneInputSelectorType.BOTTOM_SHEET
                          ),
                          inputDecoration: InputDecoration(
                              contentPadding: EdgeInsets.only(bottom: 15, left: 0),
                              border: InputBorder.none,
                              hintText: 'Phone Number',
                              hintStyle: TextStyle(
                                  color: Colors.grey.shade500, fontFamily: 'Montserrat', fontSize: 16, fontWeight: FontWeight.w400
                              )
                          ),
                        ),
                        Positioned(
                          left: 85,
                          top: 8,
                          bottom:8,
                          child: Container(
                            height: 40,
                            width: 1,
                            color: Colors.black.withOpacity(0.13),
                          ),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
                    },
                    color: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)
                    ),
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                    minWidth: double.infinity,
                    child: Text("Sign up with Phone", style: TextStyle(
                        color: Colors.white, fontFamily: 'Montserrat', fontSize: 14
                    ),),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 50, top: 15),
                    child: GestureDetector(
                      child: Text("I have an account already",
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          height: 1.171875,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 39, 39, 39),
                          decoration: TextDecoration.underline,
                          letterSpacing: -0.48,
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context)=>SignIn()));
                      },
                    ),
                  ),
                  OrDivider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      GoogleIcon(
                        iconSrc: "assets/images/gmail.png",
                        press: (){},
                      ),
                      TwitterIcon(
                        iconSrc: "assets/images/twitter.png",
                        press: (){},
                      ),
                      FacebookIcon(
                        iconSrc: "assets/images/facebook.png",
                        press: (){},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

    );
  }
}

class OrDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      child: Row(
        children: <Widget> [
          buildDivider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Text("Or sign up using",
              style: TextStyle(
                height: 1.171875,
                fontSize: 14.0,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w500,
                color: Color.fromARGB(255, 39, 39, 39),
                letterSpacing: -0.48,
            ),
            ),
          ),
          buildDivider(),
        ],
      ),
    );
  }

  Expanded buildDivider() {
    return Expanded(
      child: Divider(
        color: Color(0xFF272727),
      ),
    );
  }
}