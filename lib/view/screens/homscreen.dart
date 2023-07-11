import 'package:doctor/view/screens/gridscreens/checkheartscreen.dart';
import 'package:doctor/view/screens/gridscreens/checklangscreen.dart';
import 'package:doctor/view/screens/gridscreens/murmurscreen.dart';
import 'package:doctor/view/screens/gridscreens/viewpationtscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context)
        .size; //this gonna give us total height and with of our device
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * 0.26,
            decoration: BoxDecoration(
              color: Colors.red[200],
              // image: const DecorationImage(
              //     scale: 0.1,
              //     fit: BoxFit.cover,
              //     alignment: Alignment.centerLeft,
              //     image: AssetImage(
              //       "assets/images/undraw_pilates_gpdb.png",
              //     )),
            ),
            alignment: Alignment
                .topRight, // تحديد موضع الـ Container داخل الـ parent widget
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Stack(
                  alignment: AlignmentDirectional.topEnd,
                  children: [
                    Stack(
                      alignment: AlignmentDirectional.centerEnd,
                      children: [
                        Container(
                          height: 180.0,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.brown.withOpacity(.2),
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                            bottom: 50,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    ' PULMO',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineLarge!
                                        .copyWith(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 25,
                                        ),
                                  ),
                                  Text(
                                    'CARDIA',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineLarge!
                                        .copyWith(
                                          color: Colors.teal,
                                          fontWeight: FontWeight.w900,
                                          fontSize: 25,
                                        ),
                                  ),
                                ],
                              ),
                              Container(
                                width: 250,
                                margin: const EdgeInsets.only(left: 25),
                                child: Text(
                                  'Changing the way to diagnose medical sounds..',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                        color: Colors.white,
                                        fontSize: 12,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Positioned(
                      bottom: 10,
                      right: 0,
                      child: Padding(
                        padding: EdgeInsets.only(top: 20.0),
                        child: Image(
                          height: 145,
                          width: 120,
                          fit: BoxFit.cover,
                          image: AssetImage(
                            'assets/images/Medicalcare-pana (2).png',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: .8,
                    crossAxisSpacing: 50,
                    mainAxisSpacing: 20,
                    children: <Widget>[
                      InkWell(
                        child: const CategoryCard(
                          title: "check murmur",
                          svgSrc: "assets/icons/murmur.svg",
                        ),
                        onTap: () {
                          Get.to(() => CheckMurmur());
                        },
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(() => Checklung());
                        },
                        child: const CategoryCard(
                          title: "lung",
                          svgSrc: "assets/icons/lungs.svg",
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(() => CheckHeartBeat());
                        },
                        child: const CategoryCard(
                          title: "check heartbeat",
                          svgSrc: "assets/icons/heart_rate.svg",
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(() => ContactsList());
                        },
                        child: const CategoryCard(
                          title: "view patients",
                          svgSrc: "assets/icons/notes.svg",
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String svgSrc;
  final String title;
  final Function? press;
  const CategoryCard({
    super.key,
    required this.svgSrc,
    required this.title,
    this.press,
    Image? child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Card(
        elevation: 5.0,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Material(
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                const Spacer(),
                // ignore: deprecated_member_use
                SvgPicture.asset(svgSrc, height: 80, color: Colors.red[200]),
                const Spacer(),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(fontSize: 15),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
