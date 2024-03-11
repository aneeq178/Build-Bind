import 'package:buildbind/View/bottom_nav_two.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
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
              Container(
                padding: EdgeInsets.all(2.w),
                decoration: BoxDecoration(
                  color: APPCOLORS.GREY,
                  border: Border.all(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                   HeadingText2(text: 'Estimated Cost'),
                   HeadingText2(text: '6.5 M Rs'),
                  ],
                ),
              ),
              hsizedbox2,
              Container(
                padding: EdgeInsets.all(2.w),
                decoration: BoxDecoration(
                  color: APPCOLORS.GREY,
                  border: Border.all(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Your offer in Rs',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              hsizedbox1,
              Container(
                padding: EdgeInsets.all(2.w),
                decoration: BoxDecoration(
                  color: APPCOLORS.GREY,
                  border: Border.all(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        maxLines: 3,
                        decoration: InputDecoration(
                          hintText: 'Describe your offer',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              hsizedbox2,

              Align(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: (){
                    _pickPDF(context);
                  },
                  child: Container(
                    width: 80.w,
                    height: 7.h,
                    decoration: BoxDecoration(
                      color: APPCOLORS.PRIMARY,
                      border: Border.all(color: Colors.black54),
                      borderRadius: BorderRadius.circular(8.w),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('Attach Detailed Quotation',style: TextStyle(color: APPCOLORS.WHITE,fontSize:12.sp,fontWeight: FontWeight.bold)),
                          wsizedbox2,
                          Icon(Icons.drive_folder_upload_outlined,color: Colors.white,),

                        ],
                      ),
                    ),
                  ),
                ),
              ),

              hsizedbox4,
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Lets hope for the best'),

                        content: const Text('Your Quotation have been submitted you can check client response in the chat  '),
                        actions: [

                          TextButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>BottomNavigation2()));
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Container(
                  height: 8.h,
                  padding: EdgeInsets.all(2.w),
                  decoration: BoxDecoration(
                    color: APPCOLORS.SECONDARY,
                    border: Border.all(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Center(
                    child: Text('Submit', style: TextStyle(color: APPCOLORS.WHITE,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold),),
                  ),
                ),
              ),







            ],
          ),
        ),
      ),
    );
  }
  void _pickPDF(BuildContext context) async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );

      if (result != null) {
        // Do something with the picked PDF file
        String filePath = result.files.single.path!;
        print('Picked PDF file path: $filePath');

        // You can handle the file path as needed, for example, you may want to display it or perform further operations.
      } else {
        // User canceled the file picking
        print('User canceled the file picking');
      }
    } catch (e) {
      print('Error picking PDF: $e');
    }
  }

}
