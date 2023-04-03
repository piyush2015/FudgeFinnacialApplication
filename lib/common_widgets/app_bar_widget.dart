import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:testdemo/const/app_color.dart';

import '../helper/space_widget.dart';

AppBar appBar({
  required BuildContext context,
  final String? title,
}) {
  return AppBar(
    elevation: 0,
    centerTitle: false,
    backgroundColor: AppColor.whiteColor,
    leading: InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Icon(
        Icons.arrow_back,
        color: AppColor.blackColor,
      ),
    ),
    title: Text(
      title!,
      style: TextStyle(fontWeight: FontWeight.bold, color: AppColor.blackColor),
    ),
    actions: [
      SvgPicture.asset('assets/icons/Icon material-menu.svg'),
      horizontalSpace(23),
    ],
  );
}
