import 'package:flutter/cupertino.dart';

import '../Models/bid_model.dart';
import '../Services/api_calls.dart';
import '../View/show_snackbar.dart';

class BidController extends ChangeNotifier
{
  List<Bid> bids = [];


  //////////////get all bids

  getAllBids(BuildContext context) async {

    try {
      // var hideLoading = showLoading(context, 'Please Wait..');
      var response = await ApiCall.callApiGet('contractor-bids');
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


  // ///////////////////////////////////////////////
  //
  // deleteProject(String password,BuildContext context) async {
  //   Map<String,dynamic> body = {'email': email, 'password': password};
  //
  //   try {
  //     var hideLoading = showLoading(context, 'Please Wait..');
  //     var response = await ApiCall.callApiPost(body, '/rider/login');
  //     hideLoading();
  //     if (response != null) {
  //
  //       if (response['message'] == 'Invalid email or password') {
  //         showSnackbar(context, "Invalid email or password");
  //
  //       } else {
  //
  //         showSnackbar(context, "Login Successful");
  //
  //       }
  //     } else {
  //       showSnackbar(context, 'An error Occurred, Please try again later');
  //     }
  //   } catch (e) {
  //     print("error in controller  ${e}");
  //   }
  // }





}