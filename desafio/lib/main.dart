// @dart=2.9
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'pages/home_page/http/http_binding.dart';
import 'pages/home_page/http_page.dart';

void main() {
  runApp(MyApp());
}

var dark = darkTheme;

var darkTheme = ThemeData(
  primarySwatch: Colors.red,
  brightness: Brightness.dark,
  visualDensity: VisualDensity.adaptivePlatformDensity,
);

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: dark,
      getPages: [
        GetPage(
          name: '/',
          page: () => HttpPage(),
          binding: HttpBinding(),
        )
      ],
    );
  }
}
