import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:buildbind/Controllers/contractor_controller.dart';
import 'package:buildbind/Models/contractor_model.dart';
import 'package:buildbind/Services/api_calls.dart';
import 'package:buildbind/View/bottom_nav_bar.dart';
import 'package:buildbind/View/home/dashboard_screen.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../Utills/AppColors.dart';
import '../bottom_nav_two.dart';
import '../widgets/app_bar.dart';
import '../widgets/sized_boxes.dart';
import '../widgets/texts.dart';
import 'login_screen.dart';

class RegisterTwo extends StatefulWidget {
  const RegisterTwo({
    required this.type,
    required this.contractor,
    super.key,

  });
  final String type;
  final ContractorReg contractor;

  @override
  State<RegisterTwo> createState() => _RegisterTwoState();
}

class _RegisterTwoState extends State<RegisterTwo> {

  final _formKey = GlobalKey<FormState>();

  var _employescontroler = TextEditingController();
  var _descriptioncontroller = TextEditingController();

  String? _pdfPath;

  Future<void> _openFileExplorer() async {
    try {
      // Open file picker
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );
      if (result != null) {
        setState(() {
          _pdfPath = result.files.single.path;
        });
      }
    } catch (e) {
      print("Error picking PDF: $e");
    }
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: Scaffold(
        appBar: CustomAppBar(context),
        body: Padding(
          padding: EdgeInsets.all(4.w),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  hsizedbox2,
                  const Align(
                      alignment: Alignment.centerLeft,
                      child: HeadingText(text: 'Company Details')),
                  hsizedbox2,
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: SimpleText(text: 'Provide Details of you Company',)),
                      Icon(Icons.info_outline),
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
                    child:  TextFormField(
                      controller:_employescontroler,
                      validator: (value) {
                        if (value == null || value.isEmpty ) {
                          return 'Please enter no of employees';
                        }
                        return null;
                      },
                      maxLines: 1,
                      decoration: InputDecoration(
                        hintText: 'Number of Employees in Company',
                        border: InputBorder.none,
                      ),
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
                    child:  TextFormField(
                      controller: _descriptioncontroller,
                      validator: (value) {
                        if (value == null || value.isEmpty ) {
                          return 'Please enter description';
                        }
                        return null;
                      },
                      maxLines: 2,
                      decoration: InputDecoration(
                        hintText: 'Description of your Company',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  // hsizedbox2,
                  // widget.type=='A'?GestureDetector(
                  //   onTap: (){
                  //   },
                  //   child: Container(
                  //     width: 80.w,
                  //     height: 7.h,
                  //     decoration: BoxDecoration(
                  //       color: APPCOLORS.PRIMARY,
                  //       border: Border.all(color: Colors.black54),
                  //       borderRadius: BorderRadius.circular(8.w),
                  //     ),
                  //     child: Center(
                  //       child: Row(
                  //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //         children: [
                  //           Text('Add Portfolio ',style: TextStyle(color: APPCOLORS.WHITE,fontSize:12.sp,fontWeight: FontWeight.bold)),
                  //           wsizedbox2,
                  //           Icon(Icons.drive_folder_upload_outlined,color: Colors.white,),
                  //
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // ):Container(),
                  hsizedbox2,
                  widget.type=='A'? GestureDetector(
                    onTap: ()
                    {
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
                            filePath==null?
                            Text('Add PEC Licence',style: TextStyle(color: APPCOLORS.WHITE,fontSize:12.sp,fontWeight: FontWeight.bold))
                            : Text('Picked FIle',style: TextStyle(color: APPCOLORS.WHITE,fontSize:12.sp,fontWeight: FontWeight.bold)),

                            wsizedbox2,
                            Icon(Icons.drive_folder_upload_outlined,color: Colors.white,),

                          ],
                        ),
                      ),
                    ),
                  ):Container(),

                  hsizedbox1,

                  hsizedbox6,

                  GestureDetector(
                    onTap: ()async{

                      if (_formKey.currentState?.validate() ?? false) {

                        ContractorReg contractor= ContractorReg(contractorImage: widget.contractor.contractorImage,individualName:widget.contractor.individualName,
                            cnic:widget.contractor.cnic,position: widget.contractor.contractorType,noOfEmployees: _employescontroler.text
                            ,description:_descriptioncontroller.text ,cnicfpath: widget.contractor.cnicfpath, cnicbpath: widget.contractor.cnicbpath);

                        var ctrl= ContractorController();

                        print(contractor.toJson());

                        String email= await ApiCall.getemail();

                        widget.type=='A'?

                        ctrl.RegisterContractor('company', _employescontroler.text,widget.contractor.individualName!,email,
                            widget.contractor.ntn,widget.contractor.individualName!,widget.contractor.position!,
                            _descriptioncontroller.text,filePath,widget.contractor.cnicfpath!,
                            widget.contractor.cnicbpath!,widget.contractor.contractorImage!, context):

                        ctrl.RegisterContractor('individual', _employescontroler.text,null,email,
                            null,widget.contractor.individualName!,widget.contractor.position!,
                            _descriptioncontroller.text, null,widget.contractor.cnicfpath!,
                            widget.contractor.cnicbpath!, widget.contractor.contractorImage!, context);

                      }


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
                        child:Text('Submit',style: TextStyle(color: APPCOLORS.WHITE,fontSize:16.sp,fontWeight: FontWeight.bold),),
                      ),
                    ),
                  ),


                ],
              ),
            ),
          ),

        ),

      ),
    );
  }

  String? filePath;
  void _pickPDF(BuildContext context) async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );

      if (result != null) {
        setState(() {
          filePath = result.files.single.path!;
          print('Picked PDF file path: $filePath');
        });
        // Do something with the picked PDF file


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
