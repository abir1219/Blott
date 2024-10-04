import 'package:finance_digest/router/app_routers.dart';
import 'package:finance_digest/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      routerDelegate: AppRouters().routers.routerDelegate,
      routeInformationProvider: AppRouters().routers.routeInformationProvider,
      routeInformationParser: AppRouters().routers.routeInformationParser,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        fontFamily: "Roboto ",
        useMaterial3: true,
      ),
    );
  }
}
