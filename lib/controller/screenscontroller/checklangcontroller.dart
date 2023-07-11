import 'dart:convert';
import 'dart:io';
import 'package:doctor/constant/constant.dart';
import 'package:doctor/model/lungmodel.dart';
import 'package:doctor/model/othermodel/confirmationmodel.dart';
import 'package:doctor/widgets/confirmationpopup.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CheckLungController extends GetxController {
  // String? token;
  // @override
  // void onInit() async {
  //   token = await Cashhelper.getdata(key: "token");
  //   print(token);
  // }

  TextEditingController patientName = TextEditingController();
  TextEditingController phonenum = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController description = TextEditingController();
  File? filePath;
  bool uplode = false;
  onUploadRecord() async {
    // print(token);
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.audio,
    );
    if (result != null) {
      filePath = File(result.files.single.path.toString());

      // filePath = File(result.files.single.path!);
      // print("====================$filePath");

      update();
    }
  }

  LungModel? lungModel;
  checkLung({
    required String patientName,
    required String patientPhone,
    required String patientAge,
    required String description,
  }) async {
    try {
      uplode = !uplode;
      update();
      var request = http.MultipartRequest(
          'POST', Uri.parse('http://160.20.146.238/api?action=importRecord'));
      request.headers
          .addAll({'Authorization': token, 'Content-Type': 'application/json'});
      request.fields['patientName'] = patientName;
      request.fields['patientAge'] = patientAge;
      request.fields['patientPhone'] = patientPhone;
      request.fields['description'] = description;
      if (filePath != null) {
        request.files.add(http.MultipartFile(
          'record',
          filePath!.readAsBytes().asStream(),
          filePath!.lengthSync(),
          filename: filePath!.path.split('/').last,
        ));
      }
      var response = await request.send().timeout(const Duration(minutes: 2));
      if (response.statusCode == 200) {
        // print('File Uploaded');
        String responseString = await response.stream.bytesToString();
        Map<String, dynamic> responseJson = json.decode(responseString);
        lungModel = LungModel.fromJson(responseJson);
        // print(lungModel!.classification);
        // print(lungModel!.status);

        // // print(responseString);
        // print('File Uploaded');
      } else {
        // print('Error Uploading File');
      }
    } catch (e) {
      // print(e.toString());
    }
  }

  dialog(context)async {
    var txt = lungModel!.classification!.split('The predicted class is:').last;
  await  showDialog(
        builder: (context) => AlertDialog(
              content: ConfirmationPopup(
                  confirmationModel: ConfirmationModel(
                name: patientName.text,
                phone: phonenum.text,
                age: age.text,
                description: description.text,
                title: txt,
              )),
            ),
        context: context);
    
    uplode = !uplode;
    update();
  }
  clear(){
    patientName.clear();
    phonenum.clear();
    age.clear();
    description.clear();
    filePath = null;
  }
}
