// ignore_for_file: prefer_const_constructors, unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:myecommercewebapp/features/home/models/home_product_model.dart';
import 'package:myecommercewebapp/features/home/ui/flotiong_quick_bar.dart';
import 'package:myecommercewebapp/features/home/ui/feacher_heading.dart';
import 'package:myecommercewebapp/features/home/ui/product_heading_details.dart';
import 'package:myecommercewebapp/features/home/ui/product_slider.dart';
import 'package:myecommercewebapp/screens/bottom_bar.dart';
import 'package:myecommercewebapp/widgets/responsive.dart';

import 'feacher_tiles.dart';
import 'metal_services.dart';

class ProductDetails extends StatefulWidget {
  final List<ProductDataModel> productDataList;
  const ProductDetails({super.key, required this.productDataList});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  double scrollPosition = 0;
  final ScrollController _controller = ScrollController();
  double opacity = 0;
  final double height = 100.0;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    opacity = scrollPosition < screenSize.height * 0.40
        ? scrollPosition / (screenSize.height * 0.40)
        : 1;

    return ListView(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      controller: _controller,
      children: [
        Stack(
          children: [
            SizedBox(
              height: screenSize.height * 0.45,
              width: screenSize.width,
              child: Image.asset(
                'assets/cover.jpg',
                fit: BoxFit.cover,
              )
                  .animate(
                      onPlay: (controller) => controller.repeat(reverse: true))
                  .swap(
                      builder: (_, __) => Image.asset(
                            'assets/welding.jpg',
                            fit: BoxFit.cover,
                          )),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                FloatingQuickAccessBar(screenSize: screenSize),
                Column(
                  children: [
                    FeaturedHeading(
                      screenSize: screenSize,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    FeaturedTiles(
                      screenSize: screenSize,
                      controller: _controller,
                      height: height,
                      productDataList: widget.productDataList,
                    )
                  ],
                ),
              ],
            )
          ],
        ),
        ResponsiveWidget.isLargeScreen(context) ? MetalServices() : Center(),
        ProductDetailsHeading(screenSize: screenSize),
        ResponsiveWidget.isLargeScreen(context)
            ? ProductSlider(
                productDataList: widget.productDataList,
              )
            : Center(),
        ResponsiveWidget.isLargeScreen(context)
            ? SizedBox(height: screenSize.height / 10)
            : Center(),
        ResponsiveWidget.isLargeScreen(context) ? BottomBar() : Center(),
      ],
    );
  }
}
