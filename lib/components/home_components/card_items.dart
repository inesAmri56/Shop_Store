import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_store/components/text_utils.dart';

import '../theme.dart';

class CardItems extends StatelessWidget {
  const CardItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        itemCount: 10,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            childAspectRatio: 0.8,
            mainAxisSpacing: 9.0,
            crossAxisSpacing: 6,
            maxCrossAxisExtent: 200,
          ),
        itemBuilder: (context,index){
          return BuildCardItems();
        },
      ),
    );
  }
}
Widget BuildCardItems(){
  return Padding(padding: const EdgeInsets.all(5),
  child: Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 3.0,
          blurRadius: 5.0,
        ),
      ],
    ),
     child: Column(
       children: [
         Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             IconButton(onPressed: (){},
                 icon:  Icon(
                   Icons.favorite_outline,
                   color: Get.isDarkMode? mainColor:Colors.black,
                 ),),
             IconButton(onPressed: (){},
               icon:  Icon(
                 Icons.add,
                 color: Get.isDarkMode? mainColor:Colors.black,
               ),),


           ],
         ),
         //Container de l'image
         Container(
           width: double.infinity,
           height: 140,
           decoration: BoxDecoration(
             color: Colors.white,
             borderRadius: BorderRadius.circular(10)
           ),
           child: Image.asset('assets/images/hoody.jpg',
             fit: BoxFit.fitHeight,)

         ),
          Padding(

           padding: EdgeInsets.only(left:15, right: 15 ,top: 10),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Text("\$15",
                 style: TextStyle(
                     color: Colors.black,
                 fontWeight: FontWeight.bold),),

               Container(
                 height: 20,
                   width: 45,
                 decoration: BoxDecoration(
                   color:  mainColor,
                   borderRadius: BorderRadius.circular(10),
                 ),
                 child:  Padding(
                   padding: EdgeInsets.only(left: 3,right: 2),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,                     children: [
                       TextUtils(text: "4.7",
                           fontSize: 13,
                           fontWeight: FontWeight.bold,
                           color: Colors.white,
                           underline: TextDecoration.none),
                       Icon(Icons.star,
                       size: 14,
                       color: Colors.white)
                     ],
                   ),
                 ) ,
               )
             ],
           ),
         )
       ],
     ),
  ),
  );
}