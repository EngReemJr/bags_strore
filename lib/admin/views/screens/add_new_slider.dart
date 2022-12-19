import 'package:firebase_start/customer/views/components/costome_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../auth/component/custome_textFeild.dart';
import '../../../customer/views/components/slider_widget.dart';
import '../../providers/admin_provider.dart';
import '../components/slider_sidget.dart';

class AddNewSliderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
     //.
     //
     // resizeToAvoidBottomInset: false,
      appBar: CustomeAppBar(),
      //AppBar(
       // title: Text('Add New Slider'),
      
      body: Consumer<AdminProvider>(builder: (context, provider, w) {
        return SingleChildScrollView(
       
       
          child: Container (
               height: 1500
   .h,
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    provider.pickImageForCategory();
                  },
                  child: Container(
                      height: 200,
                      width: double.infinity,
                      color: Colors.grey,
                      child: provider.imageFile == null
                          ? Center(
                              child: Icon(Icons.camera),
                            )
                          : Image.file(
                              provider.imageFile!,
                              fit: BoxFit.cover,
                            )),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      CustomTextfield(
                        controller: provider.sliderTitleController,
                        label: 'Slider Title',
                        validation: provider.requiredValidation,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomTextfield(
                        controller: provider.sliderUrlController,
                        label: 'Slider Url',
                        validation: provider.requiredValidation,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () {
                              provider.AddNewSlider();
                            },
                            child: Text('Add New Slider')),
                      )
                    ],
                  ),
                ),
                Expanded(
              
               //   child: Container(
                    //  height: 140.h,
                      child:
                                 provider.allSliders == null
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : provider.allSliders!.isEmpty
                      ? Center(
                          child: Text('No Sliders Found'),
                        )
                      : ListView.builder(
                       // s
                       // scrollDirection: Axis.horizontal,
                          itemCount: provider.allSliders!.length,
                          itemBuilder: (context, index) {
                            return SliderWidget(provider.allSliders![index]);
                          })
                      
                      
                   //   )
                ),
               SizedBox(height: 100.h,)
              ],
            ),
          ),
        );
      }),
    );
  }
}
