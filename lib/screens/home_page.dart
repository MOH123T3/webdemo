// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:myecommercewebapp/screens/bottom_bar.dart';
import 'package:myecommercewebapp/screens/metal_services.dart';
import 'package:myecommercewebapp/screens/weld_heading.dart';
import 'package:myecommercewebapp/screens/explore_drawer.dart';
import 'package:myecommercewebapp/screens/feacher_heading.dart';
import 'package:myecommercewebapp/screens/feacher_tiles.dart';
import 'package:myecommercewebapp/screens/flotiong_quick_bar.dart';
import 'package:myecommercewebapp/screens/top_bar_contents.dart';
import 'package:myecommercewebapp/widgets/responsive.dart';
import 'weld_slider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _scrollPosition = 0;
  final ScrollController _controller = ScrollController();
  double _opacity = 0;
  final double _height = 100.0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    _opacity = _scrollPosition < screenSize.height * 0.40
        ? _scrollPosition / (screenSize.height * 0.40)
        : 1;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: ResponsiveWidget.isSmallScreen(context)
          ? AppBar(
              backgroundColor: Colors.blueGrey.shade900.withOpacity(_opacity),
              elevation: 0,
              title: Text(
                'WELDING WORKS',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400,
                  letterSpacing: 3,
                ),
              ))
          : PreferredSize(
              preferredSize: Size(screenSize.width, 1000),
              child: TopBarContents(_opacity, false),
            ),
      drawer: ExploreDrawer(),
      body: ListView(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
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
                        onPlay: (controller) =>
                            controller.repeat(reverse: true))
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
                        height: _height,
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
          MetalServices(),
          WeldingDetailsHeading(screenSize: screenSize),
          WeldingSlider(),
          SizedBox(height: screenSize.height / 10),
          BottomBar(),
        ],
      ),
    );
  }
}
