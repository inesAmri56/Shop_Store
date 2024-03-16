import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_store/components/text_utils.dart';
import 'package:shop_store/components/theme.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final Function () onPressed;
 const AuthButton ({
   required this.onPressed,
   required this.text,
    super.key

  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: mainColor,
        minimumSize: const Size(360, 50),
      ),
      child: TextUtils(
        color: Colors.white,
        text:text ,
        fontSize: 18,
          fontWeight: FontWeight.bold,
        underline: TextDecoration.none,
      ),
    );
  }
}
