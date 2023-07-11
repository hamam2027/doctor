import 'package:doctor/model/registermodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SignUpController extends GetxController {
  RegisterModel? registerModel;
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController mobile = TextEditingController();
  userSignUp({
    required String email,
    required String passwor,
    required String mobile,
    required String username,
  }) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse('http://160.20.146.238/api?action=registerAccount'));
    request.fields.addAll({
      'email': email,
      ' password': passwor,
      'mobile': mobile,
      'username': username
    });

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      // print(await response.stream.bytesToString());
    } else {
      // print(response.reasonPhrase);
    }
  }
}
