import 'dart:async';
import 'package:ehatid_passenger_app/Screens/Login/sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ehatid_passenger_app/constants.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  final Completer<GoogleMapController> _controller = Completer();

  static const LatLng sourceLocation = LatLng(37.33500962, -122.03272188);
  static const LatLng destination = LatLng(37.33429383, -122.06600055);

  List<LatLng> polylineCoordinates = [];
  LocationData? currentLocation;

  void getCurrentLocation () {
    Location location = Location();

    location.getLocation().then((location) {
      currentLocation = location;
    },);
  }

  void getPolyPoints() async {
    PolylinePoints polylinePoints = PolylinePoints();

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        google_api_key,
        PointLatLng(sourceLocation.latitude, sourceLocation.longitude),
        PointLatLng(destination.latitude, destination.longitude)
    );

    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) => polylineCoordinates.add(
          LatLng(point.latitude, point.longitude)),
      );
      setState(() {

      });
    }
  }

  @override
  void initState() {
    getCurrentLocation();
    getPolyPoints();
    super.initState();
  }

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
                        color: Color(0xFFFED90F),
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
        body: currentLocation == null
            ? const Center(child: Text("Loading"))
            : GoogleMap(
          initialCameraPosition: CameraPosition(
            target: LatLng(
                currentLocation!.latitude!, currentLocation!.longitude!
            ),
            zoom: 14.5,
          ),
          polylines: {
            Polyline(
              polylineId: PolylineId("route"),
              points: polylineCoordinates,
              color: Color(0xFF7B61FF),
              width: 6,
            ),
          },
          markers: {
            Marker(
              markerId: const MarkerId("currentLocation"),
              position: LatLng(currentLocation!.latitude!, currentLocation!.longitude!),
            ),
            const Marker(
              markerId: MarkerId("source"),
              position: sourceLocation,
            ),
            const Marker(
              markerId: MarkerId("destination"),
              position: destination,
            ),
          },
        ),
      ),
    );
  }
}