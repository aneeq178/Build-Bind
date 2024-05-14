import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../Utills/AppColors.dart';
import '../Auth/login_screen.dart';
import '../widgets/sized_boxes.dart';
import '../widgets/texts.dart';

class OnBoardingTwo extends StatefulWidget {
  const OnBoardingTwo({super.key});

  @override
  State<OnBoardingTwo> createState() => _OnBoardingTwoState();
}

class _OnBoardingTwoState extends State<OnBoardingTwo> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
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

                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(Icons.home,color: APPCOLORS.SECONDARY,),
              ),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.all(3.w),
            child: GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
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
      ),

      body: Padding(
        padding: EdgeInsets.all(4.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            hsizedbox2,
            const HeadingText(text: 'Choose the best\nConstructors'),
            hsizedbox2,
            const SimpleText(text: 'Find the best constructors.Choose from tens of the listed constructors',),

            // hsizedbox5,
            hsizedbox3,
            // hsizedbox2,
            Container(
              width: 90.w,
              height: 62.h,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        'assets/images/ob1.png'
                    ),
                  )
              ),

              child: Padding(
                padding:  EdgeInsets.all(4.w),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child:
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                    },
                    child: Container(
                      width: 50.w,
                      height: 8.h,
                      padding: EdgeInsets.all(2.w),
                      decoration: BoxDecoration(
                        color: APPCOLORS.SECONDARY,
                        border: Border.all(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Center(
                        child:Text('Next',style: TextStyle(color: APPCOLORS.WHITE,fontSize:16.sp,fontWeight: FontWeight.bold),),
                      ),
                    ),
                  ),

                ),
              ),
            ),

          ],
        ),
      ),


    );
  }
}
