
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_store/app/modules/cartScreen/controllers/cart_screen_controller.dart';
import 'package:shop_store/components/theme.dart';
import 'package:shop_store/components/widgets/product_details/color_picker.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../app/routes/app_pages.dart';
import 'package:badges/badges.dart' as badges;

class ImageSliders extends StatefulWidget {
  final String imageUrl;
  const ImageSliders({super.key, required this.imageUrl});

  @override
  State<ImageSliders> createState() => _ImageSlidersState();
}

class _ImageSlidersState extends State<ImageSliders> {
  CarouselController carouselController=Get.put(CarouselController());
 int currentPage=0;
 int currentColor=0;
   final List<Color> colorSelected=[
     kCOlor1,
     kCOlor2,
     kCOlor3,
     kCOlor4,
     kCOlor5
   ];

 final cartController =Get.find<CartScreenController>();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider.builder(itemCount: 3,
           carouselController:carouselController,
            options: CarouselOptions(
              height: 500,
              autoPlay: true,
              enlargeCenterPage: true,
              enableInfiniteScroll: false,
              autoPlayInterval: Duration(seconds: 2),
              viewportFraction: 1,
              onPageChanged: (index,reson){
                setState(() {
                  currentPage=index;
                });
              }

            ),
        itemBuilder: (context,index,realIndex){
          return Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(widget.imageUrl,
                ),
                fit: BoxFit.fill,
              ),
              borderRadius: BorderRadius.circular(25),

            ),

          );
        }
        ),
        Positioned(
          bottom: 30,
        left: 180,
            child: AnimatedSmoothIndicator(
            activeIndex: currentPage,
            count: 3,
        effect: ExpandingDotsEffect(
          dotHeight: 10,
          dotWidth: 10,
          activeDotColor: mainColor,
          dotColor: Colors.black,
        ),)),
        Positioned(
          bottom: 30,
            right: 30,
            child: Container(
          height:200 ,
            width:50,
          padding: const EdgeInsets.all(8) ,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.3),
            borderRadius: BorderRadius.circular(30),
          ),
              child: ListView.separated(itemBuilder: (context,index){
                return GestureDetector(
                  onTap: (){
                    setState(() {
                      currentColor=index;
                    });
                  },
                  child: ColorPicker(outerBorder: currentColor==index,
                      color:colorSelected[index]),
                );
              },
                  separatorBuilder: (context,index)=>SizedBox(
                    height: 3,
                  ),
                  itemCount: colorSelected.length),
        )),
        Container(
          padding: EdgeInsets.only(top:20 ,
          left:25 ,right:25 ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
           InkWell(
             onTap: (){
                Get.back();
             },
             child: Container(
               padding: const  EdgeInsets.all(8),
               decoration: BoxDecoration(
                 color: Get.isDarkMode?pinkClr.withOpacity(0.8):mainColor.withOpacity(0.8),
                 shape: BoxShape.circle
               ),
               child: Padding(
                 padding: EdgeInsets.only(left: 10),
                 child: Icon(
                   Icons.arrow_back_ios,
                   color: Get.isDarkMode?Colors.black:Colors.white,
                   size: 20,
                 ),
               ),

             ),
           ),
              Obx(() =>
                 badges.Badge(
                   position: badges.BadgePosition.topEnd(top: -10, end: -10),
                   animationDuration: Duration(milliseconds: 300),
                   animationType: badges.BadgeAnimationType.slide,
                   badgeContent:  Text(
                     cartController.quantity().toString(),
                     style: TextStyle(color: Colors.white),
                   ),
                   child: InkWell(
                     onTap: (){
                       Get.toNamed(Routes.CART_SCREEN);
                     },
                     child: Container(
                       padding: const  EdgeInsets.all(8),
                       decoration: BoxDecoration(
                           color: Get.isDarkMode?pinkClr.withOpacity(0.8):mainColor.withOpacity(0.8),
                           shape: BoxShape.circle
                       ),
                       child: Icon(
                         Icons.shopping_cart,
                         color: Get.isDarkMode?Colors.black:Colors.white,
                         size: 20,
                       ),
                     ),

                   ),
                 ),)

            ],
          ),

        )
      ],
    );
  }
}
