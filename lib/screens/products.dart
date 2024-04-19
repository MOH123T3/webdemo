// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:myecommercewebapp/screens/top_bar_contents.dart';
import 'package:myecommercewebapp/widgets/responsive.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  double _scrollPosition = 0;
  double _opacity = 0;
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
    _opacity = _scrollPosition < screenSize.height * 0.40
        ? _scrollPosition / (screenSize.height * 0.40)
        : 1;
    return Scaffold(
        appBar: ResponsiveWidget.isSmallScreen(context)
            ? AppBar()
            : PreferredSize(
                preferredSize: Size(screenSize.width, 1000),
                child: TopBarContents(_opacity, true),
              ),
        body: ResponsiveWidget.isSmallScreen(context)
            ? SizedBox(
                child: Text('hy rangat ji maharaj '),
              )
            : Padding(
                padding: EdgeInsets.only(
                  top: screenSize.height * 0.06,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: screenSize.width / 35),
                      child: Text(
                        'Items',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w400,
                          letterSpacing: 3,
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Expanded(
                      child: ListView(
                        padding: EdgeInsets.only(
                          left: screenSize.width / 25,
                          right: screenSize.width / 25,
                        ),
                        children: [
                          GridView.builder(
                              shrinkWrap: true,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount:
                                          ResponsiveWidget.isSmallScreen(
                                                  context)
                                              ? 2
                                              : ResponsiveWidget.isMediumScreen(
                                                      context)
                                                  ? 3
                                                  : 4,
                                      mainAxisSpacing: screenSize.height / 30,
                                      crossAxisSpacing: screenSize.width / 30,
                                      mainAxisExtent:
                                          ResponsiveWidget.isMediumScreen(
                                                  context)
                                              ? screenSize.width / 4.2
                                              : screenSize.width / 4.5),
                              itemCount: assets.length,
                              itemBuilder: (context, index) {
                                return Card(
                                  elevation: 5,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      left: screenSize.height / 70,
                                      right: screenSize.height / 70,
                                    ),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                            height: screenSize.width / 7.5,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                              child: Image.asset(
                                                assets[index],
                                                fit: BoxFit.cover,
                                              ),
                                            )),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('Name',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15,
                                                  fontFamily: 'Montserrat',
                                                  fontWeight: FontWeight.w400,
                                                  letterSpacing: 3,
                                                )),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              'Details About The Product',
                                              style: TextStyle(
                                                color: Colors.blueGrey[900],
                                                fontSize: 12,
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.w400,
                                                letterSpacing: 3,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Price 1999",
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 15,
                                                    fontFamily: 'Montserrat',
                                                    fontWeight: FontWeight.w400,
                                                    letterSpacing: 3,
                                                  ),
                                                  textAlign: TextAlign.right,
                                                ),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                Icon(
                                                  Icons.favorite,
                                                  size: 20,
                                                  color: Colors.red,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Icon(
                                                  Icons
                                                      .add_shopping_cart_rounded,
                                                  size: 20,
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        ],
                      ),
                    ),
                  ],
                ),
              ));
  }
}
