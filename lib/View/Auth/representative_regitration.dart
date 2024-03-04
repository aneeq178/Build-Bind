
import 'package:buildbind/View/Auth/register_two.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:image_picker/image_picker.dart';
import '../../Utills/AppColors.dart';
import '../widgets/app_bar.dart';
import '../widgets/sized_boxes.dart';
import '../widgets/texts.dart';

class RepresentativeRegistration extends StatefulWidget {
  const RepresentativeRegistration({super.key});

  @override
  State<RepresentativeRegistration> createState() => _RepresentativeRegistrationState();
}

class _RepresentativeRegistrationState extends State<RepresentativeRegistration> {
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
                hsizedbox1,
                Align(
                    alignment: Alignment.centerLeft,
                    child: HeadingText( text: 'Information of Company \nRepresentative',)),
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
                hsizedbox2,
                GestureDetector(
                  onTap: (){
                    // _pickImage();
                  },
                  child: Container(
                    width: 30.w,
                    height: 20.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: APPCOLORS.PRIMARY,
                    ),
                    child: Icon(
                      Icons.image,
                      color: Colors.white,
                      size: 50,
                    ),
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
                  child: const Row(
                    children: [
                      Icon(Icons.account_box),
                      SizedBox(width: 8.0),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Your Name',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
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
                  child: const Row(
                    children: [
                      Icon(Icons.abc_outlined),
                      SizedBox(width: 8.0),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Your Position at the company',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
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
                  child: const Row(
                    children: [
                      Icon(Icons.numbers),
                      SizedBox(width: 8.0),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Your CNIC',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
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
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterTwo()));
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
  Future<void> _pickImage() async {
    try {
      final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        setState(() {
          // _selectedImage = File(pickedFile.path);
        });
      } else {
        print('User canceled image picking');
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }
}
