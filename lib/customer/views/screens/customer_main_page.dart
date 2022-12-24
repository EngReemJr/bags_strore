import 'package:firebase_start/admin/models/product.dart';
import 'package:firebase_start/customer/views/components/constant.dart';
import 'package:flutter/material.dart' hide Slider;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../admin/providers/admin_provider.dart';
import '../../../admin/views/components/slider_sidget.dart';
import '../../../auth/providers/auth_provider.dart';
import '../components/costome_appbar.dart';
import '../components/navigation_appbar.dart';
import '../components/slider_widget.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //List categories = ['Hand Bags' , 'Back Bags' , 'Heels' , 'Watches','Glasses'];
 int currentIndex = 0;

  updateIndex(x, v) {
    currentIndex = x;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:
        Provider.of<AuthProvider>(context).isDarkMode?
        Color.fromARGB(255, 51, 50, 50):
         Color(0xffeeecee),
        appBar: CustomeAppBar(true),
        body: Consumer<AdminProvider>(builder: (context, provider, index) {
          return 
             Container(
                child: provider.allSliders == null || provider.allCategories==null
      ? const Center(
          child: CircularProgressIndicator(),
        ):
                 Column(
              children: [
          
    Container(
                    child: CarouselSlider(
                      options: CarouselOptions(
                          height: 270.h,
                           onPageChanged: updateIndex,
                          autoPlay: true,
                          viewportFraction: 1),
                      items: provider.allSliders!.map((i) {
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
                                          image: NetworkImage(i!.imageUrl!),
                                          fit: BoxFit.cover)),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                      /*  Text(
                                          //i.price.toString() + '\$',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),*/
                                        Expanded(
                                          child: Text(
                                            i.title!,
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ]),
                                  // Color(0xffa973ab),
                                ));
                          },
                        );
                      }).toList(),
                    ),
                  ),
   Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(provider.allSliders!.length,
                              (index) {
                            return Container(
                              margin: EdgeInsets.symmetric(horizontal: 3),
                              height: index == currentIndex ? 10 : 8,
                              width: index == currentIndex ? 10 : 8,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: index == currentIndex
                                    ? Colors.blue
                                    : Colors.grey,
                              ),
                            );
                          }),
                        ),
              Row(children: [Text('All Categories'),Expanded(child: SizedBox()),Icon(Icons.arrow_forward)],) ,      

      Container(
      height: 230.h,
     child: Center(
       child: ListView.builder(
         itemCount:provider.allCategories!.length,
         itemBuilder: (context, index) {
           return MySliderWidget(provider.allCategories![index]);
         },
         scrollDirection: Axis.horizontal,
         padding: const EdgeInsets.all(8),
       ),
     )),
                   Row(children: [Text('Special Offers'),Expanded(child: SizedBox()),Icon(Icons.arrow_forward)],) ,      

 ],
            ),
          );
        })
        ,
        bottomNavigationBar:  BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'My Orders',
          ),
        /*  BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          )*/
        ],
       // currentIndex: _selectedIndex,
        selectedItemColor: backColor,
       // onTap: _onItemTapped,
      ),
        );
  }
}
