import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shpp/shared/hoverable_carousel_item.dart';
import 'package:shpp/shared/size_config.dart';

class CarouselWithWrapAround extends StatefulWidget {
  final List<String> images;

  const CarouselWithWrapAround({
    super.key,
    required this.images,
  });

  @override
  State<CarouselWithWrapAround> createState() => _CarouselWithWrapAroundState();
}

class _CarouselWithWrapAroundState extends State<CarouselWithWrapAround> {
  late List<Widget> items = List.generate(
    widget.images.length,
    (index) => HoverableCarouselItem(
      child: Container(
        height: SizeConfig.safeBlockVertical! * 4,
        width: SizeConfig.safeBlockHorizontal! * 5,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(widget.images[index]),
            fit: BoxFit.contain,
          ),
        ),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 2),
        enlargeCenterPage: true,
        scrollPhysics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        height: SizeConfig.safeBlockVertical! * 10,
        viewportFraction: 0.2,
        enableInfiniteScroll: true,
      ),
      items: items,
    );
  }
}
