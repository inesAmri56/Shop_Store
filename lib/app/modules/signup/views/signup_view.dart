import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_store/app/modules/login/views/login_view.dart';
import 'package:shop_store/components/auth/auth_button.dart';
import 'package:shop_store/components/auth/auth_text_field.dart';

import 'package:shop_store/components/check_widget.dart';
import 'package:shop_store/components/text_utils.dart';
import 'package:shop_store/components/theme.dart';
import '../../../../components/auth/containe_under.dart';
import '../../../../components/auth/mystring.dart';
import '../../mainscreen/views/mainscreen_view.dart';
import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  SignupView({Key? key}) : super(key: key);
  SignupController controller = Get.put(SignupController());
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        appBar: AppBar(
          backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
          elevation: 0,
        ),
        backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 1.3,
                child: Padding(
                  padding: EdgeInsets.only(left: 25, right: 25, top: 40),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            TextUtils(
                              text: 'SIGN',
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                              color: Get.isDarkMode ? mainColor : pinkClr,
                              underline: TextDecoration.none,
                            ),
                            SizedBox(width: 3),
                            TextUtils(
                              text: 'Up',
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                              color: Get.isDarkMode ? Colors.black : Colors.white,
                              underline: TextDecoration.none,
                            ),
                          ],
                        ),
                        SizedBox(height: 50),
                        AuthTextFromField(
                          controller: controller.name,
                          obscuredText: false,
                          validator: (value) {
                            if (value.toString().length <= 4 || RegExp(validationName).hasMatch(value)) {
                              return "Enter valid Name";
                            } else return null;
                          },
                          prefixIcon: Get.isDarkMode
                              ? Image.asset('assets/images/user.png')
                              : Icon(Icons.person, color: pinkClr, size: 30),
                          suffixIcon: Text(""),
                          hintText: "Username",
                        ),
                        SizedBox(height: 20),
                        AuthTextFromField(
                          controller: controller.email,
                          obscuredText: false,
                          validator: (value) {
                            if (!RegExp(validationEmail).hasMatch(value)) {
                              return "Invalid Email";
                            } else return null;
                          },
                          prefixIcon: Get.isDarkMode
                              ? Image.asset('assets/images/email.png')
                              : Icon(Icons.email, color: pinkClr, size: 30),
                          suffixIcon: Text(""),
                          hintText: "Email",
                        ),
                        SizedBox(height: 20),
                        GetBuilder<SignupController>(builder: (_) {
                          return AuthTextFromField(
                            controller: controller.password,
                            obscuredText: !controller.isVisibility ? false: true, // Use controller.isVisibility.value
                            validator: (value) {
                              if (value.toString().length < 6) {
                                return "Password should be longer or equal to 6 characters";
                              } else {
                                return null;
                              }
                            },
                            prefixIcon: Get.isDarkMode
                                ? Image.asset('assets/images/lock.png')
                                : Icon(Icons.lock, color: pinkClr, size: 30),
                            suffixIcon: IconButton(
                              onPressed: () {
                                controller.visibility();
                              },
                              icon: controller.isVisibility
                                  ? Icon(Icons.visibility_off, color: Colors.black)
                                  : Icon(Icons.visibility, color: Colors.black),
                            ),
                            hintText: "Password",
                          );
                        }),
                        SizedBox(height: 50),
                        CheckWidget(),
                        SizedBox(height: 50),
                        AuthButton(onPressed: () {
                          Get.to(MainscreenView());
                        }, text: "Sign Up"),
                      ],
                    ),
                  ),
                ),
              ),
              Center(
                child: ContainerUnder(
                  text: "Already have an Account?",
                  textType: "log In",
                  onPressed: () {
                    Get.to(LoginView());
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
