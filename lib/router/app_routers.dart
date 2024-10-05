import 'package:finance_digest/screens/error_screen.dart';
import 'package:finance_digest/screens/notification_permission_screen.dart';
import 'package:finance_digest/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../screens/login_screen.dart';
import '../screens/news_list_screen.dart';
import 'app_pages.dart';

class AppRouters {
  static final GoRouter _routers = GoRouter(
      //navigatorKey: navigatorKey,
      initialLocation: AppPages.SPLASH_SCREEN,
      routes: [
        GoRoute(
          path: AppPages.SPLASH_SCREEN,
          pageBuilder: (context, state) => const MaterialPage(
            child: SplashScreen(),
          ),
        ),
        GoRoute(
          path: AppPages.LOGIN,
          pageBuilder: (context, state) => const MaterialPage(
            child: LoginScreen(),
          ),
        ),
        GoRoute(
          path: AppPages.NOTIFICATION_PERMISSION,
          pageBuilder: (context, state) => const MaterialPage(
            child: NotificationPermissionScreen(),
          ),
        ),
        GoRoute(
          path: AppPages.NEWS_LIST,
          pageBuilder: (context, state) => const MaterialPage(
            child: NewsListScreen(),
          ),
        ),
        GoRoute(
          path: AppPages.ERROR,
          pageBuilder: (context, state) => const MaterialPage(
            child: ErrorScreen(),
          ),
        ),
      ]);

  GoRouter get routers => _routers;
}
