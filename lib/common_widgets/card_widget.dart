// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:testdemo/const/app_images.dart';
import 'package:testdemo/const/app_str.dart';
import 'package:testdemo/helper/space_widget.dart';
import 'package:testdemo/pages/my_save_card.dart';

class CardWidget extends StatelessWidget {
  List<Color> cardColor;
  final double height, width;
  CardWidget({
    Key? key,
    required this.cardColor,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: width * 0.05),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: cardColor,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.045),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    AppImages.chipImg,
                    height: height * 0.05,
                  ),
                  Image.asset(
                    AppImages.visaImg,
                    height: height * 0.09,
                  ),
                ],
              ),
            ),
            verticalSpace(height * 0.01),
            Text(
              AppStr.cardNumber.spaceSeparateNumber(),
              style: TextStyle(fontSize: width * 0.059, color: Colors.white),
            ),
            verticalSpace(height * 0.03),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.075),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppStr.card.toUpperCase(),
                        style: TextStyle(
                          fontSize: width * 0.02,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        AppStr.expires.toUpperCase(),
                        style: TextStyle(
                          fontSize: width * 0.02,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  verticalSpace(height * 0.008),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppStr.cardName.toUpperCase(),
                        style: TextStyle(
                          fontSize: width * 0.035,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        AppStr.cardExpireDate.toUpperCase(),
                        style: TextStyle(
                          fontSize: width * 0.035,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
