import 'package:firebase_start/app_router/app_router.dart';
import 'package:firebase_start/auth/authHelper.dart';
import 'package:firebase_start/providers/auth_providers.dart';
import 'package:firebase_start/screen/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  runApp(const MyApp());

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AuthProvider>(
      create:(context){
        return AuthProvider();
      }
      child: MaterialApp(
        navigatorKey: AppRouter.appRouter.navigatorKey,
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: signInScreen(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              validator: (value) {
                if (value == null) {
                  return 'Requierd Field';
                } else if (!(value.contains('@'))) {
                  return 'Incorrect email';
                }
              },
              textAlign: TextAlign.center,
              controller: controller1,
              style: new TextStyle(
                  fontWeight: FontWeight.w400,
                  fontFamily: "Noto Naskh Arabic",
                  fontSize: 28.0),
              decoration: InputDecoration(
                hintText: 'Email',
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      width: 3, color: Color.fromARGB(255, 50, 136, 99)),
                ),
              ),
            ),
            TextFormField(
              obscureText: true,
              validator: (v) {
                if ((v?.length ?? 0) <= 6) {
                  return 'Error';
                }
              },
              textAlign: TextAlign.center,
              controller: controller2,
              style: new TextStyle(
                  fontWeight: FontWeight.w400,
                  fontFamily: "Noto Naskh Arabic",
                  fontSize: 28.0),
              decoration: InputDecoration(
                hintText: 'Password',
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      width: 3, color: Color.fromARGB(255, 50, 136, 99)),
                ),
              ),
            ),
            ElevatedButton(
                onPressed: (() {
                  
                  
                  bool isValid = formKey.currentState!.validate();
                  if(isValid){
                    AuthHelper.HelperAuth.signup(
    controller1.text, controller2.text);
                  }
                }),
                child: Text('Add New User'))
          ],
        ),
      )),
    );
  }
}
