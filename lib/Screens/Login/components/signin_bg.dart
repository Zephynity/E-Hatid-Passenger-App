import 'package:flutter/material.dart';

class SignInBackground extends StatelessWidget {
  final Widget child;
  const SignInBackground({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Color.fromARGB(255, 255, 252, 234),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Color.fromARGB(255, 254, 223, 63),
      ),
      body: Center(
          child: Stack(
            children: <Widget>[
              Container(
                height: size.height,
                width: double.infinity,
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Positioned(
                      top: 0,
                      child: Image.asset(
                        "assets/images/Vector 2.png",
                        width: size.width,
                      ),
                    ),
                    child,
                  ],
                ),
              ),
            ],
          )),
    );
  }
}