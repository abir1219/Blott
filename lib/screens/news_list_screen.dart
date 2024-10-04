import 'package:finance_digest/utils/app_colors.dart';
import 'package:finance_digest/widgets/app_widgets.dart';
import 'package:flutter/material.dart';

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
      body: SafeArea(child: Column(
        children: [
          AppWidgets.titleText(size, "Hey", 32, FontWeight.w400, AppColors.APP_WHITE_COLOUR)
        ],
      )),
    );
  }
}
