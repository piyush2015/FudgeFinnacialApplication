// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:testdemo/bloc/home_page_bloc.dart';
import 'package:testdemo/common_widgets/content_heading_widget.dart';
import 'package:testdemo/common_widgets/financial_goal_indicator.dart';
import 'package:testdemo/common_widgets/label_value_widget.dart';
import 'package:testdemo/common_widgets/performance_chart_widget.dart';
import 'package:testdemo/common_widgets/top_user_widget.dart';
import 'package:testdemo/common_widgets/transaction_list_widget.dart';
import 'package:testdemo/const/app_color.dart';
import 'package:testdemo/const/app_images.dart';
import 'package:testdemo/const/app_str.dart';
import 'package:testdemo/helper/space_widget.dart';
import 'package:testdemo/pages/my_save_card.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final HomeScreenBloc _bloc = HomeScreenBloc();
  
  void _screenState(BuildContext context, HomeScreenState state) {}

  @override
  void initState() {
    super.initState();
    _bloc.add(LoadUserEvent());
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocListener(
      listener: _screenState,
      bloc: _bloc,
      child: SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          body: ListView(
            padding: EdgeInsets.only(top: 0),
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  color: AppColor.darkBlueColor,
                ),
                child: SafeArea(
                  bottom: false,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            RichText(
                              text: TextSpan(
                                text: 'Hola, ',
                                style: TextStyle(
                                  fontSize: height * 0.03,
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.whiteColor,
                                ),
                                children: [
                                  TextSpan(
                                    text: 'Michael',
                                    style: TextStyle(
                                      fontSize: height * 0.03,
                                      fontWeight: FontWeight.normal,
                                      color: AppColor.whiteColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Spacer(),
                            SvgPicture.asset(
                              AppImages.bellIcon,
                              color: AppColor.whiteColor,
                              width: height * 0.02,
                              height: width * 0.04,
                            ),
                            horizontalSpace(22),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.asset(
                                AppImages.placeHolder,
                                width: height * 0.02,
                                height: width * 0.04,
                              ),
                            )
                          ],
                        ),
                        verticalSpace(4),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            AppStr.description,
                            style: Theme.of(context)
                                .textTheme
                                .headline2
                                ?.copyWith(fontSize: height * 0.015),
                          ),
                        ),
                        verticalSpace(height * 0.04),
                        Text(
                          "\$56,271.68",
                          style:
                              Theme.of(context).textTheme.headline1!.copyWith(
                                    fontSize: height * 0.05,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        verticalSpace(8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "+\$${"9,736"}",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2!
                                  .copyWith(fontSize: height * 0.02),
                            ),
                            horizontalSpace(width * 0.04),
                            SvgPicture.asset(
                              AppImages.arrowUpIcon,
                              color: AppColor.greenColor,
                            ),
                            horizontalSpace(width * 0.006),
                            Text(
                              "2.3%",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2!
                                  .copyWith(
                                    fontSize: height * 0.02,
                                    color: AppColor.greenColor,
                                  ),
                            ),
                          ],
                        ),
                        verticalSpace(height * 0.01),
                        Text(
                          AppStr.accountBlnce,
                          style:
                              Theme.of(context).textTheme.headline2!.copyWith(
                                    fontSize: height * 0.015,
                                    color: AppColor.grayColor,
                                  ),
                        ),
                        verticalSpace(height * 0.04),
                        IntrinsicHeight(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: LabelValueWidget(
                                  value: '12',
                                  label: AppStr.following,
                                ),
                              ),
                              verticalDivider(color: AppColor.whiteColor),
                              Expanded(
                                child: LabelValueWidget(
                                  value: '36',
                                  label: AppStr.transection,
                                ),
                              ),
                              verticalDivider(color: AppColor.whiteColor),
                              Expanded(
                                child: LabelValueWidget(
                                  value: '4',
                                  label: AppStr.bill,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              verticalSpace(height * 0.025),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                child: ContentHeadingWidget(
                  title: AppStr.performanceChart.toUpperCase(),
                  buttonName: AppStr.more,
                  onTap: () {},
                  isShowButton: true,
                ),
              ),
              verticalSpace(height * 0.025),
              PerformanceChartWidget(),
              verticalSpace(height * 0.029),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                child: ContentHeadingWidget(
                  title: AppStr.topUsrCmmunity,
                  buttonName: AppStr.more,
                  onTap: () {},
                  isShowButton: false,
                ),
              ),
              verticalSpace(height * 0.025),
              BlocBuilder(
                bloc: _bloc,
                builder: (BuildContext context, HomeScreenState state) {
                  if (state is UserErroState) {
                    return Center(child: Text('User not available'));
                  } else {
                    return TopUserWidget(
                      getUserList: _bloc.userList,
                      width: width,
                      height: height,
                      isLoading:
                          (state is UserLoadingState) ? state.isLoading : false,
                    );
                  }
                },
              ),
              verticalSpace(height * 0.029),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                child: ContentHeadingWidget(
                  title: AppStr.recentTransection.toUpperCase(),
                  buttonName: AppStr.more,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MySaveCardScreen(),
                      ),
                    );
                  },
                  isShowButton: true,
                ),
              ),
              verticalSpace(height * 0.025),
              SizedBox(
                height: height * 0.25,
                child: ListView.separated(
                  padding: EdgeInsets.all(0),
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 4,
                  itemBuilder: ((context, index) {
                    return TransactionListWidget(
                      width: width,
                      height: height,
                      trailingTransactionStatusIcon: index == 0
                          ? 'assets/icons/in-progress.svg'
                          : 'assets/icons/check-circle-fill.svg',
                      trailingTransactionStatusIconColor: index == 0
                          ? AppColor.inProgressIndicator
                          : AppColor.checkColor,
                    );
                  }),
                  separatorBuilder: (context, index) {
                    return SizedBox(height: height * 0.015);
                  },
                ),
              ),
              verticalSpace(height * 0.029),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                child: ContentHeadingWidget(
                  title: AppStr.financialGoals.toUpperCase(),
                  buttonName: AppStr.more,
                  onTap: () {},
                  isShowButton: false,
                ),
              ),
              verticalSpace(height * 0.025),
              FinancialGoalIndicatorWidget(
                width: width,
                height: height,
                progressBarColor: AppColor.progressBlueColor,
                progressPercentage: 35,
              ),
              verticalSpace(height * 0.03),
              FinancialGoalIndicatorWidget(
                width: width,
                height: height,
                progressBarColor: AppColor.progressRedColor,
                progressPercentage: 80,
              ),
              verticalSpace(height * 0.03),
              FinancialGoalIndicatorWidget(
                width: width,
                height: height,
                progressBarColor: AppColor.progressSkyColor,
                progressPercentage: 68,
              ),
              verticalSpace(height * 0.03)
            ],
          ),
        ),
      ),
    );
  }
}
