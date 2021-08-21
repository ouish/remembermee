import 'dart:async';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import '../compount/mydrawer.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Home extends StatefulWidget {
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  late Position cl;
  var lat;
  var long;
  late CameraPosition _kGooglePlex;

  Future getper() async {
    bool services;
    LocationPermission per;

    services = await Geolocator.isLocationServiceEnabled();
    if (services == false) {
      AwesomeDialog(
          context: context,
          title: "services",
          body: Text("sevices not Enabled"))
        ..show();
    }
    per = await Geolocator.checkPermission();
    if (per == LocationPermission.denied) {
      per = await Geolocator.requestPermission();
      // if (per == LocationPermission.always) {
      // getLatAndLong();
      // }
    }
    print("================");
    print(per);
    print("================");
    return per;
  }

  Future<void> getLatAndLong() async {
    cl = await Geolocator.getCurrentPosition().then((value) => value);
    lat = cl.latitude;
    long = cl.longitude;
    _kGooglePlex = CameraPosition(
      target: LatLng(lat, long),
      zoom: 14.4746,
    );
    setState(() {});
  }

  @override
  void initState() {
    getper();
    getLatAndLong();
    super.initState();
  }

  Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        backgroundColor: Colors.teal[900],
        actions: <Widget>[IconButton(onPressed: () {}, icon: Icon(Icons.home))],
        centerTitle: true,
        elevation: 6,
      ),
      drawer: MyDrawer(),
      body: ListView(
        children: [
          Column(
            children: [
              _kGooglePlex == null
                  ? CircularProgressIndicator()
                  : Container(
                      child: GoogleMap(
                        mapType: MapType.normal,
                        initialCameraPosition: _kGooglePlex,
                        onMapCreated: (GoogleMapController controller) {
                          _controller.complete(controller);
                        },
                      ),
                      height: 500,
                      width: 400,
                    ),
              ElevatedButton(
                onPressed: () async {
                  // cl = await getLatAndLong();
                  // print("Lat${cl.latitude}");
                  // print("long${cl.longitude}");
                  // List<Placemark> placemarks =
                  //  await placemarkFromCoordinates(cl.latitude, cl.longitude);
                  // print(placemarks[0].locality);
                },
                child: Text("find me"),
              )
            ],
          ),
        ],
      ),
    );
  }
}
//AIzaSyB-8IPvkQOwk4QB5SPyJDPydKp37SdvDkw

