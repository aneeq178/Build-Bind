import 'package:buildbind/View/widgets/sized_boxes.dart';
import 'package:buildbind/View/widgets/texts.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../Utills/AppColors.dart';

class FeaturedCompanies extends StatelessWidget {
  const FeaturedCompanies({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(4.w),
          child: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 50.w,
                    height: 30.h,
                    padding: EdgeInsets.all(2.w),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/images/image 27.png',
                          // 'assets/images/companies.png'
                        ), // Replace with your image asset path
                        fit: BoxFit.cover,
                      ),
                      color: APPCOLORS.GREY,
                      border: Border.all(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(8.w),
                    ),
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:  EdgeInsets.all(2.w),
                        child: Container(
                          width: 35.w,
                          height: 15.h,
                          padding: EdgeInsets.all(2.w),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                'assets/images/image 28.png',
                                // 'assets/images/companies.png'
                              ), // Replace with your image asset path
                              fit: BoxFit.cover,
                            ),
                            color: APPCOLORS.GREY,
                            border: Border.all(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(8.w),
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.all(2.w),
                        child: Container(
                          width: 35.w,
                          height: 15.h,
                          padding: EdgeInsets.all(2.w),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                'assets/images/image 29.png',
                                // 'assets/images/companies.png'
                              ), // Replace with your image asset path
                              fit: BoxFit.cover,
                            ),
                            color: APPCOLORS.GREY,
                            border: Border.all(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(8.w),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              hsizedbox2,
              LabelText(text: 'Featured Companies'),
              hsizedbox1,
              Text("Featured Companies for you",style:TextStyle(color:Colors.black,fontSize: 8.sp)),
              hsizedbox1,

              Container(
                width: 50.w,
                height: 30.h,
                padding: EdgeInsets.all(2.w),
                decoration: BoxDecoration(
                  color: APPCOLORS.GREY,
                  border: Border.all(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(8.w),
                ),

                child: Padding(
                  padding: EdgeInsets.all(1.w),
                  child: Column(
                    children: [
                      Container(
                        width: 45.w,
                        height: 20.h,
                        padding: EdgeInsets.all(2.w),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/images/companies.png',
                              // 'assets/images/companies.png'
                            ), // Replace with your image asset path
                            fit: BoxFit.cover,
                          ),
                          color: APPCOLORS.GREY,
                          border: Border.all(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(8.w),
                        ),
                      ),

                      hsizedbox1,
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text("ABC LTD",style:TextStyle(color:APPCOLORS.PRIMARY,fontWeight: FontWeight.bold,fontSize: 10.sp))),

                      Row(
                        children: [
                          Icon(Icons.star),
                          Text("4.8",style:TextStyle(color:APPCOLORS.PRIMARY,fontSize: 8.sp)),
                          Icon(Icons.location_on_sharp),
                          Text("Rawalpindi",style:TextStyle(color:APPCOLORS.PRIMARY,fontSize: 8.sp)),



                        ],
                      ),



                    ],
                  ),
                ),
              ),






            ],
          ),
        ),
      ),
    );
  }
}
