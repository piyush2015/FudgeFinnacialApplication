import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:testdemo/helper/space_widget.dart';
import 'package:testdemo/widgets/recent_transactioninfo_widget.dart';

class TransactionListWidget extends StatelessWidget {
  const TransactionListWidget({
    Key? key,
    required this.width,
    required this.height,
    required this.trailingTransactionStatusIcon,
    required this.trailingTransactionStatusIconColor,
  }) : super(key: key);

  final double width;
  final double height;
  final String trailingTransactionStatusIcon;
  final Color trailingTransactionStatusIconColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.04),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/user_profile.png',
            height: height * 0.05,
          ),
          horizontalSpace(width * 0.03),
          RecentTransactionInfoWidget(
            height: height,
            alignment: CrossAxisAlignment.start,
            title: 'John Doe',
            value: 'United Kingdom',
          ),
          const Spacer(),
          RecentTransactionInfoWidget(
            height: height,
            alignment: CrossAxisAlignment.end,
            title: '80,000 AED',
            value: '11 Aug 2021',
          ),
          horizontalSpace(width * 0.03),
          SvgPicture.asset(
            trailingTransactionStatusIcon,
            color: trailingTransactionStatusIconColor,
          ),
        ],
      ),
    );
  }
}
