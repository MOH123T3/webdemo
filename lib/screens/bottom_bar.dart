// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:myecommercewebapp/screens/bottom_bar_column.dart';
import 'package:myecommercewebapp/screens/info_text.dart';
import 'package:myecommercewebapp/widgets/responsive.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
      color: Colors.blueGrey[900],
      child: ResponsiveWidget.isSmallScreen(context)
          ? Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    BottomBarColumn(
                      heading: 'ABOUT',
                      s1: 'Contact Us',
                      s2: 'About Us',
                      s3: 'Careers',
                    ),
                    BottomBarColumn(
                      heading: 'HELP',
                      s1: 'Payment',
                      s2: 'Cancellation',
                      s3: 'FAQ',
                    ),
                    BottomBarColumn(
                      heading: 'SOCIAL',
                      s1: 'Twitter',
                      s2: 'Facebook',
                      s3: 'YouTube',
                    ),
                  ],
                ),
                Divider(
                  color: Colors.blueGrey,
                ),
                SizedBox(height: 20),
                InfoText(
                  type: 'Email',
                  text: '123456@gmail.com',
                ),
                SizedBox(height: 5),
                InfoText(
                  type: 'Address',
                  text: '123, Vandematram ,Gota, Ahmdabad',
                ),
                SizedBox(height: 20),
                Divider(
                  color: Colors.blueGrey,
                ),
                SizedBox(height: 20),
              ],
            )
          : Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    BottomBarColumn(
                      heading: 'ABOUT',
                      s1: 'Contact Us',
                      s2: 'About Us',
                      s3: 'Careers',
                    ),
                    BottomBarColumn(
                      heading: 'HELP',
                      s1: 'Payment',
                      s2: 'Cancellation',
                      s3: 'FAQ',
                    ),
                    BottomBarColumn(
                      heading: 'SOCIAL',
                      s1: 'Twitter',
                      s2: 'Facebook',
                      s3: 'YouTube',
                    ),
                    Container(
                      color: Colors.blueGrey,
                      width: 2,
                      height: 50,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InfoText(
                          type: 'Email',
                          text: '123456@gmail.com',
                        ),
                        SizedBox(height: 5),
                        InfoText(
                          type: 'Address',
                          text: '123,Vandematram ,Gota, Ahmdabad',
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
    );
  }
}
