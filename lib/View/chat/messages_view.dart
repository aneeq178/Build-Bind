import 'package:buildbind/Services/chat_service.dart';
import 'package:buildbind/Utills/extentions/navigation_extension.dart';
import 'package:buildbind/View/Notifcations/notificatoins.dart';
import 'package:buildbind/View/chat/chat_screen.dart';
import 'package:buildbind/View/widgets/sized_boxes.dart';
import 'package:buildbind/View/widgets/texts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../Models/chat_model.dart';
import '../../Models/message_model.dart';
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
                onTap: ()async{

                  var chat_obj=ChatService();

                 final chatExist= await chat_obj.checkChatExists('1', '2');


                 if(!chatExist)
                   {
                     await chat_obj.createChat('1', '2');
                   }
                 else{
                   print('chat exist');
                 }

                context.navigateTo(ChatScreen());

                  // try {
                  //   QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('chats').get();
                  //   List<Chat> chats = [];
                  //   for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
                  //     Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;
                  //     List<Message> messages = [];
                  //     print(data);
                  //     if (data['messages'] != null) {
                  //       print(data['messages']);
                  //       // for (var messageData in data['messages']) {
                  //       //   messages.add(Message(
                  //       //     senderID: messageData['senderID'],
                  //       //     content: messageData['content'],
                  //       //     messageType: messageData['messageType'],
                  //       //     sentAt: messageData['sentAt'] != null ? (messageData['sentAt'] as Timestamp).toDate() : null,
                  //       //   ));
                  //       // }
                  //     }
                  //
                  //
                  //
                  //     print('chats length is');
                  //   }

                  // } catch (e) {
                  //   print('Error fetching chats: $e');
                  // }
                  // var chatservice =ChatService();
                  //
                  //  bool check=await chatservice.checkChatExists('2', '1');
                  //
                  //  print(check);
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatScreen()));
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
