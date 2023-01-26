// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homepage/src/layoutPage.dart';

import 'src/NavigationPages/homePage/UI/home_screen.dart';

// import 'src/NavigationPages/homePage/UI/home_binding.dart';
// import 'src/NavigationPages/homePage/UI/home_screen.dart';

void main() {
  runApp(const myApp());
}

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          // ignore: prefer_const_constructors
          // page: () => layoutPage(),
          page: () => layoutPage(),

          // binding: HomeBinding(),
        )
      ],
      // home: HomeScreen(),
    );
  }
}
