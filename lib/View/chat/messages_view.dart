import 'package:buildbind/Utills/extentions/navigation_extension.dart';
import 'package:buildbind/View/Notifcations/notificatoins.dart';
import 'package:buildbind/View/chat/chat_screen.dart';
import 'package:buildbind/View/widgets/sized_boxes.dart';
import 'package:buildbind/View/widgets/texts.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../Utills/AppColors.dart';
import '../bottom_nav_bar.dart';
import '../home/dashboard_screen.dart';

class MessagesView extends StatelessWidget {
  const MessagesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.all(1.w),
          child: GestureDetector(
            onTap: ()
            {
              context.navigateAndReplace(BottomNavigation());
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
        ),
        toolbarHeight: 5.h,),

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
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>NotificationView()));
                        },
                        child: Container(
                          width: 40.w,
                          height: 10.h,
                          padding: EdgeInsets.all(2.w),
                          decoration: BoxDecoration(
                            color: APPCOLORS.WHITE,
                            borderRadius: BorderRadius.circular(8.w),
                          ),
                          child:   Center(child: Text("Notifications",style:TextStyle(color:APPCOLORS.PRIMARY,fontSize: 12.sp))),

                        ),
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
              hsizedbox2,
          
              LabelText(text: 'All Chats'),
          
              hsizedbox1,
          
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatScreen()));
                },
                child: Container(
                  width: 100.w,
                  height: 12.h,
                  padding: EdgeInsets.all(4.w),
                  decoration: BoxDecoration(
                    color: APPCOLORS.GREY,
                    borderRadius: BorderRadius.circular(8.w),
                  ),
                  child:  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
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

                      SizedBox(
                        width: 4.w,
                      ),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              BoldText(text: "Aneeq Ahmed"),
                              wsizedbox7,
                              Text("8:45 PM",style: TextStyle(color: APPCOLORS.BLACK.withOpacity(0.8),fontSize:9.sp,fontWeight: FontWeight.normal),),

                            ],
                          ),
                          hsizedbox1,
                          SmallText(text: "Bid on your I-14 house project."),
                          hsizedbox2,
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
