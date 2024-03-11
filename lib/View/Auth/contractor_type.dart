import 'package:buildbind/Utills/AppColors.dart';
import 'package:buildbind/View/Auth/register_screen.dart';
import 'package:buildbind/View/Auth/representative_regitration.dart';
import 'package:buildbind/View/widgets/sized_boxes.dart';
import 'package:buildbind/View/widgets/texts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sizer/sizer.dart';

class ContractorType extends StatelessWidget {
  const ContractorType({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: HeadingText(text: 'Contractor Type',),
      ),
      body: Container(
        padding: EdgeInsets.all(4.w),
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SimpleText(text: 'Your are one step away from becoming a contractor'),
            hsizedbox2,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                HeadingText2(text: 'Select the Type of contractor'),
                GestureDetector(
                    onTap: (){
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: const Text('Select Registered Company if you are registered with Pakistan Engineering Council otherwise select Individual and provide you company details '),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Icon(Icons.info_outline)),
              ],
            ),
            hsizedbox4,
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterScreen(from: true)));
              },
              child: Container(
                padding: EdgeInsets.all(4.w),
                height:15.h,
                width: 100.w,
                decoration: BoxDecoration(
                  color: APPCOLORS.GREY,
                  borderRadius: BorderRadius.all(Radius.circular(4.w)),

                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    HeadingText2(text: 'Registered Company'),
                    Icon(Icons.arrow_forward),
                  ],
                ),
              ),
            ),
            hsizedbox2,
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>RepresentativeRegistration(type:'B',)));

              },
              child: Container(
                padding: EdgeInsets.all(4.w),
                height:15.h,
                width: 100.w,
                decoration: BoxDecoration(
                  color: APPCOLORS.GREY,
                  borderRadius: BorderRadius.all(Radius.circular(4.w)),

                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    HeadingText2(text: 'Individual'),
                    Icon(Icons.arrow_forward),
                  ],
                ),
              ),
            ),



          ],
        ),
      ),
    );
  }
}
