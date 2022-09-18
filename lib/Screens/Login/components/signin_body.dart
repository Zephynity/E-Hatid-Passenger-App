import 'package:flutter/material.dart';
import 'package:ehatid_passenger_app/Screens/Login/components/signin_bg.dart';
import 'package:ehatid_passenger_app/Screens/Login/sign_in.dart';
import 'package:ehatid_passenger_app/Screens/Registration/sign_up.dart';

class SignInBody extends StatelessWidget {
  const SignInBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    //total height and width
    return SignInBackground(
      child:  Container(
        margin: const EdgeInsets.fromLTRB(30, 90, 30, 0),
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
            Container( //Email
                margin: const EdgeInsets.symmetric(vertical: 15),
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Color(0xffeeeeee),
                        blurRadius: 10,
                        offset: Offset(0,4)
                    ),
                  ],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: InputField(
                  hintText: "Username or Mobile Number",
                  onChanged: (value) {},
                )
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Color(0xffeeeeee),
                      blurRadius: 10,
                      offset: Offset(0,4)
                  ),
                ],
                borderRadius: BorderRadius.circular(15),
                //border: Border.all(color: Colors.black.withOpacity(0.13))
              ),
              child: PasswordField(
                onChanged: (value) {},
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 25),
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SignIn()));
                },
                color: Color(0xFFFED90F),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)
                ),
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                minWidth: double.infinity,
                child: Text("Sign in", style: TextStyle(
                    color: Colors.white, fontFamily: 'Montserrat', fontSize: 16
                ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              child:Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account yet?", style: TextStyle(
                      color: Color(0xFF494949), fontFamily: 'Montserrat', fontSize: 16, letterSpacing: -0.5, fontWeight: FontWeight.w500
                  ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (_) => SignUp(),
                      ),
                      );
                    },
                    child: Text("Register", style: TextStyle(fontFamily: 'Montserrat', fontSize: 16,
                      letterSpacing: -0.5, fontWeight: FontWeight.w600,
                      decoration: TextDecoration.underline, color:Color(0xFFFEDF3F),
                    ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const InputField({
    Key? key,
    required this.hintText,
    this.icon = Icons.person,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: Color(0xffCCCCCC),
          ),
          hintText: "Username or Mobile Number",
          hintStyle: TextStyle( color: Color(0xbc000000),
            fontSize: 15,
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w400,),
          border: InputBorder.none,
        ),
      ),
    );
  }
}

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 1),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      height: size.height * 0.05,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(29),
      ),
      child: child,
    );
  }
}

class PasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const PasswordField({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: true,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: "Password",
          hintStyle: TextStyle( color: Color(0xbc000000),
            fontSize: 15,
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w400,),
          icon: Icon(Icons.lock,
            color: Color(0xffCCCCCC),
          ),
          suffixIcon: Icon
            (Icons.visibility,
            color: Color(0xffCCCCCC),
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}