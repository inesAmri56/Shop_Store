

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shop_store/components/auth/auth_button.dart';
import 'package:shop_store/components/theme.dart';
import '../../../../components/auth/auth_text_field.dart';
import '../../../../components/auth/mystring.dart';
import '../controllers/forget_password_controller.dart';

class ForgetPasswordView extends GetView<ForgetPasswordController> {
   ForgetPasswordView({Key? key}) : super(key: key);
  final formKey =  GlobalKey<FormState>();
  ForgetPasswordController controller= Get.put(ForgetPasswordController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(child:Scaffold(
      backgroundColor:context.theme.backgroundColor,
      appBar: AppBar(

        title: Text("Reset Your Password",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        leading:IconButton(
          onPressed: (){
            Get.back();
          },
          icon: Icon(
          Icons.arrow_back,color: Get.isDarkMode? Colors.black:Colors.white,
          ),
        ) ,
      ),

      body: Form(
        key: formKey ,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ), child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  onPressed:(){
                    Get.back();
                  } ,
                  icon: Icon(
                    Icons.class_rounded,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text("If uou want to recover your account, then please provide your email ID bellow",
              style:TextStyle(
                color: Get.isDarkMode?Colors.black:Colors.white
              ) ,),
      const SizedBox(
         height: 50,
              ),
              Image.asset('assets/images/forgot_passwordpurple.jpg',
                width: 250,),
              const SizedBox(
                height: 50,
              ),
              AuthTextFromField(
                controller: controller.email,
                obscuredText: false,
                validator: (value) {
                  if (!RegExp(validationEmail).hasMatch(value!)) {
                    return "Invalid Email";
                  } else return null;
                },
                prefixIcon: Get.isDarkMode
                    ? Image.asset('assets/images/email.png')
                    : Icon(Icons.email, color: mainColor, size: 30),
                suffixIcon: Text(""),
                hintText: "Email",
              ),
              SizedBox(
                height: 50,
              ),
              AuthButton(onPressed:(){}, text: "SEND")
            ],
          ),
          ) ,
        ),
      ) ,
    ));

  }
}
