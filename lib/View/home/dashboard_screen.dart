
import 'package:buildbind/Utills/AppColors.dart';
import 'package:buildbind/View/Favourite/favourite_screen.dart';
import 'package:buildbind/View/Listing/listing_project.dart';
import 'package:buildbind/View/Notifcations/notificatoins.dart';
import 'package:buildbind/View/Search/search_contractor.dart';
import 'package:buildbind/View/Settings/profile_settings.dart';
import 'package:buildbind/View/home/featured_companies.dart';
import 'package:buildbind/View/widgets/sized_boxes.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../widgets/nav_bar.dart';
import '../widgets/texts.dart';


class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  
  
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
                HeadingText(text: "Hey, Ali!"),
               HeadingText(text: "Lets Start Exploring"),

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


                Container(
                  height: 6.2.h,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    children: [
                      TabButton(text: "All",selected: true,),
                      wsizedbox2,
                      TabButton(text: "House",selected: false,),
                      wsizedbox2,
                      TabButton(text: "Plaza",selected: false),
                      wsizedbox2,
                      TabButton(text: "Flats",selected: false),
                      // wsizedbox4,
                      // TabButton( text: "Factory",),
                    ],
                  ),
                ),
                hsizedbox2,

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LabelText(text: "Featured Companies"),
                    GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>FeaturedCompanies()));
                        },
                        child: Text("View All",style:TextStyle(color:Colors.blueAccent,fontSize: 8.sp))),
                  ],
                ),
                hsizedbox2,

                Container(
                  height: 20.h,
                  width: 100.w,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 2,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => FeaturedCompanyTile(url: 'assets/images/image 28.png',name: 'Bin Aziz PVT'
                      ,locaion: 'Islamabad',rating: '4.9'),),
                ),



                hsizedbox2,

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LabelText(text: "Top Construction Companies"),
                    Text("View All",style:TextStyle(color:Colors.blueAccent,fontSize: 8.sp)),
                  ],
                ),
                hsizedbox2,


                Container(
                  height: 8.5.h,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 4,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) =>  TopCompanies(),),
                ),


                hsizedbox2,

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LabelText(text: "Top Constructors"),
                    Text("View All",style:TextStyle(color:Colors.blueAccent,fontSize: 8.sp)),
                  ],
                ),
                hsizedbox2,


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






              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TopCompanies extends StatelessWidget {
  const TopCompanies({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 43.w,
      height: 8.5.h,
      padding: EdgeInsets.all(2.w),
      decoration: BoxDecoration(
        color: APPCOLORS.GREY,
        border: Border.all(color: Colors.transparent),
        borderRadius: BorderRadius.circular(8.w),
      ),
      child: Row(
        children: [
          Container(
            width: 12.w,
            height: 8.h,
            padding: EdgeInsets.all(5.w),
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
          Text("  Eden Builders",style:TextStyle(color:APPCOLORS.PRIMARY,fontSize: 10.sp)),
          SizedBox(width: 2.w,),
        ],
      ),
    );
  }
}

class FeaturedCompanyTile extends StatelessWidget {
  const FeaturedCompanyTile({
    required this.url,
    required this.name,
    required this.rating,
    required this.locaion,
    super.key,
  });

  final String url;
  final String name;
  final String rating;
  final String locaion;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                      url,
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
                      Container(
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: Icon(
                          Icons.favorite_border,
                          size: 24.0,
                        ),
                      ),

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
                      name,
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
                          rating,
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
                          locaion,
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
  }
}

class TabButton extends StatelessWidget {
  const TabButton({
    required this.text,
    required this.selected,
    super.key,
  });

  final String text;
  final bool selected;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left:7.w,right: 7.w,top: 4.5.w,bottom: 4.5.w),
      decoration: BoxDecoration(
        color: selected?APPCOLORS.PRIMARY:APPCOLORS.GREY,
        // border: Border.all(color: Colors.transparent),
        borderRadius: BorderRadius.circular(3.h),
      ),
      child: Text(text,style: TextStyle(color: selected?APPCOLORS.WHITE:Colors.black),),
    );
  }
}

