import 'package:buildbind/Controllers/contractor_controller.dart';
import 'package:buildbind/Models/contractor_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../Utills/AppColors.dart';
import '../../Utills/utills.dart';
import '../MyProjects/project_detaills.dart';
import '../widgets/sized_boxes.dart';
import '../widgets/texts.dart';

class OnGoingProjects extends StatefulWidget {
  const OnGoingProjects({super.key});

  @override
  State<OnGoingProjects> createState() => _OnGoingProjectsState();
}

class _OnGoingProjectsState extends State<OnGoingProjects> {

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
                  const HeadingText(text: 'On Going Projects'),

                ],
              ),

              hsizedbox2,

              Consumer<ContractorController>(builder: (context, data, child) {
                return ListView.builder(
          itemCount: data.ongoinProjects.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
          return  Container(
            width: 95.w,
            height: 30.h,
            padding: EdgeInsets.all(2.w),
            decoration: BoxDecoration(
              color: APPCOLORS.GREY,
              border: Border.all(color: Colors.transparent),
              borderRadius: BorderRadius.circular(8.w),
            ),
            child: Row(
              children: [
                Container(
                  width: 37.w, // Adjust the width as needed
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(4.w)),
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/images/companies.png',
                        // 'assets/images/companies.png'
                      ), // Replace with your image asset path
                      fit: BoxFit.cover,
                    ),
                  ),
                  child:  Container(
                    width: 32.w, // Adjust the width as needed
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(4.w)),
                    ),
                    child:  Image.network(
                      '$BASEURL/${data.ongoinProjects[index].image1}',
                      errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                        return Center(
                          child: Image.asset('assets/images/main2.jpg'),
                        );
                      },
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.all(2.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                       data.ongoinProjects[index].pName!,
                        style: TextStyle(
                          color:APPCOLORS.PRIMARY,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      hsizedbox1,
                      Container(
                        width: 45.w,
                        child:  Text(
                          maxLines: 4,
                          data.ongoinProjects[index].pDetails!,
                          style: TextStyle(
                            color:APPCOLORS.BLACK,
                            fontSize: 8.sp,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      hsizedbox1,

                      Row(
                        children: [
                          Icon(Icons.location_on_sharp),
                          Text(
                            'G-13 Islamabad',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 10.sp,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'Budget: ${data.ongoinProjects[index].pBudget!}',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.bold
                        ),
                      ),

                      hsizedbox1,
                      Row(
                        children: [
                          GestureDetector(
                            onTap:(){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>ProjectDetaills(project:data.ongoinProjects[index],from:'B')));
                            },
                            child: Container(
                              height: 6.h,
                              padding: EdgeInsets.all(3.w),
                              decoration: BoxDecoration(
                                color: APPCOLORS.SECONDARY,
                                borderRadius: BorderRadius.all(Radius.circular(4.w)),
                              ),
                              child: Text('View Details',style: TextStyle(color: APPCOLORS.WHITE,fontSize:12.sp,fontWeight: FontWeight.bold)),
                            ),
                          ),

                        ],
                      ),

                    ],
                  ),
                ),
              ],
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
