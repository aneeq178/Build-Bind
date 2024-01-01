import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../Utills/AppColors.dart';
import '../Contractor/contractor_details.dart';
import '../widgets/sized_boxes.dart';
import '../widgets/texts.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(4.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              hsizedbox2,
              LabelText(text: 'Favourite Contractors'),
              hsizedbox1,
              Text("Favourite Contractors for you",style:TextStyle(color:Colors.black,fontSize: 8.sp)),
              hsizedbox1,

              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ContractorDetails()));
                },
                child: Container(
                  width: 50.w,
                  height: 30.h,
                  padding: EdgeInsets.all(2.w),
                  decoration: BoxDecoration(
                    color: APPCOLORS.GREY,
                    border: Border.all(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(8.w),
                  ),

                  child: Padding(
                    padding: EdgeInsets.all(1.w),
                    child: Column(
                      children: [
                        Container(
                          width: 45.w,
                          height: 20.h,
                          padding: EdgeInsets.all(2.w),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                'assets/images/companies.png',
                                // 'assets/images/companies.png'
                              ), // Replace with your image asset path
                              fit: BoxFit.cover,
                            ),
                            color: APPCOLORS.GREY,
                            border: Border.all(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(8.w),
                          ),
                        ),

                        hsizedbox1,
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text("ABC LTD",style:TextStyle(color:APPCOLORS.PRIMARY,fontWeight: FontWeight.bold,fontSize: 10.sp))),

                        Row(
                          children: [
                            Icon(Icons.star),
                            Text("4.8",style:TextStyle(color:APPCOLORS.PRIMARY,fontSize: 8.sp)),
                            Icon(Icons.location_on_sharp),
                            Text("Rawalpindi",style:TextStyle(color:APPCOLORS.PRIMARY,fontSize: 8.sp)),
                          ],
                        ),



                      ],
                    ),
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
