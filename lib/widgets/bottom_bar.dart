// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:myecommercewebapp/widgets/common_widget.dart';

class HiddenBottomBar extends StatefulWidget {
  var isVisible;

  HiddenBottomBar({Key? key, required this.isVisible}) : super(key: key);

  @override
  HiddenBottomBarState createState() => new HiddenBottomBarState();
}

class HiddenBottomBarState extends State<HiddenBottomBar> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 50),
      height: widget.isVisible ? 70 : 0.0,
      child: widget.isVisible
          ? AnimatedContainer(
              duration: Duration(milliseconds: 50),
              height: widget.isVisible ? 70 : 0.0,
              child: widget.isVisible
                  ? Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.blueGrey[900],
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5),
                              topRight: Radius.circular(5))),
                      width: MediaQuery.of(context).size.width,
                      child: ListView(
                        padding: const EdgeInsets.all(20),
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        children: [
                          Center(
                            child: Cw.description(
                                'Terms & Conditions | Privacy Policy |Disclaimer'),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              socialNetworks(Icons.wechat_outlined),
                              socialNetworks(Icons.facebook),
                              socialNetworks(
                                  Icons.youtube_searched_for_outlined),
                              socialNetworks(Icons.chat_rounded),
                              socialNetworks(Icons.link_outlined),
                            ],
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Center(
                              child: Cw.whiteText(
                                  '2024 Copyright: weldingwala.com'))
                        ],
                      ),
                    )
                  : Container(
                      color: Colors.white,
                      width: MediaQuery.of(context).size.width,
                    ),
            )
          : Container(
              color: Colors.transparent,
              width: MediaQuery.of(context).size.width,
            ),
    );
  }

  socialNetworks(icon) {
    return Padding(
      padding: EdgeInsets.only(left: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Container(
          color: Colors.black,
          height: 30,
          width: 50,
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
