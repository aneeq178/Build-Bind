import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../Utills/AppColors.dart';
import '../widgets/app_bar.dart';
import '../widgets/sized_boxes.dart';
import '../widgets/texts.dart';
import 'login_screen.dart';

class RegisterTwo extends StatefulWidget {
  const RegisterTwo({
    super.key,
    required this.from,
  });

  final bool from; // true for contractor and false for normal user


  @override
  State<RegisterTwo> createState() => _RegisterTwoState();
}

class _RegisterTwoState extends State<RegisterTwo> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: Scaffold(
        appBar: CustomAppBar(context),
        body: Padding(
          padding: EdgeInsets.all(4.w),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                hsizedbox2,
                Align(
                    alignment: Alignment.centerLeft,
                    child: HeadingText(text: 'Information of Company \nRepresentative')),
                hsizedbox2,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Align(
                        alignment: Alignment.centerLeft,
                        child: SimpleText(text: 'Fill the Information Bellow',)),
                    GestureDetector(
                        onTap: (){
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(

                                content: const Text('Provide Your Position in the company along with your name and CNIC.\n \n'
                                    'It helps us to ensure clean and transparent dealing'),
                                actions: [

                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('OK'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Icon(Icons.info_outline)),
                  ],
                ),
                hsizedbox6,

                Container(
                  padding: EdgeInsets.all(2.w),
                  decoration: BoxDecoration(
                    color: APPCOLORS.GREY,
                    border: Border.all(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: TextField(
                    maxLines: 2,
                    decoration: InputDecoration(
                      hintText: 'Description of your Company',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                hsizedbox2,
                GestureDetector(
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
                          Text('Add Portfolio ',style: TextStyle(color: APPCOLORS.WHITE,fontSize:12.sp,fontWeight: FontWeight.bold)),
                          wsizedbox2,
                          Icon(Icons.drive_folder_upload_outlined,color: Colors.white,),

                        ],
                      ),
                    ),
                  ),
                ),
                hsizedbox2,
                GestureDetector(
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
                          Text('Add PEC Certificate',style: TextStyle(color: APPCOLORS.WHITE,fontSize:12.sp,fontWeight: FontWeight.bold)),
                          wsizedbox2,
                          Icon(Icons.drive_folder_upload_outlined,color: Colors.white,),

                        ],
                      ),
                    ),
                  ),
                ),

                hsizedbox1,

                hsizedbox6,

                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
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
                      child:Text('Next',style: TextStyle(color: APPCOLORS.WHITE,fontSize:16.sp,fontWeight: FontWeight.bold),),
                    ),
                  ),
                ),


              ],
            ),
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
