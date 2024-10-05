import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../utils/app_colors.dart';
import '../widgets/app_widgets.dart';

class ErrorScreen extends StatefulWidget {
  const ErrorScreen({super.key});

  @override
  State<ErrorScreen> createState() => _ErrorScreenState();
}

class _ErrorScreenState extends State<ErrorScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);

    return Scaffold(
      body: SafeArea(child: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * .02),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppWidgets.titleText(size, "Hey First Name", 32, FontWeight.w600,
                AppColors.APP_WHITE_COLOUR,
                fontFamily: "Raleway"),
            Gap(size.height * .04),
            AppWidgets.titleText(size, "Something went wrong. Please try again later.", 16, FontWeight.w500,
                AppColors.APP_WHITE_COLOUR,
                fontFamily: "Rubik"),
          ],
        ),
      ),),
    );
  }
}
