import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_store/components/theme.dart';

class SizeList extends StatefulWidget {
  const SizeList({super.key });

  @override
  State<SizeList> createState() => _SizeListState();
}

class _SizeListState extends State<SizeList> {
  var currentSelected=0;
  @override
  Widget build(BuildContext context) {
   final  List <String>  sizeList=['S','M','L','XL','XXL'];
    return Container(
      height: 60,
        padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 10),
      child: ListView.separated
    (
        scrollDirection: Axis.horizontal,
        itemBuilder:(context,index){
      return GestureDetector(
      onTap: (){
       setState(() {
         currentSelected=index;
       });
      },
    child: Container(
    padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
    decoration: BoxDecoration(
    color:currentSelected==index?mainColor.withOpacity(0.4):Colors.white ,
    borderRadius: BorderRadius.circular(15),
    border: Border.all(
    color: Colors.grey.withOpacity(0.4)
    )
    ),
    child: Text(
    sizeList[index],
        style: TextStyle(
        color: Colors.black,
            fontWeight: FontWeight.bold
    ),
    ),
    
    ),
      );
    },
    separatorBuilder: (context,index)=>const SizedBox(
    width: 10,
    ),
    itemCount: sizeList.length,
    ));
  }
}

