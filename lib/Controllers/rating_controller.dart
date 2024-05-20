import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../Services/api_calls.dart';
import '../Utills/utills.dart';
import '../View/show_snackbar.dart';

class RatingController extends ChangeNotifier
{
  rateContractor(String p_id,String contractor_id,String img1,String img2,String img3,
      String rating,String rating_desc,BuildContext context) async {


    // String userid=await ApiCall.getIds();

    try {
      String token =await ApiCall.getToken();

      final url = Uri.parse('$BASEURL/rate_contractor');

      var hideLoading = showLoading(context, 'Please Wait..');

      final req = http.MultipartRequest('POST', url)
        ..fields['p_id'] = p_id
        ..fields['contractor_id'] = contractor_id
        ..fields['rating'] = rating
        ..fields['rating_description'] = rating_desc
        ..files.add(await http.MultipartFile.fromPath(
            'rating_img1', img1))
        ..files.add(await http.MultipartFile.fromPath(
            'rating_img2', img2))
        ..files.add(await http.MultipartFile.fromPath(
            'rating_img3', img3))
        ..fields['rating_type'] = 'user';

      final stream = await req.send();
      final res = await http.Response.fromStream(stream);
      final status = res.statusCode;

      hideLoading();
      req.headers['authoriztion'] = '$token';


      print(status);
      print(res.body);
      if(res.statusCode==200)
      {

      }
      else if(res.statusCode==400) {
        showSnackbar(context, 'Thanks for your feedback');
      }
      else
      {
        showSnackbar(context, 'Thanks for your feedback');
      }

    } catch (e) {
      print("error in controller  ${e}");
    }
  }



}