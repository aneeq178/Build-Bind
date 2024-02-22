import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../Utills/AppColors.dart';
import '../../widgets/sized_boxes.dart';
import '../../widgets/texts.dart';

class ProjectFeatureWidget extends StatelessWidget {
  const ProjectFeatureWidget({
    required this.title,
    required this.quantity,
    super.key,
  });

  final String title;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2.w),
      width: 100.w,
      height: 8.h,
      decoration: BoxDecoration(
        color: APPCOLORS.GREY,
        borderRadius: BorderRadius.all(Radius.circular(6.w)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BoldText(text: title),
          Container(
            child: Row(
              children: [
                Container(
                  width: 10.w,
                  height: 4.h,
                  decoration: BoxDecoration(
                    color: APPCOLORS.PRIMARY,
                    borderRadius: BorderRadius.all(Radius.circular(3.w)),
                  ),
                  child: Center(child: Icon(Icons.add,color: Colors.white,)),),

                wsizedbox2,
                BoldText(text: quantity.toString()),
                wsizedbox2,

                Container(
                  width: 10.w,
                  height: 4.h,
                  decoration: BoxDecoration(
                    color: APPCOLORS.PRIMARY,
                    borderRadius: BorderRadius.all(Radius.circular(3.w)),
                  ),
                  child: Center(child: Icon(Icons.add,color: Colors.white,)),),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SelectionContainerWidget extends StatelessWidget {
  const SelectionContainerWidget({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 4.w,right: 4.w,top: 2.h,bottom: 2.h),

      decoration: BoxDecoration(
        color: APPCOLORS.GREY,
        border: Border.all(color: Colors.transparent),
        borderRadius: BorderRadius.circular(8.w),
      ),
      child:
      Center(child: Text(text,style: TextStyle(color: APPCOLORS.BLACK,fontSize:11.sp,fontWeight: FontWeight.normal),)),
    );
  }
}