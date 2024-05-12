
import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:buildbind/Models/message_model.dart';
import 'package:buildbind/Utills/extentions/navigation_extension.dart';
import 'package:buildbind/View/widgets/sized_boxes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../Models/chat_model.dart';
import '../../Services/chat_service.dart';
import '../../Utills/AppColors.dart';
import '../widgets/texts.dart';
import 'package:provider/provider.dart';




class ChatScreen extends StatefulWidget {
  const ChatScreen({
    required this.my_id,
    required this.contracotr_id,
    required this.chat_id,
    super.key});

  final String my_id;
  final String contracotr_id;
  final String chat_id;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  var chatservice =ChatService();



  
  
  Future<void> _sendMessage(String text)async
  {
    Message message=Message(
      senderID: widget.my_id,
      content: text,
      messageType: 'Text',
      sentAt: Timestamp.fromDate(DateTime.now()).toString(),
    );
    await chatservice.sendChatMessage(widget.my_id, widget.contracotr_id, message);
  }

  var _messagecontroller= TextEditingController();


  @override
  void initState() {
    var ctrl=context.read<ChatService>();
    // Timer.periodic(Duration(seconds: 3), (timer) {

    ctrl.printChatMessages(widget.my_id, widget.contracotr_id);
      // ctrl.getChatMessages(widget.my_id,widget.contracotr_id);
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 8.h,
        leading: Padding(
          padding: EdgeInsets.all(1.w),
          child: GestureDetector(
            onTap: (){
         context.navigateBack();
            },
            child:
            Container(
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
title: Row(
  mainAxisAlignment: MainAxisAlignment.start,
  children: [


    Container(
      width: 6.h,
      height: 6.h,
      decoration: BoxDecoration(
        border: Border.all(width:1.w,color: APPCOLORS.WHITE ),
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage('assets/images/image 29.png'), // Replace with your photo asset path
          fit: BoxFit.cover,
        ),
      ),
    ),

    wsizedbox2,
    BoldText(text: "Aneeq Ahmed"),
    hsizedbox1,

    // Container(
    //   width: 6.h,
    //   height: 6.h,
    //   decoration: BoxDecoration(
    //     color: APPCOLORS.GREY,
    //     shape: BoxShape.circle,
    //   ),
    //   child: Icon(
    //     Icons.call,
    //   ),
    // ),
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
          height: 90.h,
          decoration: BoxDecoration(
            color: APPCOLORS.GREY,
           borderRadius: BorderRadius.all(Radius.circular(8.w)),
          ),
          child: Padding(
            padding: EdgeInsets.all(4.w),
            child: Column(
              children: [
                Expanded(
                  child:Consumer<ChatService>(builder: (context, value, child) {


                    return
                      Container(
                        child:Column(
                          children: [
                            // Padding(
                            //   padding: EdgeInsets.all(4.w),
                            //   child: Align(
                            //     alignment: Alignment.center,
                            //     child: Container(
                            //       width: 18.h,
                            //       height: 4.h,
                            //       decoration: BoxDecoration(
                            //         color: APPCOLORS.PRIMARY.withOpacity(0.8),
                            //         borderRadius: BorderRadius.all(Radius.circular(8.w)),
                            //       ),
                            //       child: Center(child: Text("December 12,2023",style: TextStyle(color: APPCOLORS.WHITE,fontSize:10.sp,fontWeight: FontWeight.normal),)),
                            //     ),
                            //   ),
                            // ),
                           Expanded(
                             child: ListView.builder(
                               // shrinkWrap: true,
                                 itemCount: value. messagesList.length,
                                 itemBuilder: (context, index) {
                                   print( value. messagesList[index].senderID);
                                   print( widget.my_id);
                               return
                                 value. messagesList[index].senderID==widget.my_id?
                                 Padding(
                                   padding:  EdgeInsets.all(4.0),
                                   child: Align(
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
                                         value. messagesList[index].content!,
                                         style: TextStyle(
                                           color: Colors.black,
                                         ),
                                       ),
                                     ),
                                   ),
                                 ):
                                 Padding(
                                   padding: const EdgeInsets.all(4.0),
                                   child: Align(
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
                                        value. messagesList[index].content!,
                                         style: TextStyle(
                                           color: Colors.white,
                                         ),
                                       ),
                                     ),
                                   ),
                                 );
                             }),
                           ),
                          ],
                        ),
                      );
                  },)
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: EdgeInsets.all(2.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8.w)),
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        // Container(
                        //   decoration: BoxDecoration(
                        //     shape: BoxShape.circle,
                        //     color: Colors.green,
                        //   ),
                        //   padding: EdgeInsets.all(8.0),
                        //   child: Icon(
                        //     Icons.camera_alt,
                        //     color: Colors.white,
                        //   ),
                        // ),
                        SizedBox(width: 8.0),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.white,
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                            child: TextField(
                              controller: _messagecontroller,
                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                hintText: 'Type your message...',
                                hintStyle: TextStyle(color: Colors.black),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 8.0),
                        GestureDetector(
                          onTap: (){
                            Future.delayed(Duration(seconds: 2), () {
                          _messagecontroller.clear();
                            });
                            _sendMessage(_messagecontroller.text);

                          },
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.green,
                            ),
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.send,
                              color: Colors.white,
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
        ),
      ),
    );
  }
}
