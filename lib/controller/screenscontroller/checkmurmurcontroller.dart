import 'dart:convert';
import 'dart:io';
import 'package:doctor/constant/constant.dart';
import 'package:doctor/model/murmurmodel.dart';
import 'package:doctor/model/othermodel/confirmationmodel.dart';
import 'package:doctor/widgets/confirmationpopup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;

class CheckMurmurController extends GetxController {
  TextEditingController patientName = TextEditingController();
  TextEditingController phonenum = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController description = TextEditingController();
  List<File>? filePath;
  // File? file;
  bool uplode = false;

  MurmurModel? murmurModel;
  onUploadRecord() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
    );

    if (result != null) {
      filePath = result.paths.map((path) => File(path!)).toList();

      update();
    } else {
      // User canceled the picker
    }
  }

  checkMurmur({
    required String patientName,
    required String phonenum,
    required String age,
    required String description,
  }) async {
    try {
      uplode = !uplode;
      update();
      var request = http.MultipartRequest(
          'POST', Uri.parse('http://160.20.146.238/api?action=importRecord3'));
      request.headers
          .addAll({'Authorization': token, 'Content-Type': 'application/json'});
      request.fields['patientName'] = patientName;
      request.fields['patientAge'] = age;
      request.fields['patientPhone'] = phonenum;
      request.fields['description'] = description;
      if (filePath != null && filePath!.isNotEmpty) {
        for (var i = 0; i < filePath!.length; i++) {
          request.files.add(http.MultipartFile(
            'record${i + 1}',
            filePath![i].readAsBytes().asStream(),
            filePath![i].lengthSync(),
            filename: filePath![i].path.split('/').last,
          ));
        }
        // request.files.add(http.MultipartFile(
        //   'record$i',
        //   filePath![0].readAsBytes().asStream(),
        //   filePath![0].lengthSync(),
        //   filename: filePath![0].path.split('/').last,
        // ));
      }
      var response = await request.send().timeout(const Duration(minutes: 2));
      if (response.statusCode == 200) {
        // print('File Uploaded');
        String responseString = await response.stream.bytesToString();
        Map<String, dynamic> responseJson = json.decode(responseString);
        murmurModel = MurmurModel.fromJson(responseJson);
        // print(murmurModel!.classification);
        // print(murmurModel!.status);

        // print(responseString);
        // print('File Uploaded');
      } else {
        // print('Error Uploading File');
      }
    } catch (e) {
      // print(e.toString());
    }
  }

  dialog(context) async {
    var txt =
        murmurModel!.classification!.split('The predicted class is:').last;
    await showDialog(
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

  clear() {
    patientName.clear();
    phonenum.clear();
    age.clear();
    description.clear();
    filePath = null;
  }
}
