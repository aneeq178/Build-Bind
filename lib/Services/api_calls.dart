import 'dart:convert';
import 'package:buildbind/Utills/utills.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


class ApiCall{




  static Future<String> getToken()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String token =await prefs.getString('token')??'7';
    print("token ${token}");

    return token;
  }

  static Future<String> getIds()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String token =await prefs.getString('id')??'7';
    print("id is ${token}");

    return token;
  }

  static Future<String> getemail()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String token =await prefs.getString('email')??'aneeq2@gmail.com';
    print("email ${token}");

    return token;
  }


  static Future callApiPost(Map<String, dynamic> body, String endpoint) async {
    try {

      String token =await getToken();
      var headers={
        'Content-Type': 'application/json',
        'authorization':'$token',
      };

      var data=jsonEncode(body);
      String baseUrl = "$BASEURL$endpoint";
      print(baseUrl);
      print(headers);
      print(body);
      print("1");

      // var data= jsonEncode(body);
      print(body);


      final response = await http.post(
        headers: headers,
        Uri.parse(baseUrl),
        body:data,
      ).timeout(Duration(seconds: 10));

      print("2");
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);

      print("response from api ${jsonResponse}");
      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 200) {
        return jsonResponse;
      } else if (response.statusCode == 401) {
        print('false');
        return 'false';
      } else {
        return null;
      }
    } catch (e) {
      print("main catch ${e}");
      return null;
    }
  }


  ///////////////////////////////////////////////////////

  static Future callApiPut(Map<String, dynamic> body, String endpoint) async {
    try {

      String token =await getToken();


      var headers={
        'authorization':'$token',
      };
      String baseUrl = "$BASEURL$endpoint";
      print(baseUrl);
      print(body);
      print("1");

      // var data= jsonEncode(body);

      print(body);

      final response = await http.put(
        headers: headers,
        Uri.parse(baseUrl),
        body:body,
      ).timeout(Duration(seconds: 10));

      print("2");
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);

      print("response from api ${jsonResponse}");
      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 200) {
        return jsonResponse;
      } else if (response.statusCode == 400) {
        return null;
      } else {
        return null;
      }
    } catch (e) {
      print("main catch ${e}");
      return null;
    }
  }


  ///////////////////////////////////////////////////

  static Future callApiGet( String endpoint) async {

    print("12");
    // try {
      String token =await getToken();


      var headers={
        'authorization':'$token',
      };

      String baseUrl = "$BASEURL$endpoint";
      print(baseUrl);

      print("1");
      final response = await http.get(
        headers: headers,
        Uri.parse(baseUrl),
      ).timeout(Duration(seconds: 10));

    print(response.statusCode);

      var jsonResponse = jsonDecode(response.body);

      print(jsonResponse);
      print(response.statusCode);
      print(response.body);


      if (response.statusCode == 200) {
        return jsonResponse;
      } else if (response.statusCode == 400) {
        return null;
      } else {
        return null;
      }
    // } catch (e) {
    //   print("main catch ${e}");
    //   return e;
    // }
  }
}
