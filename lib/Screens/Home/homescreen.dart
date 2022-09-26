import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ehatid_passenger_app/Screens/Login/sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;


  Future<void> _signOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.remove('initScreen');
    try {
      await _firebaseAuth.signOut();
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (_) => SignIn(),
      ),
      );
    } catch (e) {
      print(e.toString()) ;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Color(0xFFFFFCEA)),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Home"),
          backgroundColor: Color(0xFFFED90F),
        ),
        backgroundColor: Color(0xFFFFFCEA),
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              Expanded(
                child: ListView(
                  children: <Widget>[
                    UserAccountsDrawerHeader(
                      decoration: BoxDecoration(
                        color: Color(0xFFFED90F),
                      ),
                      accountName: new Text('Machu'),
                      accountEmail: new Text(user.email!),
                      currentAccountPicture: new CircleAvatar(
                        radius: 50.0,
                        backgroundImage: AssetImage("assets/images/machu.jpg"),
                      ),
                    ),
                    ListTile(
                      title: new Text("Account"),
                      onTap: (){},
                      leading: Icon(
                        Icons.account_circle_sharp,
                      ),
                      trailing: Icon(
                        Icons.arrow_right,
                      ),
                    ),
                    ListTile(
                      title: new Text("FAQ"),
                      onTap: (){},
                      leading: Icon(
                        Icons.question_answer_outlined,
                      ),
                      trailing: Icon(
                        Icons.arrow_right,
                      ),
                    ),
                    ListTile(
                      title: new Text("How To Use App"),
                      onTap: (){},
                      leading: Icon(
                        Icons.info_outline_rounded,
                      ),
                      trailing: Icon(
                        Icons.arrow_right,
                      ),
                    ),
                    ListTile(
                      title: new Text("Settings"),
                      onTap: (){},
                      leading: Icon(
                        Icons.settings,
                      ),
                      trailing: Icon(
                        Icons.arrow_right,
                      ),
                    ),
                    ListTile(
                      title: new Text("Terms & Conditions"),
                      onTap: (){},
                      leading: Icon(
                        Icons.book,
                      ),
                      trailing: Icon(
                        Icons.arrow_right,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Align(
                        alignment: FractionalOffset.bottomCenter,
                        child: Container(
                          child: Column(
                            children: <Widget>[
                              Divider(),
                              ListTile(
                                title: Text("Sign Out"),
                                onTap: () async => await _signOut(),
                                leading: Icon(
                                  Icons.logout,
                                ),
                                trailing: Icon(
                                  Icons.arrow_right,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Signed in as: " + user.email!),
            ],
          ),
        ),
      ),
    );
  }
}