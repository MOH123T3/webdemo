import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../widgets/common_widget.dart';

class MetalServices extends StatefulWidget {
  const MetalServices({super.key});

  @override
  State<MetalServices> createState() => _MetalServicesState();
}

class _MetalServicesState extends State<MetalServices> {
  final List<String> assets = [
    'assets/GardenPergola.jpg',
    'assets/furniture.jpg',
    'assets/AluminiumWorks.jpg',
    'assets/Shutter.jpg',
    'assets/sheds.jpg',
  ];

  final List<String> title = [
    'Garden Pergola',
    'Metal/Sheet Furniture',
    'Aluminium Works',
    'Shutter',
    'Sheds',
  ];
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return SizedBox(
      height: screenSize.width * 3.8,
      child: ListView.builder(
        itemCount: assets.length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                ImageFiltered(
                    imageFilter: ImageFilter.blur(
                        sigmaX: 2, sigmaY: 2, tileMode: TileMode.repeated),
                    child: Image.asset(
                      assets[index],
                      fit: BoxFit.cover,
                    )),
                Positioned(
                    left: 10, top: 39, child: Cw.headingText(title[index]))
              ],
            ),
          );
        },
      ),
    );
  }
}
