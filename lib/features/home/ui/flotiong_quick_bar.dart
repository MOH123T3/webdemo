// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:myecommercewebapp/config/theme.dart';
import 'package:myecommercewebapp/widgets/responsive.dart';

import '../../../widgets/search_bar.dart';

class FloatingQuickAccessBar extends StatefulWidget {
  const FloatingQuickAccessBar({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  _FloatingQuickAccessBarState createState() => _FloatingQuickAccessBarState();
}

class _FloatingQuickAccessBarState extends State<FloatingQuickAccessBar> {
  final List _isHovering = [false, false, false, false];
  List<Widget> rowElements = [];

  List<String> items = [
    'Search',
    'No Visiting Charge',
    '24/7 Services',
    'High Quality Work'
  ];
  List<IconData> icons = [
    Icons.search,
    Icons.location_on,
    Icons.date_range,
    Icons.people,
    Icons.wb_sunny
  ];

  List<Widget> generateRowElements() {
    rowElements.clear();
    for (int i = 0; i < items.length; i++) {
      Widget elementTile = InkWell(
        onHover: (value) {
          setState(() {
            value ? _isHovering[i] = true : _isHovering[i] = false;
          });
        },
        onTap: () {
          if (i == 0) {
            showSearch(
                useRootNavigator: false,
                context: context,
                delegate: CustomSearchDelegate());
          }
        },
        child: Text(
          items[i],
          style: TextStyle(
            color: _isHovering[i] ? AppColors.green : AppColors.black,
          ),
        ),
      );
      Widget spacer = SizedBox(
        height: widget.screenSize.height / 20,
        child: VerticalDivider(
          width: 1,
          color: Colors.blueGrey[100],
          thickness: 1,
        ),
      );
      rowElements.add(elementTile);
      if (i < items.length - 1) {
        rowElements.add(spacer);
      }
    }

    return rowElements;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      heightFactor: 1,
      child: Padding(
          padding: EdgeInsets.only(
            top: widget.screenSize.height * 0.32,
            left: ResponsiveWidget.isSmallScreen(context)
                ? widget.screenSize.width / 12
                : widget.screenSize.width / 5,
            right: ResponsiveWidget.isSmallScreen(context)
                ? widget.screenSize.width / 12
                : widget.screenSize.width / 5,
          ),
          child: ResponsiveWidget.isSmallScreen(context)
              ? Column(
                  children: [
                    ...Iterable<int>.generate(items.length).map(
                      (int pageIndex) => Padding(
                        padding:
                            EdgeInsets.only(top: widget.screenSize.height / 80),
                        child: Card(
                          shadowColor: AppColors.white,
                          child: Container(
                            height: 40,
                            padding: EdgeInsets.only(
                                top: widget.screenSize.height / 60,
                                bottom: widget.screenSize.height / 60,
                                left: widget.screenSize.width / 20),
                            child: Row(
                              children: [
                                Icon(
                                  icons[pageIndex],
                                  color: Colors.black,
                                ),
                                SizedBox(width: widget.screenSize.width / 20),
                                InkWell(
                                  splashColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  onTap: () {},
                                  child: Text(
                                    items[pageIndex],
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 14),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              : Card(
                  elevation: 5,
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: widget.screenSize.height / 50,
                      bottom: widget.screenSize.height / 50,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: generateRowElements(),
                    ),
                  ),
                ).animate().scale(delay: 200.ms, duration: 400.ms)),
    );
  }
}
