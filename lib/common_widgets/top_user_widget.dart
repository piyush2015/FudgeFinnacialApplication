import 'package:flutter/material.dart';
import 'package:testdemo/const/app_color.dart';
import 'package:testdemo/const/app_images.dart';
import 'package:testdemo/get_user_model.dart';
import 'package:testdemo/helper/space_widget.dart';

class TopUserWidget extends StatelessWidget {
  const TopUserWidget({
    Key? key,
    required this.getUserList,
    required this.width,
    required this.height,
    required this.isLoading,
  }) : super(key: key);

  final List<UserModel> getUserList;
  final double width;
  final double height;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        itemCount: isLoading ? 8 : getUserList.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          if (isLoading) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.01),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                      width: height * 0.06,
                      height: height * 0.06,
                      color: Colors.grey[300],
                    ),
                  ),
                  verticalSpace(height * 0.012),
                  Container(
                    width: width * 0.2,
                    height: 20,
                    color: Colors.grey[200],
                  ),
                ],
              ),
            );
          }
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.01),
            child: Column(
              children: [
                Image.asset(
                  AppImages.userImg,
                  height: height * 0.06,
                ),
                verticalSpace(height * 0.012),
                SizedBox(
                  width: width * 0.2,
                  child: Text(
                    getUserList[index].name ?? '',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline3!.copyWith(
                          color: AppColor.blackColor,
                        ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
