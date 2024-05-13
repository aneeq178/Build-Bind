import 'package:buildbind/Controllers/user_local_conrtoller.dart';
import 'package:buildbind/View/show_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../Utills/AppColors.dart';
import '../widgets/sized_boxes.dart';
import '../widgets/texts.dart';

class UpdateUser extends StatefulWidget {
  const UpdateUser({
    required this.name,
    required this.phone,
    required this.email,
    super.key});

  final name;
  final email;
  final phone;


  @override
  State<UpdateUser> createState() => _UpdateUserState();
}

class _UpdateUserState extends State<UpdateUser> {
  var _namecontroller = TextEditingController();
  var _emailcontrller = TextEditingController();
  var _phonepasscontrller = TextEditingController();


  @override
  void initState() {
    _namecontroller.text=widget.name;
    _emailcontrller.text=widget.email;
    _phonepasscontrller.text=widget.phone;
    // TODO: implement initState
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
                child: TextField(
                  controller: _namecontroller,
                  decoration: InputDecoration(
                    hintText: 'Name',
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
                  enabled: false,

                  controller: _emailcontrller,
                  decoration: InputDecoration(
                    hintText: 'email',
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
                  controller: _phonepasscontrller,
                  decoration: InputDecoration(
                    hintText: 'Phone',
                    border: InputBorder.none,
                  ),
                ),
              ),


              hsizedbox6,

              GestureDetector(
                onTap: () {

                  var ctrl= UserLocalController();

                  ctrl.updateUser(_phonepasscontrller.text, _namecontroller.text, context);
                  // if(_newpasscontrller.text==_confirmpasscontrller.text)
                  // {
                  //   showSnackbar(context, 'Password Updated');
                  // }
                  // else{
                  //   showSnackbar(context, 'Passwords do not match');
                  // }

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
