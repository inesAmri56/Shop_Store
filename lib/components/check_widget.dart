import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_store/components/text_utils.dart';

class CheckWidget  extends StatelessWidget {
  const  CheckWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: (){},
          child: Container(
             height: 35,
              width: 35,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
            child: Image.asset('assets/images/check.png'),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Row(
          children: [
            TextUtils(text: 'I accept', fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Colors.black, underline: TextDecoration.none),
    TextUtils(text: 'terms & conditions',
    fontSize: 16, fontWeight: FontWeight.normal,
    underline: TextDecoration.underline,
       color: Colors.black,)

    ],

        )
      ],
    );
  }
}
