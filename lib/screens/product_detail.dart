// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:myecommercewebapp/screens/product_image_detail.dart';
import 'package:myecommercewebapp/screens/top_bar_contents.dart';
import 'package:myecommercewebapp/widgets/bottom_bar.dart';
import 'package:myecommercewebapp/widgets/common_widget.dart';
import 'package:myecommercewebapp/widgets/responsive.dart';
import 'package:myecommercewebapp/widgets/star_rating.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  late ScrollController _HideBottomAppBarController;

  final double _scrollPosition = 0;
  double _opacity = 0;
  String productName = "Metal Swing Gate";
  String productDescription =
      "New Metal Swing Gate manufacturing | Old Metal Swing Gate Repairing";

  var _isVisible;

  @override
  initState() {
    super.initState();
    _isVisible = true;
    _HideBottomAppBarController = new ScrollController();
    _HideBottomAppBarController.addListener(() {
      if (_HideBottomAppBarController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        setState(() {
          _isVisible = false;
        });
      }
      if (_HideBottomAppBarController.position.userScrollDirection ==
          ScrollDirection.forward) {
        setState(() {
          _isVisible = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    _opacity = _scrollPosition < screenSize.height * 0.40
        ? _scrollPosition / (screenSize.height * 0.40)
        : 1;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 1000),
        child: TopBarContents(_opacity, false),
      ),
      body: Padding(
          padding: EdgeInsets.only(
            left: screenSize.width / 35,
          ),
          child: ResponsiveWidget.isSmallScreen(context)
              ? details(Row, screenSize)
              : details(Column, screenSize)),
      bottomNavigationBar: HiddenBottomBar(isVisible: _isVisible),
    );
  }

  cardView(icon, screenSize, title, description) {
    return Card(
      shadowColor: Colors.black,
      margin: EdgeInsets.all(5),
      elevation: 2,
      child: Container(
        height: 250,
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 100,
              shadows: [Shadow(blurRadius: 10)],
            ),
            SizedBox(
              height: 10,
            ),
            Cw.descriptionText(title),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                  width: screenSize.width / 5,
                  child: Cw.description(description)),
            ),
          ],
        ),
      ),
    );
  }

  details(Type row, screenSize) {
    return ListView(
      scrollDirection: ResponsiveWidget.isSmallScreen(context)
          ? Axis.horizontal
          : Axis.vertical,
      controller: _HideBottomAppBarController,
      children: [
        SizedBox(
          
          height: screenSize.height * 0.06,
        ),
        Cw.headingText(productName),
        SizedBox(
          height: 10,
        ),
        Cw.subHeadingText(productDescription),
        SizedBox(
          height: 40,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductImageDetail(),
            SizedBox(
              width: screenSize.width / 18,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                'assets/GardenPergola.jpg',
                height: 400,
                width: 400,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: screenSize.width / 18,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Cw.headingText('Overview'),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    child:
                        StarRating(onRatingChanged: () {}, color: Colors.black),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: screenSize.width / 2,
                    child: Cw.subHeadingText(
                        "We manufacture a wide range of Metal Entrance Gates, Swing Gates, Sliding Gates, Single Door and Scissors Gates that not only add elegance to the door, but also provide security. Made up of high quality Metal/Iron. These Metal Gates and Grills are known for their strength and sturdiness. Our range of Metal Gates is manufactured exactly as per the specifications of our clients', thereby ensuring complete client satisfaction. We do customization as per the client's requirement."),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Cw.descriptionText('Price :  '),
                      SizedBox(
                        width: screenSize.width / 3,
                        child: Cw.subHeadingText(
                            "Price will be shared as per measurement."),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Cw.descriptionText('Size  :  '),
                      SizedBox(child: Cw.subHeadingText("as per measurement")),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Divider(),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Cw.commonButton('GET PRICE QUOTE'),
                      SizedBox(
                        width: screenSize.width / 12,
                      ),
                      Cw.commonButton('CLICK TO CALL')
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 50,
        ),
        Cw.headingText("HOW IT WORK"),
        SizedBox(
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            cardView(
                Icons.design_services_outlined,
                screenSize,
                'SELECT THE SERVICES YOU NEED',
                'tell us what service you want Shutter work, welding work, steel work and other services'),
            cardView(
                Icons.contact_page_rounded,
                screenSize,
                'PROVIDE CONTACTABLE DETAILS',
                'share your contact details including correct email id and contactable mobile number'),
            cardView(Icons.man_2, screenSize, 'GET QUOTES AND HIRE THE BEST',
                'share your requirments, get the best price among industry, compare the price and hire us.'),
          ],
        ),
        SizedBox(
          height: 50,
        ),
        Cw.headingText("OTHER METAL WELDING SERVICES"),
        SizedBox(
          height: 10,
        ),
        Cw.subHeadingText(
            'Quality Work | Professional worker | Small and Big repairs | Charges after work |Get your design |Fixed on same day New Metal Products manufacturing | Old Metal Products Repairing'),
        SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 320,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 15,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Card(
                  shadowColor: Colors.black,
                  margin: EdgeInsets.all(5),
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/GardenPergola.jpg',
                          height: 250,
                          width: 200,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Cw.description('- Metal Design')
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(
          height: 50,
        ),
        Cw.headingText("Their Words, Our Pride"),
        SizedBox(
          height: 10,
        ),
        Cw.subHeadingText('Happy Words of our Happy Customers'),
        SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Card(
                  shape: ContinuousRectangleBorder(side: BorderSide()),
                  shadowColor: Colors.black,
                  margin: EdgeInsets.all(15),
                  elevation: 10,
                  child: Container(
                    width: 250,
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Container(
                                color: Colors.black,
                                height: 50,
                                width: 50,
                                child: Icon(
                                  Icons.person,
                                  color: Colors.white,
                                ),
                                // child: Image.asset(
                                //     'assets/GardenPergola.jpg',
                                //     fit: BoxFit.fill),
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Cw.descriptionText('Mohit Panchal'),
                                Cw.description('Businessman')
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Cw.description(
                            'Extremely happy with their service. Easy booking & professional quality welding- at very affordable rates! ')
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(
          height: 50,
        ),
      ],
    );
  }
}
