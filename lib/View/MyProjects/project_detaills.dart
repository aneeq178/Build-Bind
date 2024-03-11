import 'package:buildbind/View/Contractor/Biding/biding.dart';
import 'package:buildbind/View/chat/chat_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sizer/sizer.dart';

import '../../Utills/AppColors.dart';
import '../widgets/sized_boxes.dart';
import '../widgets/texts.dart';

class ProjectDetaills extends StatefulWidget {
  const ProjectDetaills({super.key});

  @override
  State<ProjectDetaills> createState() => _ProjectDetaillsState();
}

class _ProjectDetaillsState extends State<ProjectDetaills> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(4.w),
        child: Column(
          children: [
            Container(
              height: 88.h,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 100.w,
                      height: 30.h,
                      decoration: BoxDecoration(
                        color: APPCOLORS.GREY,
                        image: DecorationImage(
                          image: AssetImage(
                              'assets/images/main2.jpg'
                          ),
                        ),
                        border: Border.all(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(8.w),
                      ),
                      child: Stack(
                        children: [

                          Positioned(
                            top:2.h,
                            left: 2.w,
                            child:
                            Container(
                              width: 85.w,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                        Icons.arrow_back_ios,
                                      ),
                                    ),
                                  ),

                                ],
                              ),
                            ),

                          ),

                        ],
                      ),
                    ),
                    hsizedbox2,
                    HeadingText2(text: '15 Marla, 2 Floor Complete House'),
                    hsizedbox2,
                    SimpleText(text: 'Complete Project Including Interior Design and Electric and plumbing work included',),
                    hsizedbox2,

                    Container(
                      padding: EdgeInsets.all(2.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(4.w)),
                      color: APPCOLORS.PRIMARY,
                    ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Budget',style: TextStyle(color: APPCOLORS.WHITE,fontSize:12.sp,fontWeight: FontWeight.bold)),
                          Text('50,050,00',style: TextStyle(color: APPCOLORS.WHITE,fontSize:12.sp,)),
                        ],
                      ),
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Construction Type ',style: TextStyle(color: APPCOLORS.PRIMARY,fontSize:12.sp,fontWeight: FontWeight.bold)),
                        Text('Complete Project ',style: TextStyle(color: APPCOLORS.PRIMARY,fontSize:12.sp,)),
                      ],
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Construction Mode',style: TextStyle(color: APPCOLORS.PRIMARY,fontSize:12.sp,fontWeight: FontWeight.bold)),
                        Text('With Material',style: TextStyle(color: APPCOLORS.PRIMARY,fontSize:12.sp)),
                      ],
                    ),

                    hsizedbox2,
                    ProjectDescriptionFeature(text: 'Floors',quantity: '2',),
                    hsizedbox1,
                    ProjectDescriptionFeature(text: 'Area Sqft',quantity: '2000',),
                    hsizedbox1,
                    ProjectDescriptionFeature(text: 'Living rooms',quantity: '6',),
                    hsizedbox1,
                    ProjectDescriptionFeature(text: 'kitchens',quantity: '1',),
                    hsizedbox1,
                    ProjectDescriptionFeature(text: 'Washrooms',quantity: '4',),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatScreen()));
                  },
                  child: Container(
                    width:40.w,
                    height: 8.h,
                    padding: EdgeInsets.all(2.w),
                    decoration: BoxDecoration(
                      color: APPCOLORS.SECONDARY,
                      border: Border.all(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Center(
                      child: Text('Chat', style: TextStyle(color: APPCOLORS.WHITE,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold),),
                    ),
                  ),
                ),

                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ContractorBiding()));
                  },
                  child: Container(
                    width:40.w,
                    height: 8.h,
                    padding: EdgeInsets.all(2.w),
                    decoration: BoxDecoration(
                      color: APPCOLORS.SECONDARY,
                      border: Border.all(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Center(
                      child: Text('Bid', style: TextStyle(color: APPCOLORS.WHITE,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold),),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ProjectDescriptionFeature extends StatelessWidget {
  const ProjectDescriptionFeature({
    required this.quantity,
    required this.text,
    super.key,
  });

  final String text;
  final String quantity;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top:2.w,bottom:2.w,right: 6.w,left: 4.w),
      width: 100.w,
      height: 8.h,
      decoration: BoxDecoration(
        color: APPCOLORS.GREY,
        borderRadius: BorderRadius.all(Radius.circular(6.w)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BoldText(text:text),
          BoldText(text: quantity),

        ],
      ),
    );
  }
}
