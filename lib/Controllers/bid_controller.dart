import 'package:buildbind/Utills/utills.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;
import '../Models/bid_model.dart';
import 'package:http/http.dart' as http;

import '../Services/api_calls.dart';
import '../Utills/AppColors.dart';
import '../View/bottom_nav_bar.dart';
import '../View/bottom_nav_two.dart';
import '../View/show_snackbar.dart';
import '../View/widgets/texts.dart';

class BidController extends ChangeNotifier
{
  List<Bid> bids = [];


  //////////////get all bids

  getAllBids(BuildContext context) async {
    try {
    //   var hideLoading = showLoading(context, 'Please Wait..');
      var response = await ApiCall.callApiGet('/contractor-bids');
      // hideLoading();
      if (response != null) {
        bids.clear();
        for (var data in response['contractor_bids'])
        {
          bids.add(Bid.fromJson(data));
        }
        print('Length of bids is${bids.length}');

        notifyListeners();
      } else {
        showSnackbar(context, 'An error Occurred, Please try again later');
      }
    } catch (e) {
      print("error in controller  ${e}");
    }
  }


  ///////////////////////////////////////////////

  acceptBid(String bidid,String pid,BuildContext context) async {
    Map<String,dynamic> body = {'bid_id':bidid , 'p_id': pid};

    try {
      var hideLoading = showLoading(context, 'Please Wait..');
      var response = await ApiCall.callApiPost(body, '/accept-bid');
      hideLoading();
      if (response != null) {
        showSnackbar(context, 'Bid Accepted');

        showDialog(
          context: context,
          builder: (BuildContext context) {



            return AlertDialog(
              title: const HeadingText( text: 'Good Luck with the project',),

              content: const Text('The contractor is notified and will contact you soon .'),
              actions: [

                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>BottomNavigation()));
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
                      child:Text('Continue Browsing',style: TextStyle(color: APPCOLORS.WHITE,fontSize:16.sp,fontWeight: FontWeight.bold),),
                    ),
                  ),
                ),
              ],
            );
          },
        );


      } else {
        showSnackbar(context, 'An error Occurred, Please try again later');
      }
    } catch (e) {
      print("error in controller  ${e}");
    }
  }


//////////////////////////////////////////////////

  submitBid(String bidamount,String description,String p_id,String image,BuildContext context) async {
    try {
      String token =await ApiCall.getToken();

      var hideLoading = showLoading(context, 'Please Wait..');

      final url = Uri.parse('https://buildbind.onrender.com/bids/');

      final req = http.MultipartRequest('POST', url)
        ..fields['bid_amount'] = 20.toString()
        ..fields['project_id'] = p_id
        ..fields['proposed_price'] = p_id
        ..files.add(await http.MultipartFile.fromPath(
            'quotation', image))
        ..fields['bid_description'] = description;

      req.headers['authorization'] = '$token';


      final stream = await req.send();
      final res = await http.Response.fromStream(stream);
      final status = res.statusCode;

      hideLoading();
      req.headers['authorization'] = '$token';


      print(status);
      print(res.body);
      if(res.statusCode==201)
        {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const HeadingText( text: 'Bid Submitted',),

                content: const Text('Lets Hope For the best.'),
                actions: [

                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>BottomNavigation2()));
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
                        child:Text('Continue Browsing',style: TextStyle(color: APPCOLORS.WHITE,fontSize:16.sp,fontWeight: FontWeight.bold),),
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        }
      else if(res.statusCode==400) {
        showSnackbar(context, 'Insufficient Tokens');
      }
      else
        {
          showSnackbar(context, 'An error occurred');
        }

    } catch (e) {
      print("error in controller  ${e}");
    }
  }



}