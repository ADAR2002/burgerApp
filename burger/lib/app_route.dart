import 'package:burger/Data/model/burger_model.dart';

import 'package:burger/presentation/screen/home_screen.dart';
import 'package:burger/presentation/screen/item_screen.dart';
import 'package:flutter/material.dart';

import 'package:showcaseview/showcaseview.dart';

class AppRoute {
  static Route<dynamic>? route(RouteSettings setting) {
    switch (setting.name) {
      case '/':
        return MaterialPageRoute(
          builder: ((context) => ShowCaseWidget(
                autoPlay: true,
                autoPlayDelay: const Duration(seconds: 5),
                builder: Builder(builder: (context) {
                  return const HomeScreen();
                }),
              )),
        );
      case '/itemScreen':
        final Burger burger = setting.arguments as Burger;
        return MaterialPageRoute(
          builder: ((context) => ItemScreen(burger: burger)),
        );
    }
    return null;
  }
}
