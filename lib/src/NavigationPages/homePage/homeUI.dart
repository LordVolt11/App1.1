import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'UI/home_binding.dart';
import 'UI/home_screen.dart';

class homeUI extends StatelessWidget {
  const homeUI({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeScreen();
    //   debugShowCheckedModeBanner: false,
    //   initialRoute: '/',
    //   getPages: [
    //     GetPage(
    //       name: '/',
    //       // ignore: prefer_const_constructors
    //       page: () => HomeScreen(),
    //       // binding: HomeBinding(),
    //     )
    //   ],
    // );
  }
}
