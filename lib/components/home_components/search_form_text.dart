import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchFormText extends StatelessWidget {
  const SearchFormText({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.black,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        fillColor: Colors.white,
        focusColor: Colors.red,
        prefixIcon: Icon(Icons.search,color: Colors.grey,
        ),
        hintText: "Search you're Looking for",
        hintStyle: TextStyle(
          color: Colors.black45,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
        filled: true,


      ),
);
  }}