import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../Utills/AppColors.dart';
import '../../widgets/sized_boxes.dart';
import '../../widgets/texts.dart';
import '../contractor_details.dart';

class ContractorBiding extends StatefulWidget {
  const ContractorBiding({super.key});

  @override
  State<ContractorBiding> createState() => _ContractorBidingState();
}

class _ContractorBidingState extends State<ContractorBiding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 1,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(4.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 100.w,
                height: 30.h,
                padding: EdgeInsets.all(2.w),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/image 27.png',
                      // 'assets/images/companies.png'
                    ), // Replace with your image asset path
                    fit: BoxFit.cover,
                  ),
                  color: APPCOLORS.GREY,
                  border: Border.all(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(8.w),
                ),
              ),

              hsizedbox2,
              const LabelText(text: '15 Marla, 2 Floor Modern House'),
              hsizedbox1,
              Text("I have a 5 marla plot in Taj residence and I want to construct house with modern front elevation ",style:TextStyle(color:Colors.black,fontSize: 8.sp)),
              hsizedbox1,







            ],
          ),
        ),
      ),
    );
  }
}
