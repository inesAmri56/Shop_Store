import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_store/components/text_utils.dart';
import 'package:shop_store/components/theme.dart';

int radioPaymentIndex = 1;

class PaymentMethodWidget extends StatefulWidget {
  const PaymentMethodWidget({super.key});

  @override
  State<PaymentMethodWidget> createState() => _PaymentMethodWidgetState();
}

class _PaymentMethodWidgetState extends State<PaymentMethodWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          buildRadioPayment(
            image: 'assets/images/paypal.png',
            scale: 0.7,
            name: 'Paypal',
            value: 1,
            onchanged: (int? value) {
              setState(() {
                radioPaymentIndex = value!;
              });
            },
          ),
          const SizedBox(height: 5),
          buildRadioPayment(
            image: 'assets/images/google.png',
            scale: 0.7,
            name: 'Google Pay',
            value: 2,
            onchanged: (int? value) {
              setState(() {
                radioPaymentIndex = value!;
              });
            },
          ),
          const SizedBox(height: 5),
          buildRadioPayment(
            image: 'assets/images/credit.png',
            scale: 0.7,
            name: 'Credit Card',
            value: 3,
            onchanged: (int? value) {
              setState(() {
                radioPaymentIndex = value!;
              });
            },
          ),
        ],
      ),
    );
  }
}

Widget buildRadioPayment({
  required String image,
  required double scale,
  required String name,
  required int value,
  required Function onchanged,
}) {
  return Container(
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: Colors.grey.shade300,
      borderRadius: BorderRadius.circular(8),
    ),
    child: Row(
      children: [
        Image.asset(
          image,
          scale: scale,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextUtils(
                text: name,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                underline: TextDecoration.none,
              ),
            ],
          ),
        ),
        Radio<int>(
          value: value,
          groupValue: radioPaymentIndex,
          fillColor: MaterialStateColor.resolveWith((states) => mainColor),
          onChanged: (int? value) {
            onchanged(value);
          },
        ),
      ],
    ),
  );
}
