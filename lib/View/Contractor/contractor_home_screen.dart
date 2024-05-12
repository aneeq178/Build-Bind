import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../Utills/AppColors.dart';
import '../Bids/bids_screen.dart';
import '../home/dashboard_screen.dart';
import '../widgets/sized_boxes.dart';
import '../widgets/texts.dart';

class ContractorHomeScreen extends StatelessWidget {
  const ContractorHomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            alignment: Alignment.topLeft,
            image: AssetImage('assets/images/dashboard_back.png',),
          ),),
        child: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.all(5.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 40.w,
                      height: 8.h,
                      decoration: BoxDecoration(
                        color: APPCOLORS.GREY,
                        borderRadius: BorderRadius.circular(20.w), // Adjust the radius as needed
                      ),

                      child: Center(
                        child: Row(
                          children: [
                            SizedBox(width: 2.w),
                            Icon(Icons.location_on_sharp,color: APPCOLORS.PRIMARY,),
                            SizedBox(width: 2.w),
                            Text("Islamabad Pakistan",style:TextStyle(color:APPCOLORS.PRIMARY,fontSize: 8.sp)),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 18.w,),
                    GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>NotificationView()));
                        },
                        child: Image.asset("assets/images/Notification.png")),
                    SizedBox(width: 2.w,),
                    Container(
                      width: 15.w,
                      height: 8.h,
                      decoration: BoxDecoration(
                        color: APPCOLORS.GREY,
                        borderRadius: BorderRadius.circular(30.w), // Adjust the radius as needed
                      ),
                    ),

                  ],
                ),

                hsizedbox5,

                HeadingText(text: "Lets get your \n First Client"),

                hsizedbox2,


                // GestureDetector(
                //   onTap: (){
                //     Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchContractor()));
                //   },
                //   child: Container(
                //             padding: EdgeInsets.all(2.w),
                //             decoration: BoxDecoration(
                //               color: APPCOLORS.GREY,
                //               border: Border.all(color: Colors.transparent),
                //               borderRadius: BorderRadius.circular(8.0),
                //             ),
                //             child: Row(
                //               children: [
                //   Icon(Icons.search),
                //   SizedBox(width: 8.0),
                //   Expanded(
                //     child: TextField(
                //       onTap: (){
                //         Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchContractor()));
                //       },
                //       decoration: InputDecoration(
                //         hintText: 'Search Company or Contractor',
                //         border: InputBorder.none,
                //       ),
                //     ),
                //   ),
                //               ],
                //             ),
                //           ),
                // ),

                hsizedbox2,


                hsizedbox2,

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LabelText(text: "Top Construction Companies"),
                    Text("View All",style:TextStyle(color:Colors.blueAccent,fontSize: 8.sp)),
                  ],
                ),
                hsizedbox1,

                // Consumer(builder: )
                // Container(
                //   height: 8.5.h,
                //   child: ListView.builder(
                //     shrinkWrap: true,
                //     itemCount: 4,
                //     scrollDirection: Axis.horizontal,
                //     itemBuilder: (context, index) =>  TopCompanies(contractor: data.C,),),
                // ),

                hsizedbox2,

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LabelText(text: "Top Constructors"),
                    Text("View All",style:TextStyle(color:Colors.blueAccent,fontSize: 8.sp)),
                  ],
                ),
                hsizedbox1,

                Container(
                  height: 14.5.h,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 4,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Container(
                      width: 20.w,
                      height: 1.5.h,
                      padding: EdgeInsets.all(2.w),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(8.w),
                      ),
                      child:Column(
                        children: [
                          Container(
                            width: 14.w,
                            height: 7.5.h,
                            padding: EdgeInsets.all(5.w),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  'assets/images/image 29.png',
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
                          Text(" Ali",style:TextStyle(color:APPCOLORS.PRIMARY,fontSize: 12.sp)),

                        ],
                      ),
                    ),),
                ),
                hsizedbox2,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LabelText(text: "Featured Projects"),
                    Text("View All",style:TextStyle(color:Colors.blueAccent,fontSize: 8.sp)),
                  ],
                ),
                hsizedbox1,
                // Container(
                //   height: 6.2.h,
                //   child: ListView(
                //     scrollDirection: Axis.horizontal,
                //     shrinkWrap: true,
                //     children: [
                //       TabButton(text: "All",selected: true,),
                //       wsizedbox2,
                //       TabButton(text: "House",selected: false,),
                //       wsizedbox2,
                //       TabButton(text: "Plaza",selected: false),
                //       wsizedbox2,
                //       TabButton(text: "Flats",selected: false),
                //       // wsizedbox4,
                //       // TabButton( text: "Factory",),
                //     ],
                //   ),
                // ),
                // hsizedbox2,
                // ProjectWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


