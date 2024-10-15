import 'package:cached_network_image/cached_network_image.dart';
import 'package:finance_digest/model/news_model.dart';
import 'package:finance_digest/router/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../utils/app_colors.dart';

class NewsDetailsScreen extends StatefulWidget {
  final NewsModel newsItem;
  const NewsDetailsScreen({super.key, required this.newsItem});

  @override
  State<NewsDetailsScreen> createState() => _NewsDetailsScreenState();
}

class _NewsDetailsScreenState extends State<NewsDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async{
        if (didPop) {
          return;
        }
        if (context.mounted ) {
          context.go(AppPages.NEWS_LIST);
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.APP_HOME_BACKGROUND_COLOUR,
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * .02),
              child: Hero(
                tag: 'news',
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                  height: size.height * 0.15,
                  width: size.width * 0.28,
                  child: CachedNetworkImage(
                      imageUrl: widget.newsItem.image!,
                      fit: BoxFit.fill,
                      progressIndicatorBuilder: (_, url, download) {
                        return Image.asset(
                          "assets/images/loader.gif",
                        );
                      } // Handle errors
                  ),
                ),
              ),
        ),),
      ),
    );
  }
}
