import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shop_store/components/auth/auth_button.dart';
import 'package:shop_store/components/auth/auth_text_field.dart';
import 'package:shop_store/components/text_utils.dart';
import 'package:shop_store/components/theme.dart';

import '../../../../components/auth/containe_under.dart';
import '../../../../components/check_widget.dart';
import '../controllers/signup_controller.dart';
  
class SignupView extends GetView<SignupController> {
  final SignupController controller = Get.put(SignupController());
  SignupView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(child:Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height/1.3,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 25,right: 25,top: 40
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        TextUtils(text: 'SIGN', fontSize: 28,
                            fontWeight:FontWeight.w500, color: mainColor,
                            underline: TextDecoration.none),
                        SizedBox(
                          width: 3,
                        ),
                        TextUtils(text: 'Up', fontSize: 28,
                            fontWeight:FontWeight.w500, color: Colors.black,
                            underline: TextDecoration.none)
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    AuthTextFromField(controller: controller.name,
                      obscuredText: false,
                      validator:(){} ,
                      prefixIcon: Image.asset('assets/images/user.png'),
                      suffixIcon: Text(""),
                      hintText: "Username",

                    ),
                    SizedBox(
                      height: 20,
                    ),
                    AuthTextFromField(controller: controller.email,
                      obscuredText: false,
                      validator:(){} ,
                      prefixIcon: Image.asset('assets/images/email.png'),
                      suffixIcon: Text(""),
                      hintText: "Email",

                    ),
                    SizedBox(
                      height: 20,
                    ),
                    AuthTextFromField(controller: controller.password,
                      obscuredText: true,
                      validator:(){} ,
                      prefixIcon: Image.asset('assets/images/lock.png'),
                      suffixIcon: Text(""),
                      hintText: "Password",

                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    CheckWidget(),
                    SizedBox(
                      height: 50,
                    ),
                    AuthButton(onPressed: (){},
                        text: "Sign Up")

                  ],
                ),
              ),
            ),
            Center(
              child: ContainerUnder(
                text:"Already have an Account?" ,
                textType: "log In",
                onPressed: (){},
              ),
            ),
          ],
        ),
      )
  )
    );
  }
}

