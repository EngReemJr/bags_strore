import 'package:firebase_start/admin/models/product.dart';
import 'package:flutter/material.dart' hide Slider;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../admin/providers/admin_provider.dart';
import '../../admin/views/components/slider_sidget.dart';
import 'components/costome_appbar.dart';
import 'components/navigation_appbar.dart';
import 'components/slider_widget.dart';

class HomePage extends StatelessWidget {
  List categories = ['Hand Bags' , 'Back Bags' , 'Heels' , 'Watches','Glasses'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffeeecee),
        appBar: CustomeAppBar(),
        body: Consumer<AdminProvider>(builder: (context, provider, index) {
          return 
             Container(
                child: Column(
              children: [
                Expanded(
                  child: Container(
                    child: CarouselSlider(
                      options: CarouselOptions(
                          height: 500.h,
                          // onPageChanged: updateIndex,
                          autoPlay: true,
                          viewportFraction: 1),
                      items: products.map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return InkWell(
                                onTap: () {
                                  //  goToWebsite(i.url!);
                                },
                                child: Container(
                                  margin: EdgeInsets.all(5),
                                  padding: EdgeInsets.all(10),
                                  height:
                                      MediaQuery.of(context).size.height ,
                                  width:
                                      MediaQuery.of(context).size.width ,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: const Color(0xff657575),
                                      image: DecorationImage(
                                          colorFilter: new ColorFilter.mode(
                                              Color(0xff657575)
                                                  .withOpacity(0.8),
                                              BlendMode.dstATop),
                                          image: AssetImage(i.imageUrl),
                                          fit: BoxFit.contain)),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          i.price.toString() + '\$',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          i.name,
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white),
                                        ),
                                      ]),
                                  // Color(0xffa973ab),
                                ));
                          },
                        );
                      }).toList(),
                    ),
                  ),
                ),
 
     //height: 140.h,
      Container(
      height: 140.h,
     child: Center(
       child: ListView.builder(
         itemCount: categories.length,
         itemBuilder: (context, index) {
           return MySliderWidget(categories[index].toString());
         },
         scrollDirection: Axis.horizontal,
         padding: const EdgeInsets.all(8),
       ),
     )),

                Container(
                  height: 150.h,
                  color: Colors.white,
                  child: Row(
                    children: [
                      Expanded(child: SizedBox()),
                      Center(
                          child: Container(
                        width: 300.w,
                        height: 100.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(41),
                          color: Color.fromARGB(255, 249, 250, 244),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 228, 234, 224),
                              blurRadius: 15.0, // soften the shadow
                            )
                          ],
                        ),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(41),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Color(0xffca8094)
                                  // Color.fromARGB(
                                  //  255, 253, 194, 42), // Background color
                                  ),
                              onPressed: () {},
                              child: Text(
                                'Palce Order',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Color.fromARGB(255, 77, 79, 66),
                                ),
                              ),
                            )),
                      ))
                    ],
                  ),
                ),
              ],
            ),
          );
        })
        ,
        bottomNavigationBar:  BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Me',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Shopping',
          ),
        ],
       // currentIndex: _selectedIndex,
        selectedItemColor: Color(0xffa973ab),
       // onTap: _onItemTapped,
      ),
        );
  }
}
