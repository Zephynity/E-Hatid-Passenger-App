import 'package:flutter/material.dart';

class UsernameContainer extends StatelessWidget {
  final Widget child;
  const UsernameContainer({
    Key? key,
    required this.child,
}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
      width: size.width * 0.8,
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
    );
  }
}