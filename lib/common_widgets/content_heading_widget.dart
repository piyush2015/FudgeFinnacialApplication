// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:testdemo/const/app_color.dart';

class ContentHeadingWidget extends StatelessWidget {
  final String title, buttonName;
  final bool isShowButton;
  final Function() onTap;
  ContentHeadingWidget({
    Key? key,
    required this.title,
    required this.buttonName,
    required this.onTap,
    required this.isShowButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: AppColor.blackColor,
          ),
        ),
        Spacer(),
        isShowButton == true
            ? Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(184, 185, 216, 1),
                  borderRadius: BorderRadius.circular(5),
                ),
                height: 25,
                child: InkWell(
                  onTap: () {
                    onTap();
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Center(
                      child: Text(
                        buttonName,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: AppColor.whiteColor,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            : Container()
      ],
    );
  }
}
