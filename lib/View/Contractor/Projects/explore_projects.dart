import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../Utills/AppColors.dart';
import '../../widgets/sized_boxes.dart';
import '../../widgets/texts.dart';
import '../contractor_details.dart';
import '../widgets/project_widget.dart';


class ExploreProjects extends StatelessWidget {
  const ExploreProjects({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: LabelText(text: 'Explore Projects'),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(4.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              hsizedbox1,
              Text("Explore Projects",style:TextStyle(color:Colors.black,fontSize: 8.sp)),
              hsizedbox1,

              ProjectWidget(),
              hsizedbox1,
              ProjectWidget(),
              hsizedbox1,
              ProjectWidget(),

            ],
          ),
        ),
      ),
    );
  }
}
