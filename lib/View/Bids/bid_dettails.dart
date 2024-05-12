

import 'dart:developer';

import 'package:buildbind/Models/bid_model.dart';
import 'package:buildbind/Utills/extentions/navigation_extension.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../Controllers/chat_controller.dart';
import '../../Services/api_calls.dart';
import '../../Services/chat_service.dart';
import '../../Utills/AppColors.dart';
import '../../Utills/utills.dart';
import '../chat/chat_screen.dart';
import '../widgets/sized_boxes.dart';
import '../widgets/texts.dart';

class BidingDetails extends StatefulWidget {
  const BidingDetails({
    required this.bid,
    super.key});

  final Bid bid;

  @override
  State<BidingDetails> createState() => _BidingDetailsState();
}

class _BidingDetailsState extends State<BidingDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 1,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(4.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 100.w,
                height: 30.h,
                padding: EdgeInsets.all(2.w),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/image 27.png',
                      // 'assets/images/companies.png'
                    ), // Replace with your image asset path
                    fit: BoxFit.cover,
                  ),
                  color: APPCOLORS.GREY,
                  border: Border.all(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(8.w),
                ),
              ),

              hsizedbox2,
              Row(
                children: [
                  BoldText(text:'Project'),
                  wsizedbox2,
                  Text(widget.bid.projectName,style:TextStyle(color:Colors.black,fontSize: 8.sp)),
                ],
              ),
              hsizedbox1,
              Row(
                children: [
                  BoldText(text:'Company/ Contracotr Name'),
                  wsizedbox2,
                  Text(widget.bid.contractorName,style:TextStyle(color:Colors.black,fontSize: 8.sp)),
                ],
              ),
              hsizedbox4,
              Container(
                padding: EdgeInsets.all(2.w),
                decoration: BoxDecoration(
                  color: APPCOLORS.GREY,
                  border: Border.all(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    HeadingText2(text: 'Estimated Cost'),
                    HeadingText2(text: widget.bid.estimatedCost.toString()),
                  ],
                ),
              ),
              hsizedbox2,
              Container(
                padding: EdgeInsets.all(2.w),
                decoration: BoxDecoration(
                  color: APPCOLORS.GREY,
                  border: Border.all(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    HeadingText2(text: 'Biding Cost'),
                    HeadingText2(text: widget.bid.bidAmount.toString()),
                  ],
                ),
              ),

              hsizedbox4,
              Container(
                padding: EdgeInsets.all(2.w),
                decoration: BoxDecoration(
                  color: APPCOLORS.GREY,
                  border: Border.all(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Center(child: SimpleText(text:widget.bid.bidDescription)),

              ),
              hsizedbox4,

              Align(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: (){
                    // _pickPDF(context);
                  },
                  child: Container(
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
                          Text('Detailed Quotation',style: TextStyle(color: APPCOLORS.WHITE,fontSize:12.sp,fontWeight: FontWeight.bold)),
                          wsizedbox2,
                          Icon(Icons.drive_folder_upload_outlined,color: Colors.white,),

                        ],
                      ),
                    ),
                  ),
                ),
              ),

              hsizedbox4,
              GestureDetector(
                onTap: () async{
                  String id =await ApiCall.getIds();

                  log('user id ${id}');
                  log('contracotr id ${widget.bid.contracotrid}');
                  var chat_obj=ChatService();

                  final chatExist= await chat_obj.checkChatExists(id,widget.bid.contracotrid.toString());

                  var ctrl=ChatController();

                  if(!chatExist)
                  {
                    await chat_obj.createChat(id, widget.bid.contracotrid.toString(),context);
                  }
                  else{
                    print('chat exist');
                  }
                  String chatID = generateChatID(id1:id , id2: widget.bid.contracotrid.toString());

                  context.navigateTo(ChatScreen(chat_id:chatID ,contracotr_id:widget.bid.contracotrid.toString() ,my_id: id,));

                },
                child: Container(
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







            ],
          ),
        ),
      ),
    );
  }


}
