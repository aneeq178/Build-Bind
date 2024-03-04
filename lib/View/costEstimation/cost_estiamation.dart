import 'package:buildbind/Providers/cost_estimation_prvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../Utills/AppColors.dart';
import '../widgets/sized_boxes.dart';
import '../widgets/texts.dart';

class CostEstimation extends StatefulWidget {
  const CostEstimation({super.key});

  @override
  State<CostEstimation> createState() => _CostEstimationState();
}

class _CostEstimationState extends State<CostEstimation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            alignment: Alignment.topLeft,
            image: AssetImage('assets/images/dashboard_back.png',),
          ),),
        child: Padding(
          padding: EdgeInsets.all(4.w),
          child: Column(
            children: [
              Container(
                height: 85.h,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
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
                          wsizedbox7,
                          HeadingText(text: 'Cost Estimation'),
                        
                        ],
                      ),
                        
                      hsizedbox3,
                      Container(
                        padding: EdgeInsets.all(4.w),
                        width: 100.w,
                        height: 8.h,
                        decoration: BoxDecoration(
                          color: APPCOLORS.PRIMARY,
                          borderRadius: BorderRadius.all(Radius.circular(3.w)),
                        ),
                        child: Center(child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                          children: [
                            Text('Total Cost',style: TextStyle(color: APPCOLORS.WHITE,fontSize:14.sp,fontWeight: FontWeight.bold)),
                            Text('82 Lakh',style: TextStyle(color: APPCOLORS.SECONDARY,fontSize:14.sp,fontWeight: FontWeight.bold)),
                          ],
                        )),),
                        
                      hsizedbox2,
                      Container(
                        padding: EdgeInsets.all(4.w),
                        width: 100.w,
                        height: 22.h,
                        decoration: BoxDecoration(
                          color: APPCOLORS.PRIMARY,
                          borderRadius: BorderRadius.all(Radius.circular(3.w)),
                        ),
                        child: Center(child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly ,
                              children: [
                                Text('Grey Structure Cost',style: TextStyle(color: APPCOLORS.WHITE,fontSize:14.sp,fontWeight: FontWeight.bold)),
                                Text('38 Lakh',style: TextStyle(color: APPCOLORS.SECONDARY,fontSize:14.sp,fontWeight: FontWeight.bold)),
                              ],
                            ),
                            hsizedbox1,
                        
                            Divider(),
                            hsizedbox1,
                        
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly ,
                              children: [
                                Text('Finishing Cost',style: TextStyle(color: APPCOLORS.WHITE,fontSize:14.sp,fontWeight: FontWeight.bold)),
                                Text('38 Lakh',style: TextStyle(color: APPCOLORS.SECONDARY,fontSize:14.sp,fontWeight: FontWeight.bold)),
                              ],
                            ),
                            hsizedbox1,
                        
                            Divider(),
                        
                            hsizedbox1,
                        
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly ,
                              children: [
                                Text('Labour Cost',style: TextStyle(color: APPCOLORS.WHITE,fontSize:14.sp,fontWeight: FontWeight.bold)),
                                Text('6 Lakh',style: TextStyle(color: APPCOLORS.SECONDARY,fontSize:14.sp,fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ],
                        )),),
                        
                      hsizedbox2,
                      Consumer<CostEstimationProvider>(
                        builder: (context, data, child) {
                          return Column(
                            children: [
                              AnimatedContainer(
                                padding: EdgeInsets.all(4.w),
                                  duration: Duration(milliseconds: 500),// Set the animation duration
                                curve: Curves.easeInOut, // Set the animation curve
                                height: data.isFSselected?25.h:9.h,
                                width: 100.w,
                                  decoration: BoxDecoration(
                                    color: APPCOLORS.GREY,
                                    borderRadius: BorderRadius.all(Radius.circular(3.w)),
                                  ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        HeadingText2(text:'Foundation Structure'),
                                        GestureDetector(
                                          onTap: (){
                                            final ctrl = context.read<CostEstimationProvider>();
                                            ctrl.changeState(1);
                                          },
                                            child: Icon(color: APPCOLORS.PRIMARY,size: 10.w,data.isFSselected?Icons.arrow_drop_up_sharp:Icons.arrow_drop_down_rounded)),
                                      ],
                                    ),
                                    data.isFSselected?Column(
                                      children: [
                                        hsizedbox2,
                        
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                                          children: [
                                            Text('Grey Structure Cost',style: TextStyle(color: APPCOLORS.PRIMARY,fontSize:14.sp,)),
                                            Text('38 Lakh',style: TextStyle(color: APPCOLORS.PRIMARY,fontSize:14.sp,)),
                                          ],
                                        ),
                        
                                        Divider(),
                        
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                        
                                          children: [
                                            Text('Finishing Cost',style: TextStyle(color: APPCOLORS.PRIMARY,fontSize:14.sp,)),
                                            Text('38 Lakh',style: TextStyle(color: APPCOLORS.PRIMARY,fontSize:14.sp,)),
                                          ],
                                        ),
                        
                                        Divider(),
                        
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                        
                                          children: [
                                            Text('Labour Cost',style: TextStyle(color: APPCOLORS.PRIMARY,fontSize:14.sp,)),
                                            Text('6 Lakh',style: TextStyle(color: APPCOLORS.PRIMARY,fontSize:14.sp,)),
                                          ],
                                        ),
                                      ],
                                    ):Container(),
                                  ],
                                )
                              ),
                              hsizedbox1,
                              AnimatedContainer(
                                  padding: EdgeInsets.all(4.w),
                                  duration: Duration(milliseconds: 500),// Set the animation duration
                                  curve: Curves.easeInOut, // Set the animation curve
                                  height: data.isPWselected?25.h:9.h,
                                  width: 100.w,
                                  decoration: BoxDecoration(
                                    color: APPCOLORS.GREY,
                                    borderRadius: BorderRadius.all(Radius.circular(3.w)),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          HeadingText2(text:'Plumbing Works'),
                                          GestureDetector(
                                              onTap: (){
                                                final ctrl = context.read<CostEstimationProvider>();
                                                ctrl.changeState(2);
                                              },
                                              child: Icon(color: APPCOLORS.PRIMARY,size: 10.w,data.isFSselected?Icons.arrow_drop_up_sharp:Icons.arrow_drop_down_rounded)),
                                        ],
                                      ),
                                      data.isPWselected?Column(
                                        children: [
                                          hsizedbox2,
                        
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                                            children: [
                                              Text('Grey Structure Cost',style: TextStyle(color: APPCOLORS.PRIMARY,fontSize:14.sp,)),
                                              Text('38 Lakh',style: TextStyle(color: APPCOLORS.PRIMARY,fontSize:14.sp,)),
                                            ],
                                          ),
                        
                                          Divider(),
                        
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                        
                                            children: [
                                              Text('Finishing Cost',style: TextStyle(color: APPCOLORS.PRIMARY,fontSize:14.sp,)),
                                              Text('38 Lakh',style: TextStyle(color: APPCOLORS.PRIMARY,fontSize:14.sp,)),
                                            ],
                                          ),
                        
                                          Divider(),
                        
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                        
                                            children: [
                                              Text('Labour Cost',style: TextStyle(color: APPCOLORS.PRIMARY,fontSize:14.sp,)),
                                              Text('6 Lakh',style: TextStyle(color: APPCOLORS.PRIMARY,fontSize:14.sp,)),
                                            ],
                                          ),
                                        ],
                                      ):Container(),
                                    ],
                                  )
                              ),
                              hsizedbox1,
                              AnimatedContainer(
                                  padding: EdgeInsets.all(4.w),
                                  duration: Duration(milliseconds: 500),// Set the animation duration
                                  curve: Curves.easeInOut, // Set the animation curve
                                  height: data.isEWselected?25.h:9.h,
                                  width: 100.w,
                                  decoration: BoxDecoration(
                                    color: APPCOLORS.GREY,
                                    borderRadius: BorderRadius.all(Radius.circular(3.w)),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          HeadingText2(text:'Electrical Works'),
                                          GestureDetector(
                                              onTap: (){
                                                final ctrl = context.read<CostEstimationProvider>();
                                                ctrl.changeState(3);
                                              },
                                              child: Icon(color: APPCOLORS.PRIMARY,size: 10.w,data.isFSselected?Icons.arrow_drop_up_sharp:Icons.arrow_drop_down_rounded)),
                                        ],
                                      ),
                                      data.isEWselected?Column(
                                        children: [
                                          hsizedbox2,
                        
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                                            children: [
                                              Text('Grey Structure Cost',style: TextStyle(color: APPCOLORS.PRIMARY,fontSize:14.sp,)),
                                              Text('38 Lakh',style: TextStyle(color: APPCOLORS.PRIMARY,fontSize:14.sp,)),
                                            ],
                                          ),
                        
                                          Divider(),
                        
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                        
                                            children: [
                                              Text('Finishing Cost',style: TextStyle(color: APPCOLORS.PRIMARY,fontSize:14.sp,)),
                                              Text('38 Lakh',style: TextStyle(color: APPCOLORS.PRIMARY,fontSize:14.sp,)),
                                            ],
                                          ),
                        
                                          Divider(),
                        
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                        
                                            children: [
                                              Text('Labour Cost',style: TextStyle(color: APPCOLORS.PRIMARY,fontSize:14.sp,)),
                                              Text('6 Lakh',style: TextStyle(color: APPCOLORS.PRIMARY,fontSize:14.sp,)),
                                            ],
                                          ),
                                        ],
                                      ):Container(),
                                    ],
                                  )
                              ),
                              hsizedbox1,
                              AnimatedContainer(
                                  padding: EdgeInsets.all(4.w),
                                  duration: Duration(milliseconds: 500),// Set the animation duration
                                  curve: Curves.easeInOut, // Set the animation curve
                                  height: data.isWMTselected?25.h:9.h,
                                  width: 100.w,
                                  decoration: BoxDecoration(
                                    color: APPCOLORS.GREY,
                                    borderRadius: BorderRadius.all(Radius.circular(3.w)),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          HeadingText2(text:'Wood, Metal and Tile Works'),
                                          GestureDetector(
                                              onTap: (){
                                                final ctrl = context.read<CostEstimationProvider>();
                                                ctrl.changeState(4);
                                              },
                                              child: Icon(color: APPCOLORS.PRIMARY,size: 10.w,data.isFSselected?Icons.arrow_drop_up_sharp:Icons.arrow_drop_down_rounded)),
                                        ],
                                      ),
                                      data.isWMTselected?Column(
                                        children: [
                                          hsizedbox2,
                        
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                                            children: [
                                              Text('Grey Structure Cost',style: TextStyle(color: APPCOLORS.PRIMARY,fontSize:14.sp,)),
                                              Text('38 Lakh',style: TextStyle(color: APPCOLORS.PRIMARY,fontSize:14.sp,)),
                                            ],
                                          ),
                        
                                          Divider(),
                        
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                        
                                            children: [
                                              Text('Finishing Cost',style: TextStyle(color: APPCOLORS.PRIMARY,fontSize:14.sp,)),
                                              Text('38 Lakh',style: TextStyle(color: APPCOLORS.PRIMARY,fontSize:14.sp,)),
                                            ],
                                          ),
                        
                                          Divider(),
                        
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                        
                                            children: [
                                              Text('Labour Cost',style: TextStyle(color: APPCOLORS.PRIMARY,fontSize:14.sp,)),
                                              Text('6 Lakh',style: TextStyle(color: APPCOLORS.PRIMARY,fontSize:14.sp,)),
                                            ],
                                          ),
                                        ],
                                      ):Container(),
                                    ],
                                  )
                              ),
                              hsizedbox1,
                              AnimatedContainer(
                                  padding: EdgeInsets.all(4.w),
                                  duration: Duration(milliseconds: 500),// Set the animation duration
                                  curve: Curves.easeInOut, // Set the animation curve
                                  height: data.isFFselected?25.h:9.h,
                                  width: 100.w,
                                  decoration: BoxDecoration(
                                    color: APPCOLORS.GREY,
                                    borderRadius: BorderRadius.all(Radius.circular(3.w)),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          HeadingText2(text:'Fitting and Fixtures'),
                                          GestureDetector(
                                              onTap: (){
                                                final ctrl = context.read<CostEstimationProvider>();
                                                ctrl.changeState(4);
                                              },
                                              child: Icon(color: APPCOLORS.PRIMARY,size: 10.w,data.isFSselected?Icons.arrow_drop_up_sharp:Icons.arrow_drop_down_rounded)),
                                        ],
                                      ),
                                      data.isFFselected?Column(
                                        children: [
                                          hsizedbox2,
                        
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                                            children: [
                                              Text('Grey Structure Cost',style: TextStyle(color: APPCOLORS.PRIMARY,fontSize:14.sp,)),
                                              Text('38 Lakh',style: TextStyle(color: APPCOLORS.PRIMARY,fontSize:14.sp,)),
                                            ],
                                          ),
                        
                                          Divider(),
                        
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                        
                                            children: [
                                              Text('Finishing Cost',style: TextStyle(color: APPCOLORS.PRIMARY,fontSize:14.sp,)),
                                              Text('38 Lakh',style: TextStyle(color: APPCOLORS.PRIMARY,fontSize:14.sp,)),
                                            ],
                                          ),
                        
                                          Divider(),
                        
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                        
                                            children: [
                                              Text('Labour Cost',style: TextStyle(color: APPCOLORS.PRIMARY,fontSize:14.sp,)),
                                              Text('6 Lakh',style: TextStyle(color: APPCOLORS.PRIMARY,fontSize:14.sp,)),
                                            ],
                                          ),
                                        ],
                                      ):Container(),
                                    ],
                                  )
                              ),
                        
                            ],
                          );
                        
                        }
                        
                        
                        
                      ),
                        
                        
                    ],
                  ),
                ),
              ),
              Container(
                height: 8.h,
                padding: EdgeInsets.all(2.w),
                decoration: BoxDecoration(
                  color: APPCOLORS.SECONDARY,
                  border: Border.all(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Center(
                  child: Text('Submit', style: TextStyle(color: APPCOLORS.WHITE,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold),),
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}
