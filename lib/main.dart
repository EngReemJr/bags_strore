import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_start/admin/views/screens/display_categories.dart';
import 'package:firebase_start/admin/views/screens/main_admin_screen.dart';
import 'package:firebase_start/auth/screen/profile_screen.dart';
import 'package:firebase_start/auth/screen/sign_in_screen.dart';
import 'package:firebase_start/auth/screen/sign_up_screen.dart';
import 'package:firebase_start/auth/screen/spalsh_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import 'admin/providers/admin_provider.dart';
import 'admin/views/screens/add_new_slider.dart';
import 'app_router/app_router.dart';
import 'auth/providers/auth_provider.dart';
import 'data_reposetories/db_helper.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  await DbHelper.dbHelper.initDatabase();
  runApp(const InitApp());
}

class InitApp extends StatelessWidget {
  const InitApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(
          create: (context) {
            return AuthProvider();
          },
        ),
        ChangeNotifierProvider<AdminProvider>(
          create: (context) {
            return AdminProvider();
          },
        ),
      ],
        child: ScreenUtilInit(
        designSize: const Size(625, 1151),
        builder: (context, child) {
          return 
       MaterialApp(
         theme:Provider.of<AuthProvider>(context).isDarkMode
          ? 
          ThemeData.dark()
        : ThemeData.light(),
        debugShowCheckedModeBanner: false,
        navigatorKey: AppRouter.appRouter.navigatorKey,
        routes: {
          // When navigating to the "/" route, build the FirstScreen widget.
          'signUpScreen': (context) =>  signUpScreen(),
          // When navigating to the "/second" route, build the SecondScreen widget.
          'myProfilePage': (context) =>  myProfilePage(),
          'AdminDashBoard': (context) =>  AdminDashBoard(),
          'AddNewCategory' :(context) => AddNewCategory(),
          'AddNewSliderScreen' :(context) => AddNewSliderScreen(),
          
        },
        title: 'Flutter Demo',
  
    
        home: SplachScreen(),
      );})
    );
  }
}

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
