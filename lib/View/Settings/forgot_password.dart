import 'package:buildbind/Controllers/auth_controller.dart';
import 'package:buildbind/Controllers/user_local_conrtoller.dart';
import 'package:buildbind/View/show_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../Utills/AppColors.dart';
import '../widgets/sized_boxes.dart';
import '../widgets/texts.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({
    required this.phone,
    super.key});

  final String phone;

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {

  var _password = TextEditingController();
  var _confirm_password = TextEditingController();


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


              hsizedbox2,
              Container(
                padding: EdgeInsets.all(2.w),
                decoration: BoxDecoration(
                  color: APPCOLORS.GREY,
                  border: Border.all(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: TextField(

                  controller: _password,
                  decoration: InputDecoration(
                    hintText: 'New Password',
                    border: InputBorder.none,
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
                  controller: _confirm_password,
                  decoration: InputDecoration(
                    hintText: 'Confirm Password',
                    border: InputBorder.none,
                  ),
                ),
              ),


              hsizedbox6,

              GestureDetector(
                onTap: () {

                  var ctrl= AuthController();
                  if(_password.text!=_confirm_password.text)
                    {
                      showSnackbar(context, "Password Don't match");

                    }
                  else{
                    ctrl.forgotPassword(widget.phone, _confirm_password.text, context);

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
