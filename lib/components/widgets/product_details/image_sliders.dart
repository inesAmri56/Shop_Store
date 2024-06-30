
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_store/components/theme.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImageSliders extends StatefulWidget {
  final String imageUrl;
  const ImageSliders({super.key, required this.imageUrl});

  @override
  State<ImageSliders> createState() => _ImageSlidersState();
}

class _ImageSlidersState extends State<ImageSliders> {
  CarouselController carouselController=Get.put(CarouselController());
   int currentPage=0;
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
        ),))
      ],
    );
  }
}
