import 'package:doctor/controller/authcontroller/signupcontroller.dart';
import 'package:doctor/view/auth/login/login.dart';
import 'package:doctor/view/auth/login/loginwidgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  SignUpController controller = Get.put(SignUpController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red[200],
          title: const Text('Register'),
          centerTitle: true,
          elevation: 0.0,
          titleTextStyle: const TextTheme(
            titleLarge: TextStyle(
              // headline6 is used for setting title's theme
              color: Colors.white,
              fontSize: 20,
              locale: Locale.fromSubtags(),
            ),
          ).titleLarge,
        ),
        backgroundColor: Colors.grey[300],
        body: SingleChildScrollView(
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    margin: const EdgeInsets.all(10.0),
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.deepOrange[100]!.withOpacity(0.5),
                          spreadRadius: 7,
                          blurRadius: 10,
                          offset: const Offset(4, 4),
                        ),
                      ],
                      image: const DecorationImage(
                        image: AssetImage("assets/images/img_2.png"),
                      ),
                    ),
                  ),
                  const SizedBox(height: 22.0),
                  TextFormField(
                    controller: controller.username,
                    decoration: InputDecoration(
                      labelStyle: TextStyle(color: Colors.red[200]),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: const BorderSide(
                            color: Colors.black,
                          )),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      labelText: 'Username',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your username';
                      } else if (value.length < 3) {
                        return 'Name must be more than 2 charater';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 22.0),
                  TextFormField(
                      controller: controller.password,
                      decoration: InputDecoration(
                        labelStyle: TextStyle(color: Colors.red[200]),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: const BorderSide(
                              color: Colors.black,
                            )),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        labelText: '*******',
                      ),
                      obscureText: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your password';
                        } else if (value.length < 6) {
                          return 'password must be at Least 6 charater';
                        }
                        return null;
                      }),
                  const SizedBox(height: 22.0),
                  TextFormField(
                    controller: controller.email,
                    decoration: InputDecoration(
                      labelStyle: TextStyle(color: Colors.red[200]),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: const BorderSide(
                            color: Colors.black,
                          )),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      labelText: 'Alax@gmail.com',
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      String pattern =
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
                      RegExp regExp = RegExp(pattern);
                      if (value!.isEmpty) {
                        return 'Please enter Email';
                      } else if (!regExp.hasMatch(value)) {
                        return 'Please enter valid Email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    controller: controller.mobile,
                    decoration: InputDecoration(
                      labelStyle: TextStyle(color: Colors.red[200]),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: const BorderSide(
                            color: Colors.black,
                          )),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      labelText: 'mobile',
                    ),
                    keyboardType: TextInputType.phone,
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
                  ),
                  const SizedBox(height: 30.0),
                  CustomRoundedButton(
                    text: 'Register',
                    // load: state is RegisterLoading ? true : false,
                    textColor: Colors.white,
                    pressed: () {
                      if (_formKey.currentState!.validate()) {
                        controller.userSignUp(
                            email: controller.email.text,
                            passwor: controller.password.text,
                            mobile: controller.mobile.text,
                            username: controller.username.text);
                        Get.to(() => LoginScreen());
                      } else {
                        // print("false");
                        return;
                      }
                    },
                  ),
                  const SizedBox(height: 10),
                  InkWell(
                    onTap: () {
                      // Navigator.of(context).push(
                      //   MaterialPageRoute(
                      //     builder: (context) => const LoginHomePage(),
                      //   ),
                      // );
                    },
                    child: const Text(
                      'Have an account? Sign In',
                      style: TextStyle(
                        color: Colors.black, // set the color to red
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.grey)),
                        child: IconButton(
                          icon: const Icon(
                            FontAwesomeIcons.facebook,
                            size: 30,
                            color: Colors.blue,
                          ),
                          onPressed: () {
                            // handle Facebook button press
                          },
                        ),
                      ),
                      const SizedBox(width: 5),
                      Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.grey)),
                        child: IconButton(
                          icon: const Icon(
                            FontAwesomeIcons.twitter,
                            size: 30,
                            color: Colors.lightBlueAccent,
                          ),
                          onPressed: () {
                            // handle Twitter button press
                          },
                        ),
                      ),
                      const SizedBox(width: 5),
                      Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.grey)),
                        child: IconButton(
                          icon: Icon(
                            FontAwesomeIcons.google,
                            size: 30,
                            color: Colors.red[200],
                          ),
                          onPressed: () {
                            // handle Google button press
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
