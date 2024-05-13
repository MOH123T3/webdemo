// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:myecommercewebapp/config/theme.dart';
import 'package:myecommercewebapp/features/home/models/home_product_model.dart';
import 'package:myecommercewebapp/features/home/ui/products_grid.dart';
import 'package:myecommercewebapp/screens/product_detail.dart';
import 'package:myecommercewebapp/widgets/responsive.dart';

class FeaturedTiles extends StatefulWidget {
  final Size screenSize;
  double height;
  ScrollController controller;
  final List<ProductDataModel> productDataList;

  FeaturedTiles(
      {Key? key,
      required this.screenSize,
      required this.controller,
      required this.height,
      required this.productDataList})
      : super(key: key);

  @override
  State<FeaturedTiles> createState() => _FeaturedTilesState();
}

class _FeaturedTilesState extends State<FeaturedTiles> {
  final List _isHovering = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    for (var i = 0; i < widget.productDataList.length; i++) {
      _isHovering.add(false);
    }
  }

  void animateToIndex(int index) {
    widget.controller.animateTo(
      index * widget.height,
      duration: Duration(seconds: 2),
      curve: Curves.fastOutSlowIn,
    );
  }

  double scrollPosition = 0;
  double opacity = 0;
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    opacity = scrollPosition < screenSize.height * 0.40
        ? scrollPosition / (screenSize.height * 0.40)
        : 1;
    return Padding(
      padding: EdgeInsets.only(
          left: widget.screenSize.width / 15,
          right: widget.screenSize.width / 15,
          bottom: 10),
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: ResponsiveWidget.isSmallScreen(context) ? 2 : 3,
            childAspectRatio: 2 / 1.6,
            mainAxisSpacing: ResponsiveWidget.isSmallScreen(context) ? 10 : 20,
            crossAxisSpacing: ResponsiveWidget.isSmallScreen(context) ? 10 : 20,
            mainAxisExtent: ResponsiveWidget.isSmallScreen(context)
                ? screenSize.width / 2.5
                : screenSize.width / 4),
        shrinkWrap: true,
        itemCount: widget.productDataList.length,
        itemBuilder: (context, index) {
          return InkWell(
            onHover: (value) {
              setState(() {
                value ? _isHovering[index] = true : _isHovering[index] = false;
              });
            },
            onTap: () {
              if (ResponsiveWidget.isSmallScreen(context)) {
                Navigator.push(context, MaterialPageRoute(builder: ((context) {
                  return ProductDetailScreen();
                })));
              } else {
                if (index == 0) {
                  animateToIndex(12);
                } else if (index == 1) {
                  animateToIndex(22);
                } else if (index == 2) {
                  animateToIndex(33);
                } else if (index == 3) {
                  animateToIndex(43);
                } else if (index == 4) {
                  animateToIndex(53);
                }
              }
            },
            child: Card(
              elevation: 5,
              child: ListView(
                physics: NeverScrollableScrollPhysics(),
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5),
                            topRight: Radius.circular(5)),
                        image: DecorationImage(
                            image: AssetImage(
                                widget.productDataList[index].imageUrl),
                            fit: BoxFit.cover),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: _isHovering[index] ? 10 : 0,
                              blurStyle: BlurStyle.solid),
                        ]),
                    height: widget.screenSize.width / 5.3,
                    width: ResponsiveWidget.isSmallScreen(context)
                        ? widget.screenSize.width / 2
                        : _isHovering[index]
                            ? widget.screenSize.width / 2
                            : widget.screenSize.width / 3,
                  ),
                  Container(
                    height: ResponsiveWidget.isSmallScreen(context)
                        ? screenSize.width / 5.3
                        : screenSize.width / 18,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: ResponsiveWidget.isSmallScreen(context)
                          ? AppColors.white
                          : AppColors.black,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(5),
                          bottomRight: Radius.circular(5)),
                    ),
                    width: ResponsiveWidget.isSmallScreen(context)
                        ? widget.screenSize.width / 2.5
                        : _isHovering[index]
                            ? widget.screenSize.width / 2
                            : widget.screenSize.width / 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 3),
                          child: Text(widget.productDataList[index].name,
                              style: TextStyle(
                                color: ResponsiveWidget.isSmallScreen(context)
                                    ? AppColors.black
                                    : AppColors.white,
                                fontSize:
                                    ResponsiveWidget.isSmallScreen(context)
                                        ? 12
                                        : 16,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                              )),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Divider(height: 2, thickness: 2),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Text(
                            widget.productDataList[index].description,
                            style: TextStyle(
                              color: ResponsiveWidget.isSmallScreen(context)
                                  ? Colors.blueGrey[900]
                                  : AppColors.white,
                              fontSize: ResponsiveWidget.isSmallScreen(context)
                                  ? 10
                                  : 15,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w400,
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ).animate().flipH(duration: 600.ms).then(delay: 200.ms),
            ),
          );
        },
      ),
    );
  }
}
