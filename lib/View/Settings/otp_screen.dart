import 'package:buildbind/Controllers/user_local_conrtoller.dart';
import 'package:buildbind/Services/send_otp.dart';
import 'package:buildbind/Utills/extentions/navigation_extension.dart';
import 'package:buildbind/View/Settings/forgot_password.dart';
import 'package:buildbind/View/show_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../Utills/AppColors.dart';
import '../widgets/sized_boxes.dart';
import '../widgets/texts.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({

    super.key});



  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  var _phonecontroller = TextEditingController();
  var _otpcotroller = TextEditingController();
  String? otp;


  @override
  void initState() {

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: HeadingText(text: 'Uppdate Profile'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(4.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              hsizedbox5,
              hsizedbox6,

              Container(
                padding: EdgeInsets.all(2.w),
                decoration: BoxDecoration(
                  color: APPCOLORS.GREY,
                  border: Border.all(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: TextFormField(
                  controller: _phonecontroller,
                  decoration: InputDecoration(
                    prefixText: '+92 ',
                    prefixStyle: TextStyle(color:Colors.black),
                    hintText: 'Phone',
                    border: InputBorder.none,
                  ),
                ),
              ),
              hsizedbox2,
              GestureDetector(
                onTap: () async{

                  var ctrl= SendOtp();

                   otp= await ctrl.sendOtp('+92${_phonecontroller.text}', context);

                },
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 6.h,
                    width: 40.w,
                    padding: EdgeInsets.all(2.w),
                    decoration: BoxDecoration(
                      color: APPCOLORS.SECONDARY,
                      border: Border.all(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Center(
                      child: Text('Send OTP', style: TextStyle(color: APPCOLORS.WHITE,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold),),
                    ),
                  ),
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
                child: TextField(
                  controller: _otpcotroller,
                  decoration: InputDecoration(
                    hintText: 'Otp',
                    border: InputBorder.none,
                  ),
                ),
              ),


              hsizedbox6,

              GestureDetector(
                onTap: () {

                  if(_otpcotroller.text==otp)
                    {
                      context.navigateTo(ForgotPassword(phone: '+92${_phonecontroller.text}',));
                    }
                  else
                    {
                      showSnackbar(context, 'Incorrect Otp');
                    }

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
                    child: Text('Confirm', style: TextStyle(color: APPCOLORS.WHITE,
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
