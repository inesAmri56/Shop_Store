
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_store/app/modules/login/controllers/login_controller.dart';
import 'package:shop_store/app/modules/payment/controllers/payment_controller.dart';
import 'package:shop_store/components/text_utils.dart';
import 'package:shop_store/components/theme.dart';
int radioContainerIndex=1;
class DeliveryContainerWidget extends StatefulWidget {

   DeliveryContainerWidget({super.key});

  @override
  State<DeliveryContainerWidget> createState() => _DeliveryContainerWidgetState();
}

class _DeliveryContainerWidgetState extends State<DeliveryContainerWidget> {
  bool changeColor=false;
  final TextEditingController phoneController = TextEditingController();
  final PaymentController controller=Get.put(PaymentController());
  LoginController authController = Get.put(LoginController());


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildRadioWidget(
            color:changeColor?Colors.white:Colors.grey.shade300,
            value: 1, name: 'Noussa Store',
            icon: Container() ,
            tilte: 'Noussa Shop',
            phone:"5656****", adress: 'Sfax/Tunis',
            onchanged: (int ?value){
              setState(() {
                radioContainerIndex=value!;
                changeColor=!changeColor;
              });
            }),
        const SizedBox(
          height: 10,
        ),
        buildRadioWidget(
            color:changeColor?Colors.grey.shade300 :Colors.white,
            icon:InkWell(
                  onTap: (){
                  Get.defaultDialog(
                  title: 'enter your phone number',
                  titleStyle: TextStyle(fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold ),
                    backgroundColor: Colors.white,
                    radius: 10,
                    textCancel: "cancel",
                    cancelTextColor: Colors.black,
                    textConfirm: "Save",
                    confirmTextColor: Colors.black,
                    onCancel: (){
                    Get.toNamed("/payment");
                    },
                    onConfirm: () {
                      Get.back();
                      controller.phoneNumber.value=phoneController.text;
                    },
                 buttonColor: mainColor,
                    content: Padding(padding: EdgeInsets.all(15),
                      child: TextField(
                        controller: phoneController,

                        cursorColor: Colors.black,
                        keyboardType: TextInputType.text,
                      onSubmitted: (value){phoneController.text=value;},
                        maxLength: 8,
                        decoration: InputDecoration(
                          fillColor: mainColor.withOpacity(0.2),
                          focusColor: Colors.red,
                          prefixIcon: Icon(Icons.phone, color:mainColor,
                          ),
                          suffixIcon: IconButton(
                            onPressed: (){
                           phoneController.clear();
                            },
                            icon: const Icon(Icons.close),
                          ),
                          hintText: "Enter Your Phone Number",
                          hintStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                          filled: true,


                        ),
                      ),
                    )
                  );
                  },
              child: Expanded(
                child: Icon(Icons.contact_phone,
                  size: 15,
                    color: Get.isDarkMode?Colors.white:
                    mainColor,
                
                ),
              ),
            ),
            value: 2, name:
             ' Fawzi Amri ',
            tilte: 'Delivery',
            phone: controller.phoneNumber.value, adress: 'Sfax/Tunis',
            onchanged: (int ?value){
              setState(() {
                radioContainerIndex=value!;
                changeColor=!changeColor;
              });
            }),
      ],
    );
  }
}
Widget buildRadioWidget({
    required Color color,
required int value,
  required String name,
  required String tilte,
  required String phone,
  required String adress,
required Function onchanged,
  required Widget icon,
}

    ){

  return Container(
    height: 170,
      width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: color,
      boxShadow:[
        BoxShadow(
          color:Colors.grey.withOpacity(0.2),
          spreadRadius: 3.0,
          blurRadius: 5.0,
        ),
      ]
    ),
child: Row(
  mainAxisAlignment: MainAxisAlignment.start,
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Radio(
        value:value ,
        groupValue: radioContainerIndex,
        fillColor: MaterialStateColor.resolveWith((states) => Colors.red),
        onChanged: (int ? value){
          onchanged(value);
        }),
    const SizedBox(
      width: 10,
    ),
    Padding(padding: EdgeInsets.only(top: 10),
      child: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextUtils(text:tilte , fontSize: 20,
                fontWeight: FontWeight.bold, color: Colors.black,
                underline: TextDecoration.none),
            const SizedBox(
              height: 5,
            ),
            TextUtils(text:name , fontSize: 15,
                fontWeight: FontWeight.normal, color: Colors.black,
                underline: TextDecoration.none),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                const Text("🇹🇳+216"),
                TextUtils(text:phone , fontSize: 15,
                    fontWeight: FontWeight.normal, color: Colors.black,
                    underline: TextDecoration.none),
                const SizedBox(
                  width: 120,
                ),
                SizedBox(
                  child: icon,
                )
              ],
            ),
             const SizedBox(height: 5,
            ),
            TextUtils(text:adress , fontSize: 15,
                fontWeight: FontWeight.normal, color: Colors.black,
                underline: TextDecoration.none),
        
          ],
        ),
      ),
    ),

  ],
),
  );
}