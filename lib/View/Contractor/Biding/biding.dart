import 'package:buildbind/View/bottom_nav_two.dart';
import 'package:buildbind/View/show_snackbar.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../Controllers/bid_controller.dart';
import '../../../Models/project_model.dart';
import '../../../Utills/AppColors.dart';
import '../../widgets/sized_boxes.dart';
import '../../widgets/texts.dart';
import '../contractor_details.dart';

class ContractorBiding extends StatefulWidget {
  const ContractorBiding({
    required this.project,
    super.key});

  final Project project;


  @override
  State<ContractorBiding> createState() => _ContractorBidingState();
}


class _ContractorBidingState extends State<ContractorBiding> {

  String? _pdfPath;
  String? _pdfname;

  var _costcontroller = TextEditingController();
  var _descriptioncontrller = TextEditingController();


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
                height: 35.h,
                padding: EdgeInsets.all(2.w),
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage(
                      'assets/images/biding.jpg',
                    ), // Replace with your image asset path
                    fit: BoxFit.cover,
                  ),
                  color: APPCOLORS.GREY,
                  border: Border.all(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(8.w),
                ),
              ),

              hsizedbox2,
               LabelText(text: widget.project.pName!),
              hsizedbox1,
              Text(widget.project.pDetails!,style:TextStyle(color:Colors.black,fontSize: 8.sp)),
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
                   HeadingText2(text:widget.project.pEstimatedCost==null?'4500000':widget.project.pEstimatedCost.toString()),
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
                        controller: _costcontroller,
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
                        controller: _descriptioncontrller,
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
                          _pdfname==null? Text('Attach Detailed Quotation',style: TextStyle(color: APPCOLORS.WHITE,fontSize:12.sp,fontWeight: FontWeight.bold)):
                          Text(_pdfname!,style: TextStyle(color: APPCOLORS.WHITE,fontSize:12.sp,fontWeight: FontWeight.bold)),
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
                  var ctrl=BidController();
                  if(_pdfPath==null)
                    {
                      showSnackbar(context,'Please Attach Quotation');
                    }
                  else{
                    ctrl.submitBid(_costcontroller.text,_descriptioncontrller.text,widget.project.pId.toString(),_pdfPath! ,context);
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

        setState(() {
          _pdfPath = result.files.single.path!;
          _pdfname = result.files.single.name!;
        });

        print('Picked PDF file path: $_pdfPath');

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
