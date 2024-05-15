import 'dart:developer';

import 'package:buildbind/Models/contractor_model.dart';
import 'package:buildbind/Utills/AppColors.dart';
import 'package:buildbind/View/widgets/sized_boxes.dart';
import 'package:buildbind/View/widgets/texts.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ContractorDetails extends StatefulWidget {
  const ContractorDetails({
    required this.contractor,
    super.key});

  final IndividualContractor contractor;


  @override
  State<ContractorDetails> createState() => _ContractorDetailsState();
}

class _ContractorDetailsState extends State<ContractorDetails> {
  bool servicescon=false;
  bool specilitycon=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0,),
      body: SingleChildScrollView(
        child: Padding(
          padding:EdgeInsets.all(4.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 100.w,
                height: 50.h,
                decoration: BoxDecoration(
                  color: APPCOLORS.GREY,
                  image: const DecorationImage(
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

                          GestureDetector(
                            onTap: (){

                            },
                            child: Container(
                              width: 6.h,
                              height: 6.h,
                              decoration: BoxDecoration(
                                color: APPCOLORS.SECONDARY,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.favorite,
                                color: Colors.white,
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),

                    ),
                    Align(
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
                  ],
                ),
              ),
              hsizedbox2,
              HeadingText(text:widget.contractor.individualName),
              hsizedbox1,
              hsizedbox2,
              Container(
                height: 6.1.h,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  children: [
                    BadgeContainer(text: 'Employees ${widget.contractor.noOfEmployees.toString()}'),
                    wsizedbox2,
                    BadgeContainer(text: 'Total Projects ${widget.contractor.totalProjects}'),
                  ],
                ),
              ),


              hsizedbox4,
              BadgeContainer(text: widget.contractor.description),

              hsizedbox2,
              HeadingText(text:'Projects'),
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
                padding: EdgeInsets.all(2.w),
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
                          Container(
                              width: 60.w,
                              child: SmallText(text: 'Had a great experience working with him. Quality was complete ensured')),
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
      padding: EdgeInsets.all(4.w),
      // width: 28.w,
      height: 7.h,
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
