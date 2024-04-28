import 'package:buildbind/View/Contractor/Tokens/payment_screen.dart';
import 'package:buildbind/View/widgets/sized_boxes.dart';
import 'package:buildbind/View/widgets/texts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sizer/sizer.dart';

import '../../../Utills/AppColors.dart';

class BuyTokens extends StatelessWidget {
  const BuyTokens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 1,
      ),
      body: Container(
        padding: EdgeInsets.all(4.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
          GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Container(
                  width: 6.h,
                  height: 6.h,
                  decoration: BoxDecoration(
                    color: APPCOLORS.GREY,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.arrow_back_ios_new,
                  ),
                ),
          ),
            wsizedbox4,
            wsizedbox6,
                HeadingText2(text: 'Buy Tokens'),
              ],
            ),

            hsizedbox3,
            Container(
              width: 100.w,
              height: 7.h,
              padding: EdgeInsets.all(2.w),
              decoration: BoxDecoration(
                color: APPCOLORS.PRIMARY,
                borderRadius: BorderRadius.circular(4.w),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('50 Tokens for',style: TextStyle(color: APPCOLORS.WHITE,fontSize:14.sp,fontWeight: FontWeight.bold)),
                  Text('RS 5000',style: TextStyle(color: APPCOLORS.WHITE,fontSize:14.sp))
                ],
              ),
            ),
            hsizedbox1,
            Container(
              width: 100.w,
              height: 7.h,
              padding: EdgeInsets.all(2.w),
              decoration: BoxDecoration(
                color: APPCOLORS.PRIMARY,
                borderRadius: BorderRadius.circular(4.w),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('80 Token for',style: TextStyle(color: APPCOLORS.WHITE,fontSize:14.sp,fontWeight: FontWeight.bold)),
                  Text('RS 7000',style: TextStyle(color: APPCOLORS.WHITE,fontSize:14.sp))
                ],
              ),
            ),
            hsizedbox1,
            Container(
              width: 100.w,
              height: 7.h,
              padding: EdgeInsets.all(2.w),
              decoration: BoxDecoration(
                color: APPCOLORS.PRIMARY,
                borderRadius: BorderRadius.circular(4.w),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('100 Token for',style: TextStyle(color: APPCOLORS.WHITE,fontSize:14.sp,fontWeight: FontWeight.bold)),
                  Text('RS 8000',style: TextStyle(color: APPCOLORS.WHITE,fontSize:14.sp))
                ],
              ),
            ),
            hsizedbox2,
            HeadingText2(text: 'Payment Method'),
            hsizedbox2,
            Align(
              alignment: Alignment.center,
              child: Container(
                padding: EdgeInsets.all(2.w),
                  width: 80.w,
                  height: 7.h,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0, 1),
                        blurRadius: 6,
                        spreadRadius: 2,
                      ),
                    ],
                    color: APPCOLORS.WHITE,
                    borderRadius: BorderRadius.circular(4.w),
                  ),
                  child: Image.asset('assets/images/easypaisa.png',width: 20.w,)),
            ),
            hsizedbox6,
            hsizedbox6,
            Align(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>PaymentScreen()));
                },
                child: Container(
                  width: 80.w,
                  height: 7.h,
                  decoration: BoxDecoration(
                    color: APPCOLORS.SECONDARY,

                    borderRadius: BorderRadius.circular(4.w),
                  ),
                  child: Center(child: Text('Next',style: TextStyle(color: APPCOLORS.WHITE,fontSize:14.sp,fontWeight: FontWeight.bold))),

                ),
              ),
            ),
          ],
        ),
      ),

    );
  }
}
