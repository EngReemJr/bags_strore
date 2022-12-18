import 'dart:developer';

import 'package:firebase_start/auth/screen/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp( signInScreen());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  Set<Marker> markers = {};
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              mapController.animateCamera(CameraUpdate.newCameraPosition(
                  CameraPosition(
                      zoom: 20, target: LatLng(31.768319, 35.213710))));
            },
            child: Icon(Icons.location_pin)),
        appBar: AppBar(
          title: const Text('Maps Sample App'),
          backgroundColor: Colors.green[700],
        ),
        body: GoogleMap(
          zoomControlsEnabled: false,
          markers: markers,
          onTap: (LatLng x) {
            log(x.latitude.toString());
            log(x.longitude.toString());
            markers.add(Marker(
                markerId: MarkerId('Jerusalem${x.latitude}'), position: x));
            setState(() {});
          },
          onMapCreated: ((GoogleMapController controller) {
            mapController = controller;
          }),
          initialCameraPosition: CameraPosition(
            target: LatLng(31.768319, 35.213710),
            zoom: 11.0,
          ),
        ),
      ),
    );
  }
}
// shady samara project key ==> AIzaSyDx9cQpGQzWKGUr_kUa1VleO3FRmTAlkrU
