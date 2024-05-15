import 'package:buildbind/Controllers/contractor_controller.dart';
import 'package:buildbind/Models/contractor_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../Utills/AppColors.dart';
import '../MyProjects/project_detaills.dart';
import '../widgets/sized_boxes.dart';
import '../widgets/texts.dart';

class Rattings extends StatefulWidget {
  const Rattings({super.key});

  @override
  State<Rattings> createState() => _RattingsState();
}

class _RattingsState extends State<Rattings> {

  @override
  void initState() {
    var ctrl= context.read<ContractorController>();
    ctrl.getOngoingProjects(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0,),
      body: Container(
        padding: EdgeInsets.all(4.w),
        child:SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 6.h,
                      height: 6.h,
                      decoration: BoxDecoration(
                        color: APPCOLORS.GREY,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.arrow_back_ios,
                      ),
                    ),
                  ),
                  wsizedbox7,
                  const HeadingText(text: 'Ratings'),

                ],
              ),

              hsizedbox2,

              Consumer<ContractorController>(builder: (context, data, child) {
                return ListView.builder(
                  itemCount: 2,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return  Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: GestureDetector(
                        onTap: (){

                        },
                        child: Container(
                          width: 75.w,
                          height: 20.h,
                          padding: EdgeInsets.all(2.w),
                          decoration: BoxDecoration(
                            color: APPCOLORS.GREY,
                            border: Border.all(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(8.w),
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 35.w, // Adjust the width as needed
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(4.w)),
                                  image: DecorationImage(
                                    image: AssetImage(
                                      '',
                                      // 'assets/images/companies.png'
                                    ), // Replace with your image asset path
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child: Container(
                                  padding: EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      // Container(
                                      //   padding: EdgeInsets.all(8.0),
                                      //   decoration: BoxDecoration(
                                      //     shape: BoxShape.circle,
                                      //     color: Colors.white,
                                      //   ),
                                      //   child: Icon(
                                      //     Icons.favorite_border,
                                      //     size: 24.0,
                                      //   ),
                                      // ),

                                    ],
                                  ),
                                ),
                              ),

                              Padding(
                                padding: EdgeInsets.all(4.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'asdasd',
                                      style: TextStyle(
                                        color:APPCOLORS.PRIMARY,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    hsizedbox1,
                                    Row(
                                      children: [
                                        Icon(Icons.star,color: Colors.yellow,),
                                        Text(
                                          '4.3',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 10.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                    hsizedbox1,
                                    Row(
                                      children: [
                                        Icon(Icons.location_on_sharp),
                                        Text(
                                          'location isl',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 10.sp,
                                          ),
                                        ),
                                      ],
                                    ),

                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },);


              })

            ],
          ),
        ),
      ),

    );
  }
}
