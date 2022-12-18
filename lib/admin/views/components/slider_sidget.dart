import 'dart:developer';

import 'package:flutter/material.dart' hide Slider;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../models/Sliders.dart';

class SliderWidget extends StatelessWidget {
  Slider slider;
  SliderWidget(this.slider);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.black, width: 2)),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(13)),
                child: SizedBox(
                    width: double.infinity,
                    height: 220.h,
                    child: Image.network(
                      slider.imageUrl!,
                      fit: BoxFit.cover,
                    )),
              ),
              Positioned(
                  right: 15,
                  top: 10,
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.white,
                        child: IconButton(
                            onPressed: () {}, icon: Icon(Icons.delete)),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.white,
                        child: IconButton(
                            onPressed: () {}, icon: Icon(Icons.edit)),
                      ),
                    ],
                  ))
            ],
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Slider Title' + ': ' + slider.title!,
                  ),
                  Text(
                    'Slider Url' + ': ' + slider.url!,
                  ),
                ]),
          ),
        ],
      ),
    );
  }
}