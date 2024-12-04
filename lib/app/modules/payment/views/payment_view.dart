import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shop_store/components/text_utils.dart';

import '../../../../components/auth/auth_button.dart';
import '../../../../components/theme.dart';
import '../../../../components/widgets/payment/deliveryContainerWidget.dart';
import '../../../../components/widgets/payment/paymentMethodWidget.dart';
import '../controllers/payment_controller.dart';

class PaymentView extends GetView<PaymentController> {
  const PaymentView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('PayMent'.tr,style: TextStyle(
          color: Colors.white
        ),),
        elevation: 0,
        backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
        centerTitle: true,

      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start, // Align children to the left
              children: [
                TextUtils(
                  text: "Shipping to",
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  underline: TextDecoration.none,
                ),
                const SizedBox(height: 10),
                DeliveryContainerWidget(),
                const SizedBox(height: 10),
                TextUtils(
                  text: "Payment method",
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  underline: TextDecoration.none,
                ),
                const SizedBox(height: 10),
                PaymentMethodWidget(),
                const SizedBox(height: 20),
                Center(
                  child: TextUtils(
                    text: "Total: 200\$",
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    underline: TextDecoration.none,
                  ),
                ),
                SizedBox(height: 20,),
                Center(
                  child: SizedBox(
                    height: 50,
                      width: 150,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),

                        ),
                        elevation: 0,
                        primary: mainColor,
                      ),
                      onPressed: (){},
                      child: Text("Pay Now".tr,
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white
                      ),),
                    )
                ))
              ],
            ),
          ),
        ),
      ),

    );
  }
}
