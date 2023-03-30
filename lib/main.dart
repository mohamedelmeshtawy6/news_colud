import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_cloud/view/home_view.dart';
import 'package:news_cloud/bind.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(initialBinding: Binding(), home: const HomeView());
  }
}
