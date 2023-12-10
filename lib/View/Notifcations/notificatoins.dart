import 'package:buildbind/View/chat/messages_view.dart';
import 'package:buildbind/View/widgets/sized_boxes.dart';
import 'package:buildbind/View/widgets/texts.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../Utills/AppColors.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(4.w),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 95.w,
                height: 10.h,
                padding: EdgeInsets.all(2.w),
                decoration: BoxDecoration(
                  color: APPCOLORS.GREY,
                  borderRadius: BorderRadius.circular(8.w),
                ),

                child: Padding(
                padding: EdgeInsets.all(2.w),
                  child: Row(
                    children: [
                      Container(
                        width: 40.w,
                        height: 10.h,
                        padding: EdgeInsets.all(2.w),
                        decoration: BoxDecoration(
                          color: APPCOLORS.WHITE,
                          borderRadius: BorderRadius.circular(8.w),
                        ),
                        child:   Center(child: Text("Notifications",style:TextStyle(color:APPCOLORS.PRIMARY,fontSize: 12.sp))),

                      ),
                      SizedBox(width: 2.w,),
                  
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>MessagesView()));
                        },
                        child: Container(
                          width: 40.w,
                          height: 10.h,
                          padding: EdgeInsets.all(2.w),
                          decoration: BoxDecoration(
                            color: APPCOLORS.WHITE,
                            borderRadius: BorderRadius.circular(8.w),
                          ),
                          child:  Center(child: Text("Messages",style:TextStyle(color:APPCOLORS.PRIMARY,fontSize: 12.sp))),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
              LabelText(text: "Today"),

              Container(
                width: 100.w,
                height: 15.h,
                padding: EdgeInsets.all(4.w),
                decoration: BoxDecoration(
                  color: APPCOLORS.GREY,
                  borderRadius: BorderRadius.circular(8.w),
                ),
                child:  Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 9.h,
                      height: 9.h,
                      decoration: BoxDecoration(
                        border: Border.all(width:1.w,color: APPCOLORS.WHITE ),
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('assets/images/image 28.png'), // Replace with your photo asset path
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    SizedBox(
                      width: 4.w,
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BoldText(text: "Ali Akbar"),
                        hsizedbox1,
                        SmallText(text: "Just Messages you!"),
                        hsizedbox2,
                        Text("10 min ago",style: TextStyle(color: APPCOLORS.BLACK.withOpacity(0.8),fontSize:10.sp,fontWeight: FontWeight.normal),),
                      ],
                    ),
                    



                  ],
                ),
              ),

              hsizedbox1,

              Container(
                width: 100.w,
                height: 15.h,
                padding: EdgeInsets.all(4.w),
                decoration: BoxDecoration(
                  color: APPCOLORS.GREY,
                  borderRadius: BorderRadius.circular(8.w),
                ),
                child:  Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 9.h,
                      height: 9.h,
                      decoration: BoxDecoration(
                        border: Border.all(width:1.w,color: APPCOLORS.WHITE ),
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('assets/images/image 29.png'), // Replace with your photo asset path
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    SizedBox(
                      width: 4.w,
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BoldText(text: "Aneeq Ahmed"),
                        hsizedbox1,
                        SmallText(text: "Bid on you I-14 house project."),
                        hsizedbox2,
                        Text("20 min ago",style: TextStyle(color: APPCOLORS.BLACK.withOpacity(0.8),fontSize:10.sp,fontWeight: FontWeight.normal),),
                      ],
                    ),

                  ],
                ),
              ),

              hsizedbox2,
              LabelText(text: "Older Notification"),

              hsizedbox1,
              Container(
                width: 100.w,
                height: 18.h,
                padding: EdgeInsets.all(4.w),
                decoration: BoxDecoration(
                  color: APPCOLORS.GREY,
                  borderRadius: BorderRadius.circular(8.w),
                ),
                child:  Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 9.h,
                      height: 9.h,
                      decoration: BoxDecoration(
                        border: Border.all(width:1.w,color: APPCOLORS.WHITE ),
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('assets/images/image 27.png'), // Replace with your photo asset path
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    SizedBox(
                      width: 4.w,
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BoldText(text: "BuildBind"),
                        hsizedbox1,
                        SmallText(text: "Your Project Commercial Building at \n Mumtaz City is now Approved"),
                        hsizedbox2,
                        Text("10 min ago",style: TextStyle(color: APPCOLORS.BLACK.withOpacity(0.8),fontSize:10.sp,fontWeight: FontWeight.normal),),
                      ],
                    ),




                  ],
                ),
              ),

              hsizedbox1,
              Container(
                width: 100.w,
                height: 15.h,
                padding: EdgeInsets.all(4.w),
                decoration: BoxDecoration(
                  color: APPCOLORS.GREY,
                  borderRadius: BorderRadius.circular(8.w),
                ),
                child:  Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 9.h,
                      height: 9.h,
                      decoration: BoxDecoration(
                        border: Border.all(width:1.w,color: APPCOLORS.WHITE ),
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('assets/images/companies.png'), // Replace with your photo asset path
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    SizedBox(
                      width: 4.w,
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BoldText(text: "Mohsin Shabbir"),
                        hsizedbox1,
                        SmallText(text: "Updated the Project Status"),
                        hsizedbox2,
                        Text("10 min ago",style: TextStyle(color: APPCOLORS.BLACK.withOpacity(0.8),fontSize:10.sp,fontWeight: FontWeight.normal),),
                      ],
                    ),




                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
