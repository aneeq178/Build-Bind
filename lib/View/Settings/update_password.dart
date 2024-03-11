import 'package:buildbind/View/show_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../Utills/AppColors.dart';
import '../widgets/sized_boxes.dart';
import '../widgets/texts.dart';

class UpdatePassword extends StatefulWidget {
  const UpdatePassword({super.key});

  @override
  State<UpdatePassword> createState() => _UpdatePasswordState();
}

class _UpdatePasswordState extends State<UpdatePassword> {
  var _oldpasscontroller = TextEditingController();
  var _newpasscontrller = TextEditingController();
  var _confirmpasscontrller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: HeadingText(text: 'Change Password'),
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
                child: TextField(
                  controller: _oldpasscontroller,
                  decoration: InputDecoration(
                    hintText: 'old password',
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
                  controller: _newpasscontrller,
                  decoration: InputDecoration(
                    hintText: 'new password',
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
                  controller: _confirmpasscontrller,
                  decoration: InputDecoration(
                    hintText: 'confirm password',
                    border: InputBorder.none,
                  ),
                ),
              ),


              hsizedbox6,

              GestureDetector(
                onTap: () {

                  if(_newpasscontrller.text==_confirmpasscontrller.text)
                    {
                      showSnackbar(context, 'Password Updated');
                    }
                  else{
                    showSnackbar(context, 'Passwords do not match');
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
