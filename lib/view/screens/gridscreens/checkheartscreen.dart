import 'package:doctor/controller/screenscontroller/checkheartcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../auth/login/loginwidgets.dart';

// ignore: must_be_immutable
class CheckHeartBeat extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  CheckHeartController controller = Get.put(CheckHeartController());

  CheckHeartBeat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Check Heart Beat'),
          backgroundColor: Colors.red[200],
        ),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.only(top: 0.0),
              child: Stack(children: <Widget>[
                Container(
                    margin: const EdgeInsets.only(top: 0.0),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        )),
                    child: Column(
                      children: const <Widget>[],
                    )),
                Container(
                  padding:
                      const EdgeInsets.only(top: 80.0, left: 20.0, right: 20.0),
                  child: Column(
                    children: <Widget>[
                      const SizedBox(
                        height: 0.0,
                      ),
                      TextFormField(
                        validator: (text) {
                          if (text!.isEmpty) {
                            return "Enter patient name";
                          } else if (text.length < 3) {
                            return 'Name must be more than 2 charater';
                          } else {
                            return null;
                          }
                        },
                        controller: controller.patientName,
                        decoration: InputDecoration(
                          labelText: ' patient name',
                          prefixIcon: const Icon(Icons.people),
                          border: myfocusborder(),
                          enabledBorder: myfocusborder(),
                          focusedBorder: myfocusborder(),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        validator: (text) {
                          String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
                          RegExp regExp = RegExp(pattern);
                          if (text!.isEmpty) {
                            return 'Please enter phone number';
                          } else if (!regExp.hasMatch(text)) {
                            return 'Please enter valid phone number';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.phone,
                        controller: controller.phonenum,
                        decoration: InputDecoration(
                          labelText: 'phone',
                          prefixIcon: const Icon(Icons.phone),
                          border: myfocusborder(),
                          enabledBorder: myfocusborder(),
                          focusedBorder: myfocusborder(),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        validator: (text) {
                          if (text!.isEmpty) {
                            return "Enter patient age";
                          } else if (text.length > 3) {
                            return 'age must be Less than 3 charater';
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.number,
                        controller: controller.age,
                        decoration: InputDecoration(
                          labelText: 'age',
                          prefixIcon: const Icon(Icons.person_2_rounded),
                          border: myfocusborder(),
                          enabledBorder: myfocusborder(),
                          focusedBorder: myfocusborder(),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        validator: (text) {
                          if (text!.isEmpty) {
                            return "Enter Description";
                          }
                          return null;
                        },
                        controller: controller.description,
                        minLines: 1,
                        maxLines: 20,
                        decoration: InputDecoration(
                          label: const Text('Description'),
                          prefixIcon: const Icon(Icons.description),
                          border: myfocusborder(),
                          enabledBorder: myfocusborder(),
                          focusedBorder: myfocusborder(),
                        ),
                      ),
                      const SizedBox(height: 16),
                      const SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SizedBox(
                          width: double.infinity,
                          child: OutlinedButton(
                            onPressed: () {
                              controller.onUploadRecord();
                            },
                            child: Column(
                              children: [
                                Icon(
                                  Icons.file_upload_outlined,
                                  size: 40.0,
                                  color: Colors.red[200],
                                ),
                                const SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  // controller.filePath != null
                                  //     ? controller
                                  //         .filePath!
                                  //         .path
                                  //         .split('/')
                                  //         .last
                                  //     :

                                  'Upload HeartBeat Record',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(color: Colors.black),
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      GetBuilder<CheckHeartController>(
                       builder: (controller) => controller.uplode == false
                           ? 
                      CustomRoundedButton(
                        text: 'Done',
                        // load: state is HeartBeatLoading ? true : false,
                        textColor: Colors.white,
                        pressed: () async {
                          if (_formKey.currentState!.validate()) {
                            await controller.checkHeartBeat(
                                patientName: controller.patientName.text,
                                phonenum: controller.phonenum.text,
                                age: controller.age.text,
                                description: controller.description.text);
                           // ignore: use_build_context_synchronously
                           await controller.dialog(context);
                            controller.clear();
                          } else {
                            return;
                          }
                        },
                      ):const Center(child: CircularProgressIndicator(),),)
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ));
  }

  //
  // OutlineInputBorder myinputborder() {
  //   return const OutlineInputBorder(
  //       borderRadius: BorderRadius.all(Radius.circular(20)),
  //       borderSide: BorderSide(
  //         color: Color(0xFFF2BEA1),
  //         width: 3,
  //       ));
  //}

  OutlineInputBorder myfocusborder() {
    return OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide(
          color: Colors.red[200]!,
          width: 3,
        ));
  }
}
