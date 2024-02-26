import 'package:buildbind/View/widgets/texts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../Utills/AppColors.dart';

AppBar CustomAppBar(BuildContext context) {
  return AppBar(
    leading:    Padding(
      padding: EdgeInsets.all(1.w),
      child: GestureDetector(
        onTap: (){
          Navigator.pop(context);
        },
        child: Container(
          width: 8.h,
          height: 8.h,
          decoration: BoxDecoration(
            color: APPCOLORS.GREY,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Icon(
              Icons.arrow_back_ios,
            ),
          ),
        ),
      ),
    ),
    actions: [
      Padding(
        padding: EdgeInsets.all(3.w),
        child: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Container(
            width: 12.h,
            height: 7.h,
            decoration: BoxDecoration(
              color: APPCOLORS.GREY,
              borderRadius: BorderRadius.all(Radius.circular(6.w)),
            ),
            child: Center(
              child: SimpleText( text: 'skip',),
            ),
          ),
        ),
      ),
    ],
  );
}
