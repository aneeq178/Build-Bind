import 'package:buildbind/View/widgets/sized_boxes.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../Utills/AppColors.dart';
import '../widgets/texts.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:    Container(
          width: 6.h,
          height: 6.h,
          decoration: BoxDecoration(
            color: APPCOLORS.GREY,
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.arrow_back_ios,
          ),
        ),
title: Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [

    Container(
      width: 8.h,
      height: 8.h,
      decoration: BoxDecoration(
        border: Border.all(width:1.w,color: APPCOLORS.WHITE ),
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage('assets/images/image 29.png'), // Replace with your photo asset path
          fit: BoxFit.cover,
        ),
      ),
    ),

    Column(
      children: [
        BoldText(text: "Aneeq Ahmed"),
        hsizedbox1,
        SmallText(text: "Online"),
      ],
    ),

    Container(
      width: 6.h,
      height: 6.h,
      decoration: BoxDecoration(
        color: APPCOLORS.GREY,
        shape: BoxShape.circle,
      ),
      child: Icon(
        Icons.call,
      ),
    ),
  ],
)
        ,
        actions: [

        ],
      ),
      body: Padding(
        padding:  EdgeInsets.all(4.w),
        child: Container(
          width: 90.h,
          height: 85.h,
          decoration: BoxDecoration(
            color: APPCOLORS.GREY,
           borderRadius: BorderRadius.all(Radius.circular(8.w)),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(4.w),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(4.w),
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: 18.h,
                        height: 4.h,
                        decoration: BoxDecoration(
                          color: APPCOLORS.PRIMARY.withOpacity(0.8),
                          borderRadius: BorderRadius.all(Radius.circular(8.w)),
                        ),
                        child: Center(child: Text("December 12,2023",style: TextStyle(color: APPCOLORS.WHITE,fontSize:10.sp,fontWeight: FontWeight.normal),)),
                      ),
                    ),
                  ),

                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      constraints: BoxConstraints(
                        maxWidth: 80.w,
                      ),
                      padding: EdgeInsets.all(2.w),
                      decoration: BoxDecoration(

                        color: APPCOLORS.WHITE,
                        borderRadius: BorderRadius.all(Radius.circular(4.w)),
                      ),
                      child: Text(
                        'Hello Sir, Just say your Project and I am really interested in it. I have similar experience. I will make sure to provide our best services and give the best possible result. ',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),

                  hsizedbox2      ,
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      constraints: BoxConstraints(
                        maxWidth: 80.w,
                      ),
                      padding: EdgeInsets.all(2.w),
                      decoration: BoxDecoration(

                        color: APPCOLORS.PRIMARY,
                        borderRadius: BorderRadius.all(Radius.circular(4.w)),
                      ),
                      child: Text(
                        'Hello! I have seen you bid could you please provide me detailed quotation?',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  
                  
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
