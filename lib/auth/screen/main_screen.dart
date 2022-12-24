import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/auth_provider.dart';

class myProfilePage extends StatelessWidget {
  Widget textBox({required String hintText}) {
    return Material(
        elevation: 4,
        shadowColor: Colors.grey,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
            height: 40,
            child: Text(
              hintText,
              style: TextStyle(
                letterSpacing: 2,
                color: Colors.black54,
                fontWeight: FontWeight.bold,
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.white30,
              borderRadius: BorderRadius.circular(10),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        /*appBar: AppBar(
          title: Text('My Profile'),
          elevation: 0.0,
          backgroundColor: Color(0xff555555),
          leading: IconButton(
            
              icon: Icon(Icons.arrow_back), onPressed: () {}), // IconButton
        ),*/ // AppBar
        body: Consumer<AuthProvider>(builder: (context, provider, w) {
      return SafeArea(
          child: Stack(alignment: Alignment.center, children: [
        Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          Container(
              height: 450,
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
                            hintText:
                                'User Name : ' + provider.loggedUser!.userName,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          textBox(
                            hintText:
                                'User Email : ' + provider.loggedUser!.email,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          textBox(
                            hintText: 'User Phone : ' +
                                provider.loggedUser!.phoneNumber,
                          )
                        ]))
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
              IconButton(
                  icon: Icon(Icons.shopping_cart, color: Colors.white),
                  onPressed: () {})
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
        
        // Padding
      ]));
    }));
  }
}

class HeaderCurvedContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var rect = Offset.zero & size;

    Paint paint = Paint()..color = Color(0xffefc399);
    /* ..shader = LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.topLeft,
        colors: [
          Color(0xffa973ab),
                     Color(0xffca8094),
        ],
      ).createShader(rect);*/

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
