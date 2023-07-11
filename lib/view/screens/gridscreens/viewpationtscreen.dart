import 'package:doctor/controller/screenscontroller/listcontroller.dart';
import 'package:doctor/model/listmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ContactsList extends StatelessWidget {
  ContactsList({super.key});
  ListController controller = Get.put(ListController());

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.red[200],
            centerTitle: true,
            shadowColor: const Color.fromARGB(255, 217, 140, 140),
            title: const Text('patients',
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold))),
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: 'Search',
                  contentPadding:
                      const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32.0)),
                ),
              ),
            ),
            GetBuilder<ListController>(builder: (controller) {
              if (controller.pationtlist.isEmpty) {
                controller.getdata();
              }
              return controller.pationtlist.isNotEmpty
                  ? Expanded(
                      child: ListView.builder(
                        itemCount: controller.pationtlist.length,
                        itemBuilder: (context, index) {
                          // if filter is null or empty returns all data
                          return
                              // filter == null || filter == ""
                              ListTile(
                            title: Text(
                              controller.pationtlist[index].patientName!,
                            ),
                            subtitle: Text(
                                controller.pationtlist[index].description!),
                            leading: CircleAvatar(
                                backgroundColor: Colors.red[200],
                                child: Text(
                                    style: const TextStyle(color: Colors.white),
                                    controller.pationtlist[index].patientName!
                                        .substring(0, 1))),
                            onTap: () => _onTapItem(
                                context, controller.pationtlist[index]),
                          );
                        },
                      ),
                    )
                  : const Center(
                      child: CircularProgressIndicator(),
                    );
            })
          ],
        ));
  }

  void _onTapItem(BuildContext context, Data post) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        // ignore: prefer_interpolation_to_compose_strings
        content: Text("Tap on " ' - ' + post.patientName!),
      ),
    );
  }
}






























 // : controller.pationtlist[index]
                  //         .patientName!
                  //         .toLowerCase()
                  //         .contains(filter!.toLowerCase())
                  //     ? ListTile(
                  //         title: Text(
                  //           controller.pationtlist[index].patientName!,
                  //         ),
                  //         subtitle: Text(controller.pationtlist[index].description!),
                  //         leading: CircleAvatar(
                  //             backgroundColor: Colors.blue,
                  //             child: Text(controller.pationtlist[index]
                  //                 .patientName!
                  //                 .substring(0, 1))),
                  //         onTap: () => _onTapItem(context, controller.pationtlist[index]),
                  //       )
                  //     : Container();