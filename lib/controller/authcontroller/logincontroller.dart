import 'dart:convert';

import 'package:doctor/constant/constant.dart';
import 'package:doctor/model/loginmodel.dart';
import 'package:doctor/shared/cashhelper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LogInController extends GetxController {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  LoginModel? loginModel;
  bool loding = false;

  logInUser({
    required String username,
    required String password,
  }) async {
    var response = await http.post(
        Uri.parse('http://160.20.146.238/api?action=login'),
        body: {'username': username, 'password': password});

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      loginModel = LoginModel.fromJson(data);
      Cashhelper.saveData(key: 'token', value: loginModel!.token);
      token = await Cashhelper.getdata(key: 'token');
      // print("===========================$token");
      // print(loginModel!.token);
    } else {
      // print(response.reasonPhrase);
    }
  }
}
















// class LogInController extends GetxController {
//   TextEditingController username = TextEditingController();
//   TextEditingController password = TextEditingController();
//   LoginModel? loginModel;
//   logInUser({
//     required String username,
//     required String password,
//   }) async {
//     var request =
//         http.MultipartRequest('POST', Uri.parse('http://160.20.146.238/api?action=login'));
//     request.fields.addAll({'username': username, 'password': password});

//     http.StreamedResponse response = await request.send();

//     if (response.statusCode == 200) {
      
//       print(await response.stream.bytesToString());
//       loginModel = LoginModel.fromJson(await response.stream.bytesToString());
//       print(loginModel!.token);
//     } else {
//       print(response.reasonPhrase);
//     }
//   }
// }
