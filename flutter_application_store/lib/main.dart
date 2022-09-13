import 'package:flutter/material.dart';
import 'package:flutter_application_store/pages/fruit.dart';
import 'package:flutter_application_store/pages/fruit_page.dart';
import 'package:flutter_application_store/pages/vegetable_page.dart';
import 'package:flutter_application_store/store.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyStore(),
    );
  }
}
