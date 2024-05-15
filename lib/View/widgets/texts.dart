import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';

import '../../Utills/AppColors.dart';

class HeadingText extends StatelessWidget {
  const HeadingText({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text,style: TextStyle(color: APPCOLORS.PRIMARY,fontSize:16.sp,fontWeight: FontWeight.bold),);
  }
}

class HeadingTextW extends StatelessWidget {
  const HeadingTextW({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text,style: TextStyle(color: APPCOLORS.WHITE,fontSize:16.sp,fontWeight: FontWeight.bold),);
  }
}

class HeadingText2 extends StatelessWidget {
  const HeadingText2({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text,style: TextStyle(color: APPCOLORS.PRIMARY,fontSize:13.sp,fontWeight: FontWeight.bold));
  }
}

class LabelText extends StatelessWidget {
  const LabelText({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text,style: TextStyle(color: APPCOLORS.PRIMARY,fontSize:15.sp,fontWeight: FontWeight.bold),);
  }
}

class SimpleText extends StatelessWidget {
  const SimpleText({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text,style: TextStyle(color: APPCOLORS.PRIMARY,fontSize:12.sp,fontWeight: FontWeight.normal),);
  }
}

class BoldText extends StatelessWidget {
  const BoldText({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text,style: TextStyle(color: APPCOLORS.PRIMARY,fontSize:12.sp,fontWeight: FontWeight.bold),);
  }
}

class SmallText extends StatelessWidget {
  const SmallText({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text,style: TextStyle(color: APPCOLORS.BLACK,fontSize:10.sp,fontWeight: FontWeight.normal),);
  }
}
