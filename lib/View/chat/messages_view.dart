import 'package:buildbind/Controllers/chat_controller.dart';
import 'package:buildbind/Services/chat_service.dart';
import 'package:buildbind/Utills/extentions/navigation_extension.dart';
import 'package:buildbind/View/chat/chat_screen.dart';
import 'package:buildbind/View/widgets/sized_boxes.dart';
import 'package:buildbind/View/widgets/texts.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../Utills/AppColors.dart';
import '../Bids/bids_screen.dart';
import '../bottom_nav_bar.dart';
import '../show_snackbar.dart';

class MessagesView extends StatefulWidget {
  const MessagesView({super.key});

  @override
  State<MessagesView> createState() => _MessagesViewState();
}

class _MessagesViewState extends State<MessagesView> {

  @override
  void initState() {

    var ctrl= context.read<ChatController>();
    ctrl.getChats(context);
    super.initState();
  }

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
                          child:   Center(child: Text("Bids",style:TextStyle(color:APPCOLORS.PRIMARY,fontSize: 12.sp))),

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

              Consumer<ChatController>(builder: (context, value, child) {

                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: value.chats.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:  EdgeInsets.all(2),
                      child: GestureDetector(
                          onTap: ()async{

                            var chat_obj=ChatService();

                            final chatExist= await chat_obj.checkChatExists(value.chats[index].userId.toString(),value.chats[index].contractorId.toString());

                            var hideLoading = showLoading(context, 'Please Wait..');

                            if(!chatExist)
                            {
                              await chat_obj.createChat('1', '2',context);
                            }
                            else{
                              print('chat exist');
                            }

                            hideLoading();
                            context.navigateTo(ChatScreen(my_id: value.chats[index].userId.toString(), contracotr_id:value.chats[index].contractorId.toString(),
                                chat_id: value.chats[index].chatId.toString()));

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
                                        BoldText(text: value.chats[index].representativeName??'Contractor'),
                                        wsizedbox7,
                                        // Text(,style: TextStyle(color: APPCOLORS.BLACK.withOpacity(0.8),fontSize:9.sp,fontWeight: FontWeight.normal),),

                                      ],
                                    ),
                                    hsizedbox1,
                                    SmallText(text: "'${value.chats[index].representativePosition??'abc'} from ${
                                        value.chats[index].companyName??'company'}'"),
                                    hsizedbox2,
                                  ],
                                ),

                              ],
                            ),
                          ),
                        ),
                    );
                },);
              },),




            ],
          ),
        ),
      ),
    );
  }
}
