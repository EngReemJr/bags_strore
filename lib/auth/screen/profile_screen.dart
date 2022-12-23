import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../customer/views/components/constant.dart';
import '../providers/auth_provider.dart';

class textBox extends StatelessWidget {
  String hintText;
  textBox(this.hintText);

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, provider, index) {
      return Material(
          elevation: 4,
          shadowColor: Colors.grey,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Container(
              height: 40,
              child: hintText != 'mode'
                  ? Text(
                      hintText,
                      style: TextStyle(
                        letterSpacing: 2,
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : Row(
                      children: [
                        Text('Change Theme:'),
                        Expanded(child: SizedBox()),
                        IconButton(
                          icon: Icon(provider.isDarkMode
                              ? Icons.light_mode
                              : Icons.dark_mode),
                          onPressed: () {
                            provider.changeIsDarkMode();
                          },
                        )
                      ],
                    ),
              decoration: BoxDecoration(
                color: Colors.white30,
                borderRadius: BorderRadius.circular(10),
              )));
    });
  }
}

class myProfilePage extends StatefulWidget {
  //static late TabController tabController;
  //static GlobalKey<ScaffoldState> key1 = GlobalKey();

  @override
  State<myProfilePage> createState() => _myProfilePageState();
}

class _myProfilePageState extends State<myProfilePage> {
  String dropdownValue = listChioce.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // key: myProfilePage.key1, // set it here
        // endDrawer: buildProfileDrawer(context),
        body: Consumer<AuthProvider>(builder: (context, provider, w) {
      return SafeArea(
        child: Stack(alignment: Alignment.center, children: [
          Column(mainAxisAlignment: MainAxisAlignment.end, children: [
            Container(
              height: 1000.h,
              width: double.infinity,
              child: provider.loggedUser == null
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                          textBox(
                            'User Name : ' + provider.loggedUser!.userName,
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          textBox(
                            'User Email : ' + provider.loggedUser!.email,
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          textBox(
                            'User Phone : ' + provider.loggedUser!.phoneNumber,
                          ),
                        ]),
            )
          ]),

          CustomPaint(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ), // Container
            painter: HeaderCurvedContainer(),
          ), // CustomPaint

          Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Row(
              children: [
                IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    }),
                Expanded(child: SizedBox()),
                Row(children: [
                 /* Expanded(
                    child: IconButton(
                        icon: Icon(Icons.shopping_cart, color: Colors.white),
                        onPressed: () {}),
                  ),*/
                  /* IconButton(
                        icon: Icon(
                          Icons.list_sharp,
                          color: Colors.white,
                        ),
                        onPressed: () {
                         // myProfilePage.key1.currentState!
                            //  .openEndDrawer(); // this opens drawer
                        },
                      )*/
                  DropdownButton<String>(
                   // value: dropdownValue,
                    //child: Text(e),
                    icon: const Icon(Icons.list_sharp,color:Colors.white),
                    elevation: 16,
                    style: const TextStyle(color: Colors.black),
                    onChanged: (String? value) {
                      // This is called when the user selects an item.
                     // setState(() {
                      //  dropdownValue = value!;
                     // });
                      if (value == 'Sign Out') {
                        provider.signOut();
                      } else {
                        provider.changeIsDarkMode();
                      }
                    },
                    items: listChioce
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  )
                ])
              ],
            ),
            Row(children: [
              Text('Hi , ' + provider.loggedUser!.userName!,
                  style: TextStyle(
                    fontSize: 25,
                    letterSpacing: 1.5,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  )),
              Expanded(child: SizedBox()), // TextStyle),
              Text(
                  DateTime.now().year.toString() +
                      '/' +
                      DateTime.now().month.toString() +
                      '/' +
                      DateTime.now().day.toString(),
                  style: TextStyle(
                    fontSize: 12,
                    letterSpacing: 1.5,
                    color: Colors.white,
                  ))
            ]) // TextStyle)
            ,
            Padding(
              padding: EdgeInsets.all(5),
            ), // Padding
            Container(
              padding: EdgeInsets.all(10.0),
              width: MediaQuery.of(context).size.width / 2,
              height: MediaQuery.of(context).size.width / 2,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 5),
                shape: BoxShape.circle,
                color: Colors.white,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: provider.loggedUser?.imageUrl == null
                      ? NetworkImage(
                          'https://t3.ftcdn.net/jpg/03/46/83/96/360_F_346839683_6nAPzbhpSkIpb8pmAwufkC7c5eD7wYws.jpg')
                      : NetworkImage(
                          (provider.loggedUser?.imageUrl)!,
                        ),
                ),
              ), // DecorationImage
            )
          ]),

          Padding(
            padding: EdgeInsets.only(bottom: 270, left: 184),
            child: CircleAvatar(
              backgroundColor: Colors.black54,
              child: IconButton(
                  icon: Icon(
                    Icons.edit,
                    color: Colors.white,
                  ), // Icon
                  onPressed: () {
                    provider.uploadNewFile();
                  }), // IconButton
            ), // CircleAvatar
          ),
          /* Padding(
                padding: EdgeInsets.only(bottom: 1.h),
                child: textBox('mode'),
              )*/

          // Padding
        ]),
      );
    }));
  }
}

class HeaderCurvedContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var rect = Offset.zero & size;

    Paint paint = Paint()
      ..color = //Color(0xffefc399);
          backColor;

    Path path = Path()
      ..relativeLineTo(0, 150)
      ..quadraticBezierTo(size.width / 2, 225, size.width, 150)
      ..relativeLineTo(0, -150)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

buildProfileDrawer(BuildContext context) {
  return Drawer(
      backgroundColor: backColor,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        UserAccountsDrawerHeader(
          decoration: BoxDecoration(
            color: backColor2,
          ),
          currentAccountPicture: CircleAvatar(
            backgroundImage: NetworkImage(
                Provider.of<AuthProvider>(context).loggedUser!.imageUrl!),
          ),
          accountEmail: Text(
              Provider.of<AuthProvider>(context).loggedUser!.email,
              textAlign: TextAlign.end),
          accountName: Text(
            Provider.of<AuthProvider>(context).loggedUser!.userName,
          ),
        ),

        //  Expanded(
        //   child:
        ListTile(
          title: Text('Change Theme', textAlign: TextAlign.end),
          iconColor: Colors.white,
          textColor: Colors.white,
          leading: Icon(Provider.of<AuthProvider>(context).isDarkMode
              ? Icons.light_mode
              : Icons.dark_mode),

          onTap: () {
            Provider.of<AuthProvider>(context, listen: false)
                .changeIsDarkMode();
          },
          // )
        ),
        //Expanded(
        //  child:
        ListTile(
          title: Text('Sign Out', textAlign: TextAlign.end),
          iconColor: Colors.white,
          textColor: Colors.white,
          leading: Icon(Icons.logout),
          onTap: () {
            // ExpensesScreen.tabController.animateTo(0);
            Provider.of<AuthProvider>(context, listen: false).signOut();
          },
        )
        //)
      ]));
}
