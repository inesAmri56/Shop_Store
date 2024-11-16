import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shop_store/app/modules/login/views/login_view.dart';
import 'package:shop_store/app/modules/signup/views/signup_view.dart';
import 'package:shop_store/components/text_utils.dart';
import 'package:shop_store/components/theme.dart';

import '../controllers/welcome_controller.dart';

class WelcomeView extends GetView<WelcomeController> {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Padding(
            padding: EdgeInsets.only(top: 60),
              child: SizedBox(
                // width: double.infinity,
                // height: double.infinity,
                 child: Lottie.asset('assets/animation/Animation - 1718983793209.json',
                   height: 250,
                   width: 300,
                   repeat: true,
                   reverse: true,
                   fit: BoxFit.cover,
                 )            // Image.asset(
                //   'assets/images/background.png',
                //   fit: BoxFit.cover,
                // ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.black.withOpacity(0.2),
                width: double.infinity,
                height: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 250,
                    ),
                    Container(
                      height: 60,
                      width: 190,
                      decoration: BoxDecoration(
                        //color: Colors.black.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: TextUtils(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          text: "Welcome Our",
                          color: Colors.white,
                          underline: TextDecoration.none,
              
                        ),
              
              
                      ),
              
                    ),
              
                    Container(
                      height: 60,
                      width: 230,
                      decoration: BoxDecoration(
                       // color: Colors.black.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextUtils(
                            text: "Shop",
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: mainColor,
                            underline: TextDecoration.none,
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          TextUtils(
                            text: "Store",
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            underline: TextDecoration.none,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Get.off(LoginView());
                      },
                      style: ElevatedButton.styleFrom(
                        primary: mainColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 12),
                      ),
                      child: TextUtils(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        text: "Get Start",
                        color: Colors.white,
                        underline: TextDecoration.none,
              
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextUtils(text:"Don't have an Account" , fontSize: 18,
                            fontWeight: FontWeight.normal,
                            color: Colors.white,
                          underline: TextDecoration.none,
                         ),
                        TextButton(onPressed: (){
                          Get.to(SignupView());
                        },
                            child: const TextUtils(
                              text: "Sign Up",
                               fontWeight: FontWeight.normal,
                               fontSize: 18,
                               color: Colors.white,
                              underline: TextDecoration.underline,
                             ),
                            ),
              
                      ],
                    )
              
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}