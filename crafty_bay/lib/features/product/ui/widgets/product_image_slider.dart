import 'package:carousel_slider/carousel_slider.dart';
import 'package:crafty_bay/app/app_colors.dart';
import 'package:flutter/material.dart';

class ProductImageSlider extends StatefulWidget {
  const ProductImageSlider({super.key});

  @override
  State<ProductImageSlider> createState() => _ProductImageSliderState();
}

class _ProductImageSliderState extends State<ProductImageSlider> {
  final ValueNotifier<int> _currentSlider = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 240,
            viewportFraction: 1,
            onPageChanged: (int currentIndex, _) {
              _currentSlider.value = currentIndex;
            },
          ),
          items:
              [1, 2, 3, 4, 5].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                      ),
                      alignment: Alignment.center,
                      child: Text('Image $i', style: TextStyle(fontSize: 16.0)),
                    );
                  },
                );
              }).toList(),
        ),
        Positioned(
          bottom: 8,
          left: 0,
          right: 0,
          child: ValueListenableBuilder(
            valueListenable: _currentSlider,
            builder: (context, index, _) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < 5; i++)
                    Container(
                      width: 12,
                      height: 12,
                      margin: EdgeInsets.only(left: 3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: index == i ? AppColors.themeColor : Colors.white,
                      ),
                    ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
