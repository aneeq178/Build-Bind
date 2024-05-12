import 'package:buildbind/View/Contractor/Biding/biding.dart';
import 'package:buildbind/View/chat/chat_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sizer/sizer.dart';

import '../../Models/project_model.dart';
import '../../Utills/AppColors.dart';
import '../widgets/sized_boxes.dart';
import '../widgets/texts.dart';

class ProjectDetaills extends StatefulWidget {
  const ProjectDetaills({
    required this.project,

    super.key});

  final Project project;


  @override
  State<ProjectDetaills> createState() => _ProjectDetaillsState();
}

class _ProjectDetaillsState extends State<ProjectDetaills> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(4.w),
        child: Column(
          children: [
            Container(
              height: 82.h,
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
                    HeadingText2(text:widget.project.pName??'House'),
                    hsizedbox2,
                    SimpleText(text: widget.project.pDetails??'Dettails',),
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
                          Text( 'Rs ${widget.project.pBudget}',style: TextStyle(color: APPCOLORS.WHITE,fontSize:12.sp,)),
                        ],
                      ),
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Construction Type ',style: TextStyle(color: APPCOLORS.PRIMARY,fontSize:12.sp,fontWeight: FontWeight.bold)),
                        Text(widget.project.pType??'Complete',style: TextStyle(color: APPCOLORS.PRIMARY,fontSize:12.sp,)),
                      ],
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Construction Mode',style: TextStyle(color: APPCOLORS.PRIMARY,fontSize:12.sp,fontWeight: FontWeight.bold)),
                        Text(widget.project.pMode??'W Material',style: TextStyle(color: APPCOLORS.PRIMARY,fontSize:12.sp)),
                      ],
                    ),

                    hsizedbox2,
                    ProjectDescriptionFeature(text: 'Floors',quantity:widget.project.pFloors.toString(),),
                    hsizedbox1,
                    ProjectDescriptionFeature(text: 'Area Sqft',quantity: widget.project.pArea.toString(),),
                    hsizedbox1,
                    ProjectDescriptionFeature(text: 'Living rooms',quantity: widget.project.pFloors.toString(),),
                    hsizedbox1,
                    ProjectDescriptionFeature(text: 'kitchens',quantity: widget.project.pKitchen.toString(),),
                    hsizedbox1,
                    ProjectDescriptionFeature(text: 'Washrooms',quantity:  widget.project.pWashroom.toString(),),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: (){
                    // Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatScreen()));
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
