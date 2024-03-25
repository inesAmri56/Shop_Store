import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_store/app/modules/forget_password/views/forget_password_view.dart';
import 'package:shop_store/app/modules/login/controllers/login_controller.dart';
import 'package:shop_store/app/modules/signup/views/signup_view.dart';
import 'package:shop_store/components/auth/auth_button.dart';
import 'package:shop_store/components/auth/auth_text_field.dart';
import 'package:shop_store/components/auth/mystring.dart';
import 'package:shop_store/components/text_utils.dart';
import 'package:shop_store/components/theme.dart';
import '../../../../components/auth/containe_under.dart';
import '../../../../components/check_widget.dart';

class LoginView extends GetView<LoginController> {
  LoginView({Key? key}) : super(key: key);
 LoginController controller = Get.put(LoginController());
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
                              text: 'LOG',
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                              color: Get.isDarkMode ? mainColor : pinkClr,
                              underline: TextDecoration.none,
                            ),
                            SizedBox(width: 3),
                            TextUtils(
                              text: 'IN',
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                              color: Get.isDarkMode ? Colors.black : Colors.white,
                              underline: TextDecoration.none,
                            ),
                          ],
                        ),
                        SizedBox(height: 50),

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
                        GetBuilder<LoginController>(builder: (_) {
                          return AuthTextFromField(
                            controller: controller.password,
                            obscuredText: !controller.isVisibility ? false: true, // Use controller.isVisibility.value
                            validator: (value) {
                              if (value.toString().length < 6) {
                                return "Password should be longer or equal to 6 characters";
                              } else return null;
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
                        SizedBox(height: 20),
                        GetBuilder<LoginController>(builder: (_){
                          return Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: (){
                                Get.to(ForgetPasswordView());
                              },
                              child: TextUtils(text: "Forgot Password?", fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color:Get.isDarkMode?Colors.black: Colors.white,
                                  underline: TextDecoration.none),
                            ),
                          );
                        },

                        ),
                        const SizedBox(height: 20),
                        AuthButton(onPressed: () {}, text: "Log In"),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: (){},
                    child: Image.asset("assets/images/facebook.png"),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: (){},
                    child: Image.asset("assets/images/google.png"),
                  ),

                ],
              ),
              Center(
                child: ContainerUnder(
                  text: "Don't have an Account?",
                  textType: "log In",
                  onPressed: () {
                    Get.to(SignupView());
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
