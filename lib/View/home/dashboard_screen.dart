import 'package:buildbind/Utills/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        children: [
          Row(
            children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
              width: 30.w,
                height: 8.h,
                decoration: BoxDecoration(
                  color: APPCOLORS.GREY,
                  borderRadius: BorderRadius.circular(15.0), // Adjust the radius as needed
                ),
              ),
            ),

            ],
          ),
        ],
      ),
    );
  }
}
