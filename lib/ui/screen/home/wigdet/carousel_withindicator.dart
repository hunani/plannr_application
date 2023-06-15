import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plannr_app/ui/screen/home/controller/home_controller.dart';

class CarouselWithIndicator extends StatefulWidget {
  const CarouselWithIndicator({Key? key}) : super(key: key);

  @override
  State<CarouselWithIndicator> createState() => _CarouselWithIndicatorState();
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicator> {
  int _current = 0;
  CarouselController carouselController = CarouselController();

  List<String> imgList = [
    "assets/image/home_b.png",
    "assets/image/home_b.png",
    "assets/image/home_b.png",
  ];
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (HomeController controller) {
        return CarouselSlider(
          carouselController: carouselController,
          items: controller.bannerDataList
              .asMap()
              .map((index, value) => MapEntry(
                  index,
                  ClipRRect(
                    child: Container(
                        margin: EdgeInsets.only(right: 10),
                        height: double.infinity,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child:
                            Image.network(value.imagePath, fit: BoxFit.cover)),
                  )))
              .values
              .toList(),
          options: CarouselOptions(
            height: 170,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            },
            viewportFraction: 0.9,
            initialPage: 1,
            autoPlay: true,
            clipBehavior: Clip.none,
            enableInfiniteScroll: true,
          ),
        );
      },
    );
  }
}
