import 'package:buildbind/Utills/AppColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

void showSnackbar(BuildContext context, String message) {
  OverlayEntry overlayEntry;

  overlayEntry = OverlayEntry(
    builder: (context) => Positioned(
      bottom: 15.w,
      left: 16.w,
      child: Material(
        color: Colors.transparent,
        child: Container(
          alignment: Alignment.center,
          width: 70.w,
          padding: EdgeInsets.all(3.w),
          decoration: BoxDecoration(
            color: APPCOLORS.PRIMARY,
            borderRadius: BorderRadius.circular(20.w),
          ),
          child:Text(message,style: TextStyle(color: Colors.white),),
        ),
      ),
    ),
  );


  Overlay.of(context).insert(overlayEntry);
  Future.delayed(Duration(seconds: 1), () {
    overlayEntry.remove();
  });
}

