import 'dart:developer';

import 'package:buildbind/Utills/AppColors.dart';
import 'package:buildbind/View/widgets/sized_boxes.dart';
import 'package:buildbind/View/widgets/texts.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ContractorDetails extends StatefulWidget {
  const ContractorDetails({super.key});

  @override
  State<ContractorDetails> createState() => _ContractorDetailsState();
}

class _ContractorDetailsState extends State<ContractorDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:EdgeInsets.all(4.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 100.w,
                height: 55.h,
                decoration: BoxDecoration(
                  color: APPCOLORS.GREY,
                  // image: DecorationImage(
                  //   image: AssetImage(
                  //     'assets/images/companies.png'
                  //   ),
                  // ),
                  border: Border.all(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(8.w),
                ),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: EdgeInsets.all(4.w),
                    child: Row(
                      children: [
                        Container(
                          width: 25.w,
                          height: 6.h,
                          decoration: BoxDecoration(
                            color: APPCOLORS.PRIMARY,
                            border: Border.all(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(8.w),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(Icons.star,color: Colors.yellowAccent,),
                              Text('4.9',style: TextStyle(color: APPCOLORS.WHITE,fontSize:12.sp,fontWeight: FontWeight.bold),),
                            ],
                          ),
                        ),
                        wsizedbox2,
                        Container(
                          width: 25.w,
                          height: 6.h,
                          decoration: BoxDecoration(
                            color: APPCOLORS.PRIMARY,
                            border: Border.all(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(8.w),
                          ),
                          child:
                          Center(child: Text('Level 1',style: TextStyle(color: APPCOLORS.WHITE,fontSize:12.sp,fontWeight: FontWeight.normal),)),

                        ),
                      ],

                    ),
                  ),
                ),
              ),
              hsizedbox1,
              Container(
                height: 6.1.h,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  children: [
                    BadgeContainer(text: '20 Employees'),
                    wsizedbox2,
                    BadgeContainer(text: '10 Completed Projects'),
                    wsizedbox2,
                    BadgeContainer(text: 'BuildBinder'),

                  ],
                ),
              ),
              hsizedbox2,
              HeadingText(text: 'Services'),
              hsizedbox1,
          Text('1. Construction. \n 2. Plumbing \n 3. Wood Work '
              ' \n 4. Wiring ',style: TextStyle(color: APPCOLORS.BLACK,fontSize:12.sp,fontWeight: FontWeight.normal)),

              HeadingText(text: 'Speciality'),
              hsizedbox1,
              Text('1. Construction.  \n 2. Wood Work',style: TextStyle(color: APPCOLORS.BLACK,fontSize:12.sp,fontWeight: FontWeight.normal)),

              hsizedbox2,
              HeadingText(text: 'Projects'),
              hsizedbox1,
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 80.w,
                  height: 7.h,
                  decoration: BoxDecoration(
                    color: APPCOLORS.WHITE,
                    border: Border.all(color: Colors.black54),
                    borderRadius: BorderRadius.circular(8.w),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('Project A ',style: TextStyle(color: APPCOLORS.PRIMARY,fontSize:12.sp,fontWeight: FontWeight.bold)),
                        wsizedbox2,
                        Text('Boolan FLats in G-13',style: TextStyle(color: APPCOLORS.BLACK,fontSize:12.sp,fontWeight: FontWeight.normal)),
                      ],
                    ),
                  ),
                ),
              ),

              hsizedbox2,

              HeadingText(text: 'Legal Docs'),

              hsizedbox1,

              Container(
                width: 80.w,
                height: 7.h,
                decoration: BoxDecoration(
                  color: APPCOLORS.PRIMARY,
                  border: Border.all(color: Colors.black54),
                  borderRadius: BorderRadius.circular(8.w),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Portfolio ',style: TextStyle(color: APPCOLORS.WHITE,fontSize:12.sp,fontWeight: FontWeight.bold)),
                      wsizedbox2,
                      Text('PDF',style: TextStyle(color: APPCOLORS.WHITE,fontSize:12.sp,fontWeight: FontWeight.normal)),
                    ],
                  ),
                ),
              ),

              hsizedbox1,

              Container(
                width: 80.w,
                height: 7.h,
                decoration: BoxDecoration(
                  color: APPCOLORS.PRIMARY,
                  border: Border.all(color: Colors.black54),
                  borderRadius: BorderRadius.circular(8.w),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Registration Proof',style: TextStyle(color: APPCOLORS.WHITE,fontSize:12.sp,fontWeight: FontWeight.bold)),
                      wsizedbox2,
                      Text('PDF',style: TextStyle(color: APPCOLORS.WHITE,fontSize:12.sp,fontWeight: FontWeight.normal)),
                    ],
                  ),
                ),
              ),
              hsizedbox2,
              
              HeadingText(text: 'Reviews'),
              hsizedbox1,

              Container(
                width:100.w,
                height: 15.h,
                decoration: BoxDecoration(
                  color: APPCOLORS.GREY,

                  borderRadius: BorderRadius.circular(8.w),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 14.w,
                        height: 7.5.h,
                        padding: EdgeInsets.all(5.w),
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

                      wsizedbox2,
                  Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              HeadingText2(text: 'Kurt Mullins'),
                              wsizedbox8,
                              Icon(Icons.star,color: Colors.yellowAccent,),
                              wsizedbox2,               
                              HeadingText2(text: '4.2'),
                            ],
                          ),
                          SmallText(text: 'Had a great experience working with him. Quality was complete ensured'),
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

class BadgeContainer extends StatelessWidget {
  const BadgeContainer({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 28.w,
      height: 6.h,
      decoration: BoxDecoration(
        color: APPCOLORS.GREY,
        border: Border.all(color: Colors.transparent),
        borderRadius: BorderRadius.circular(8.w),
      ),
      child:
      Center(child: Text(text,style: TextStyle(color: APPCOLORS.BLACK,fontSize:11.sp,fontWeight: FontWeight.normal),)),
    );
  }
}
