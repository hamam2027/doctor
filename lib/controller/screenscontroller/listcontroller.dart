import 'dart:convert';

import 'package:doctor/constant/constant.dart';
import 'package:doctor/model/listmodel.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ListController extends GetxController {
  // @override
  // void onInit() {
  //   pationtlist.isEmpty ?
  //   getdata():null;
  //   update();
  // }

  ListModel? listModel;

  List<Data> pationtlist = [];
  getdata() async {
    try {
      var headers = {'Authorization': token};
      var request = http.MultipartRequest(
          'GET', Uri.parse('http://160.20.146.238/api?action=listRecords'));

      request.headers.addAll(headers);

      http.StreamedResponse response =
          await request.send().timeout(const Duration(minutes: 2));

      if (response.statusCode == 200) {
        String responseString = await response.stream.bytesToString();

        Map<String, dynamic> responseJson = json.decode(responseString);
        listModel = ListModel.fromJson(responseJson);
        listModel!.data!.forEach((element) {
          pationtlist.add(element);
          update();
        });
        // print(pationtlist[0].patientName);
      } else {
        // print(response.reasonPhrase);
      }
      // var response = await http.get(
      //   Uri.parse('http://160.20.146.238/api?action=listRecords'),
      //   headers: {'Authorization': token, 'Content-Type': 'application/json'},
      // );
      // if (response.statusCode == 200) {
      //   print('uploded data');
      //   Map<String, dynamic> data = jsonDecode(response.body);
      //    print("==================");
      //   listModel = ListModel.fromJson(data);
      //    print("==================");
      //   listModel!.data!.forEach((element) {
      //     pationtlist.add(element);
      //   });
      //   print("==================");
      // }

      // print(pationtlist[0].description);
    } catch (e) {
      // print(e.toString());
    }
  }
}
