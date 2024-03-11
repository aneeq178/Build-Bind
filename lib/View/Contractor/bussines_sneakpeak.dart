import 'package:buildbind/View/widgets/sized_boxes.dart';
import 'package:buildbind/View/widgets/texts.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../Utills/AppColors.dart';

class BussinessSneakPeak extends StatefulWidget {
  const BussinessSneakPeak({super.key});

  @override
  State<BussinessSneakPeak> createState() => _BussinessSneakPeakState();
}

class _BussinessSneakPeakState extends State<BussinessSneakPeak> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: HeadingText(text: 'HQ Developers'),
      ),
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(4.w),
            height: 25.h,
            width: 100.w,
            decoration: BoxDecoration(
                color: APPCOLORS.PRIMARY,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(4.w),bottomRight: Radius.circular(4.w))
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Available Tokens',style: TextStyle(color: APPCOLORS.WHITE,fontSize:12.sp,fontWeight: FontWeight.bold)),
                    Text('30',style: TextStyle(color: APPCOLORS.WHITE,fontSize:12.sp)),
                  ],
                ),
                hsizedbox1,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Contractor Type',style: TextStyle(color: APPCOLORS.WHITE,fontSize:12.sp,fontWeight: FontWeight.bold)),
                    Text('Registered Company',style: TextStyle(color: APPCOLORS.WHITE,fontSize:12.sp)),
                  ],
                ),
                hsizedbox1,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Ongoing Projects',style: TextStyle(color: APPCOLORS.WHITE,fontSize:12.sp,fontWeight: FontWeight.bold)),
                    Text('1',style: TextStyle(color: APPCOLORS.WHITE,fontSize:12.sp)),
                  ],
                ),
                hsizedbox1,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Completed Projects',style: TextStyle(color: APPCOLORS.WHITE,fontSize:12.sp,fontWeight: FontWeight.bold)),
                    Text('3',style: TextStyle(color: APPCOLORS.WHITE,fontSize:12.sp)),
                  ],
                ),
                hsizedbox1,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Ratting',style: TextStyle(color: APPCOLORS.WHITE,fontSize:12.sp,fontWeight: FontWeight.bold)),
                    Row(
                      children: [
                        Text('4.8 ',style: TextStyle(color: APPCOLORS.WHITE,fontSize:12.sp)),
                        Icon(Icons.star,color: Colors.yellow,),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          hsizedbox2,

          Container(
            padding: EdgeInsets.all(4.w),
            child: Column(
              children: [
                HeadingText2(text: 'Earnings'),
                hsizedbox2,
                Container(
                  padding: EdgeInsets.all(4.w),
                  height: 20.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0, 1),
                          blurRadius: 6,
                          spreadRadius: 2,
                        ),
                      ],
                      color: APPCOLORS.GREY,
                      borderRadius: BorderRadius.all(Radius.circular(4.w))
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Earnings in March',style: TextStyle(color: APPCOLORS.BLACK,fontSize:12.sp)),
                          Text('250,000',style: TextStyle(color: APPCOLORS.BLACK,fontSize:12.sp,fontWeight: FontWeight.bold)),
                        ],
                      ),
                      hsizedbox2,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('On Going Orders',style: TextStyle(color: APPCOLORS.BLACK,fontSize:12.sp)),
                          Text('380,0000',style: TextStyle(color: APPCOLORS.BLACK,fontSize:12.sp,fontWeight: FontWeight.bold)),
                        ],
                      ),
                      hsizedbox2,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Total Orders',style: TextStyle(color: APPCOLORS.BLACK,fontSize:12.sp)),
                          Text('10.5 Million',style: TextStyle(color: APPCOLORS.BLACK,fontSize:12.sp,fontWeight: FontWeight.bold)),
                        ],
                      ),

                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
