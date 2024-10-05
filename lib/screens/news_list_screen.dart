import 'package:finance_digest/utils/app_colors.dart';
import 'package:finance_digest/widgets/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class NewsListScreen extends StatefulWidget {
  const NewsListScreen({super.key});

  @override
  State<NewsListScreen> createState() => _NewsListScreenState();
}

class _NewsListScreenState extends State<NewsListScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: AppColors.APP_HOME_BACKGROUND_COLOUR,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * .02),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppWidgets.titleText(size, "Hey First Name", 32, FontWeight.w600,
                AppColors.APP_WHITE_COLOUR,
                fontFamily: "Raleway"),
            Gap(size.height * .02),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return _buildNewsContainer(size, index);
                },
                itemCount: 10,
              ),
            ),
          ],
        ),
      )),
    );
  }

  Widget _buildNewsContainer(
    Size size,
    int index,
  ) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: size.height * 0.01),
      height: size.height * 0.18,
      color: Colors.transparent,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: size.width * 0.03),
            height: size.height * 0.15,
            width: size.width * 0.28,
            color: Colors.green,
            child: Image.network("https://media.istockphoto.com/id/183412466/photo/eastern-bluebirds-male-and-female.jpg?s=612x612&w=0&k=20&c=6_EQHnGedwdjM9QTUF2c1ce7cC3XtlxvMPpU5HAouhc=",fit: BoxFit.fill,),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: size.width * 0.01),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppWidgets.titleText(size, "The Economic Times", 12,
                          FontWeight.w200, AppColors.APP_WHITE_COLOUR,
                          fontFamily: "Rubik"),
                      AppWidgets.titleText(size, "12 June 2021", 12,
                          FontWeight.w200, AppColors.APP_WHITE_COLOUR,
                          fontFamily: "Rubik")
                    ],
                  ),
                ),
                AppWidgets.titleText(size, "Sensex ekes out small gain, Nifty50 ends flat; 2 Adani stocks rally up to 9% ", 20,
                    FontWeight.w500, AppColors.APP_WHITE_COLOUR,)
              ],
            ),
          )
        ],
      ),
    );
  }
}
