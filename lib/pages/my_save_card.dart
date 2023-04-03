// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:testdemo/common_widgets/app_bar_widget.dart';
import 'package:testdemo/common_widgets/card_widget.dart';
import 'package:testdemo/common_widgets/indicator_widget.dart';
import 'package:testdemo/common_widgets/tab_widget.dart';
import 'package:testdemo/helper/space_widget.dart';

extension StringNumberExtension on String {
  String spaceSeparateNumber() {
    final result = replaceAllMapped(
        RegExp(r'(\d{1,4})(?=(\d{4})+(?!\d))'), (Match m) => '${m[1]}   ');
    return result;
  }
}

class MySaveCardScreen extends StatefulWidget {
  const MySaveCardScreen({super.key});

  @override
  State<MySaveCardScreen> createState() => _MySaveCardScreenState();
}

class _MySaveCardScreenState extends State<MySaveCardScreen>
    with SingleTickerProviderStateMixin {
  int isIndex = 0;
  PageController pageController =
      PageController(viewportFraction: 0.88, keepPage: true);
  TabController? tabController;
  @override
  void initState() {
    tabController = TabController(length: 6, vsync: this, initialIndex: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: appBar(title: 'My saved cards', context: context),
        body: SafeArea(
          top: false,
          child: Column(
            children: [
              SizedBox(
                height: width * 0.49,
                child: PageView.builder(
                  controller: pageController,
                  itemCount: 2,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: ((value) {
                    setState(() {
                      isIndex = value;
                    });
                  }),
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return CardWidget(
                        cardColor: [
                          Color(0xFF121B34),
                          Color(0xFF1E2045),
                          Color(0xFF412E76),
                        ],
                        height: height,
                        width: width,
                      );
                    }
                    return CardWidget(
                      cardColor: [
                        Color(0xFF3B5A00),
                        Color(0xFF385300),
                        Color(0xFF2B3600),
                      ],
                      height: height,
                      width: width,
                    );
                  },
                ),
              ),
              verticalSpace(height * 0.04),
              PageIndicator(
                pagerIndex: isIndex,
                totalPages: 2,
              ),
              verticalSpace(height * 0.04),
              TabBar(
                isScrollable: true,
                indicatorColor: Color(0xFF707070),
                indicatorSize: TabBarIndicatorSize.label,
                indicatorWeight: 3,
                unselectedLabelColor: Color(0xFF9F9F9F),
                labelPadding: EdgeInsets.only(
                    bottom: width * 0.02,
                    left: width * 0.06,
                    right: width * 0.06),
                labelColor: Color(0xFF000000),
                labelStyle: TextStyle(
                  fontSize: width * 0.03,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
                tabs: [
                  Text("Menu title 1"),
                  Text("Menu title 2"),
                  Text("Menu title 3"),
                  Text("Menu title 4"),
                  Text("Menu title 5"),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: width * 0.06),
                child: Container(
                  height: 0.5,
                  width: double.infinity,
                  color: Colors.grey,
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    TabWidget(width: width, height: height),
                    TabWidget(width: width, height: height),
                    TabWidget(width: width, height: height),
                    TabWidget(width: width, height: height),
                    TabWidget(width: width, height: height),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
