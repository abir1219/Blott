import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:finance_digest/router/app_pages.dart';
import 'package:finance_digest/utils/app_colors.dart';
import 'package:finance_digest/utils/app_constants.dart';
import 'package:finance_digest/utils/enums.dart';
import 'package:finance_digest/utils/sharedpreference_utils.dart';
import 'package:finance_digest/widgets/app_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../bloc/news/news_bloc.dart';

class NewsListScreen extends StatefulWidget {
  const NewsListScreen({super.key});

  @override
  State<NewsListScreen> createState() => _NewsListScreenState();
}

class _NewsListScreenState extends State<NewsListScreen> {
  @override
  void initState() {
    super.initState();
    context.read<NewsBloc>().add(FetchNewsEvent());
  }

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
            AppWidgets.titleText(
                size,
                "Hey ${SharedPreferencesUtils.getString(AppConstants.FIRST_NAME)}",
                24,
                FontWeight.w600,
                AppColors.APP_WHITE_COLOUR,
                fontFamily: "Raleway"),
            Gap(size.height * .02),
            Expanded(
              child: BlocConsumer<NewsBloc, NewsState>(
                listenWhen: (previous, current) =>
                    current.apiStatus == ApiStatus.error,
                listener: (context, state) {
                  if (state.apiStatus == ApiStatus.error) {
                    context.go(AppPages.ERROR);
                  }
                },
                builder: (context, state) {
                  switch (state.apiStatus) {
                    case ApiStatus.loading:
                      return Center(
                        child: SizedBox(
                          height: size.height * 0.03,
                          width: size.width * 0.06,
                          child: Platform.isAndroid
                              ? const CircularProgressIndicator(
                                  color: AppColors.APP_WHITE_COLOUR,
                                )
                              : const CupertinoActivityIndicator(),
                        ),
                      );
                    case ApiStatus.success:
                      return ListView.builder(
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return _buildNewsContainer(size, index, state);
                        },
                        itemCount: state.newsList!.length,
                      );
                    default:
                      return const SizedBox();
                  }
                },
              ),
            ),
          ],
        ),
      )),
    );
  }

  Widget _buildNewsContainer(Size size, int index, NewsState state) {
    final newsItem = state.newsList![index];

    return Container(
      margin: EdgeInsets.symmetric(vertical: size.height * 0.01),
      height: size.height * 0.2,
      color: Colors.transparent,
      child: Row(
        children: [
          // Image container
          Container(
            margin: EdgeInsets.symmetric(horizontal: size.width * 0.03),
            height: size.height * 0.15,
            width: size.width * 0.28,
            child: CachedNetworkImage(
                imageUrl: newsItem.image!,
                fit: BoxFit.fill,
                progressIndicatorBuilder: (_, url, download) {
                  return Image.asset(
                    "assets/images/loader.gif",
                  );
                } // Handle errors
                ),
          ),

          // Text content container
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                // Align text to the start
                children: [
                  // Title and datetime row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Headline text
                      AppWidgets.titleText(
                        size,
                        newsItem.source!,
                        12,
                        FontWeight.w200,
                        AppColors.APP_WHITE_COLOUR,
                        fontFamily: "Rubik",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),

                      // Datetime text
                      AppWidgets.titleText(
                        size,
                        DateFormat('d MMMM yyyy').format(DateTime.fromMillisecondsSinceEpoch(newsItem.datetime! * 1000)),
                        12,
                        FontWeight.w200,
                        AppColors.APP_WHITE_COLOUR,
                        fontFamily: "Rubik",
                      ),
                    ],
                  ),

                  // Summary text
                  AppWidgets.titleText(
                    size,
                    newsItem.summary!,
                    14,
                    FontWeight.w500,
                    AppColors.APP_WHITE_COLOUR,
                    maxLines: 4, // Limit to 2 lines for the summary
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
