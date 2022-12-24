import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../customer/views/components/constant.dart';
import '../../../customer/views/components/costome_appbar.dart';
import '../components/my_card_widget.dart';




class AdminDashBoard extends StatefulWidget {
  @override
  _AdminDashBoardState createState() => _AdminDashBoardState();
}

class _AdminDashBoardState extends State<AdminDashBoard> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xffeeecee),
      appBar: CustomeAppBar(),
      body: Stack(
        children: <Widget>[
          SafeArea(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 50,
                ),
                Expanded(
                  child: GridView.count(
                    mainAxisSpacing: 10,
                    crossAxisCount: 2,
                    children: <Widget>[
                      MyCardWidget(
                              icon: Icon(Icons.category,color: backColor,size:80,),

                          nextPage: 'AddNewCategory',
                          imageUrl:
                              'https://cdn4.iconfinder.com/data/icons/gradient-circle-blue/36/2164-512.png',
                          title: 'Categories Settings'),
                      MyCardWidget(
                          nextPage: 'AddNewSliderScreen',
                          icon: Icon(Icons.announcement,color: backColor,size: 80,),
                          imageUrl:
                              'https://cdn-icons-png.flaticon.com/512/295/295144.png',
                          title: 'Advertisements Settings'),
                      MyCardWidget(
      icon: Icon(Icons.list_sharp,color: backColor,size: 80,),

                          nextPage: 'AddNewCategory',
                          imageUrl:
                              'https://cdn2.iconfinder.com/data/icons/business-flatcircle/512/booking-512.png',
                          title: 'Orders Display'),
                     
                      MyCardWidget(
     nextPage: 'AddNewCategory',
      icon: Icon(Icons.discount,color: backColor,size: 80,),

     imageUrl:
               'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSF1bwla5aq4YxiBz_ikV_OoC81oGPvugv2Y640Z5txi5JPnaU9FOkfqxGNHKpik1UhAV8&usqp=CAU',
     title: 'Special Offers'),
                
                
                
                
                
                    ]
                
                
                
                
                
                
                
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
