import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../Providers/listing_providers.dart';
import '../../../Utills/AppColors.dart';
import '../../widgets/sized_boxes.dart';
import '../../widgets/texts.dart';

class ProjectFeatureWidget extends StatelessWidget {
  const ProjectFeatureWidget({
    required this.title,
    required this.quantity,
    required this.num,

    super.key,
  });

  final String title;
  final int quantity;
  final int num;

  @override
  Widget build(BuildContext context) {
    var ctrl=context.read<ListingController>();

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
                GestureDetector(
                  onTap:(){
                    if(quantity>0)
                      {
                        if(num==1)
                        {
                          ctrl.updateFloor(quantity-1);
                        }
                        else if(num==2)
                        {
                          ctrl.updateMarla(quantity-1);

                        }
                        else if(num==3)
                        {
                          ctrl.updateRoom(quantity-1);

                        }
                        else if(num==4)
                        {
                          ctrl.updateWR(quantity-1);

                        }
                        else if(num==6)
                        {
                          ctrl.updateShops(quantity-1);

                        }
                        else if(num==7)
                        {
                          ctrl.updateRF(quantity-1);

                        }
                        else
                        {
                          ctrl.updateKitchen(quantity-1);

                        }
                      }


                  },
                  child: Container(
                    width: 10.w,
                    height: 4.h,
                    decoration: BoxDecoration(
                      color: APPCOLORS.PRIMARY,
                      borderRadius: BorderRadius.all(Radius.circular(3.w)),
                    ),
                    child: Center(child: Icon(Icons.remove,color: Colors.white,)),),
                ),

                wsizedbox2,
                BoldText(text: quantity.toString()),
                wsizedbox2,

                GestureDetector(
                  onTap:(){
                    if(num==1)
                    {
                      ctrl.updateFloor(quantity+1);
                    }
                    else if(num==2)
                    {
                      ctrl.updateMarla(quantity+1);

                    }
                    else if(num==3)
                    {
                      ctrl.updateRoom(quantity+1);

                    }
                    else if(num==4)
                    {
                      ctrl.updateWR(quantity+1);

                    }
                    else if(num==6)
                    {
                      ctrl.updateShops(quantity+1);

                    }
                    else if(num==7)
                    {
                      ctrl.updateRF(quantity+1);

                    }

                    else
                    {
                      ctrl.updateKitchen(quantity+1);

                    }

                  },

                  child: Container(
                    width: 10.w,
                    height: 4.h,
                    decoration: BoxDecoration(
                      color: APPCOLORS.PRIMARY,
                      borderRadius: BorderRadius.all(Radius.circular(3.w)),
                    ),
                    child: Center(child: Icon(Icons.add,color: Colors.white,)),),
                ),
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
    required this.isSelected,
  });
  final String text;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 4.w,right: 4.w,top: 2.h,bottom: 2.h),
      decoration: BoxDecoration(
        color: isSelected?APPCOLORS.PRIMARY:APPCOLORS.GREY,
        border: Border.all(color: Colors.transparent),
        borderRadius: BorderRadius.circular(8.w),
      ),
      child:
      Center(child: Text(text,style: TextStyle(color:isSelected?APPCOLORS.WHITE:APPCOLORS.BLACK,fontSize:11.sp,fontWeight: FontWeight.normal),)),
    );
  }
}