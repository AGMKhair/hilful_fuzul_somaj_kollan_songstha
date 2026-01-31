import 'package:flutter/material.dart';

class AppRoutes {
  static const home = '/';

  static Map<String, WidgetBuilder> routes = {
    home: (_) => const HomeScreen(),
  };
}