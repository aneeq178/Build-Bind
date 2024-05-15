import 'package:buildbind/Utills/extentions/navigation_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../Controllers/contractor_controller.dart';
import '../../../Utills/AppColors.dart';
import '../../widgets/sized_boxes.dart';
import '../../widgets/texts.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({
    required this.tokens,
    super.key});

  final String tokens;

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 1,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(4.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      context.navigateBack();
                    },
                    child: Container(
                      width: 6.h,
                      height: 6.h,
                      decoration: BoxDecoration(
                        color: APPCOLORS.GREY,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.arrow_back_ios_new,
                      ),
                    ),
                  ),
                  wsizedbox4,
                  wsizedbox6,
                  HeadingText2(text: 'Buy Tokens'),
                ],
              ),
              Container(
                padding: EdgeInsets.all(4.w),
                child: Column(
                  children: [
                    HeadingText2(text: 'Details'),
                    hsizedbox2,
                    Container(
                      padding: EdgeInsets.all(4.w),
                      height: 20.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0, 1),
                              blurRadius: 6,
                              spreadRadius: 2,
                            ),
                          ],
                          color: APPCOLORS.GREY,
                          borderRadius: BorderRadius.all(Radius.circular(4.w))
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Tokens',style: TextStyle(color: APPCOLORS.BLACK,fontSize:12.sp)),
                              Text(widget.tokens,style: TextStyle(color: APPCOLORS.BLACK,fontSize:12.sp,fontWeight: FontWeight.bold)),
                            ],
                          ),
                          hsizedbox2,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Payment Method',style: TextStyle(color: APPCOLORS.BLACK,fontSize:12.sp)),
                              Text('Easy Paisa',style: TextStyle(color: APPCOLORS.BLACK,fontSize:12.sp,fontWeight: FontWeight.bold)),
                            ],
                          ),
                          hsizedbox4,
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   children: [
                          //     Text('Total',style: TextStyle(color: APPCOLORS.BLACK,fontSize:12.sp)),
                          //     Text('10.5 Million',style: TextStyle(color: APPCOLORS.BLACK,fontSize:12.sp,fontWeight: FontWeight.bold)),
                          //   ],
                          // ),
        
                        ],
                      ),
                    ),
                    hsizedbox2,
                    HeadingText2(text: 'Enter Account Number'),
                    Container(
                      padding: EdgeInsets.all(2.w),
                      decoration: BoxDecoration(
                        color: APPCOLORS.GREY,
                        border: Border.all(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: const Row(
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'account no',
                                prefixText: '+92 ',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    hsizedbox6,
                    hsizedbox6,
                    hsizedbox6,
                    Align(
                      alignment: Alignment.center,
                      child: GestureDetector(
                        onTap: (){
                          var ctrl=ContractorController();
                          ctrl.BuyToken(widget.tokens, context);
                        },
                        child: Container(
                          width: 80.w,
                          height: 7.h,
                          decoration: BoxDecoration(
                            color: APPCOLORS.SECONDARY,
        
                            borderRadius: BorderRadius.circular(4.w),
                          ),
                          child: Center(child: Text('Next',style: TextStyle(color: APPCOLORS.WHITE,fontSize:14.sp,fontWeight: FontWeight.bold))),
        
                        ),
                      ),
                    ),
        
        
        
        
                  ],
                ),
              ),
        
            ],
          ),
        ),
      ),

    );
  }
}
