import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_store/const.dart';
import 'package:flutter_application_store/discount_model.dart';
import 'package:get/get.dart';

//GestureDetector
//Ink veya Inkwell
class StoreController extends GetxController {
  final selected = "".obs;
  final shoppingList = <FruitModel>[].obs;
  final textController = TextEditingController();
  String get getFirst => textController.text.trim();

  final searchText = "".obs;
  final money = 60.0.obs;
  String get getMoney => money.toStringAsFixed(2);

  final isOpen = false.obs;

  final current = 0.obs;

  final controller = CarouselController();

  final display_list = FruitConst.fruit.obs;

  void updateList(String value) {
    searchText.value = value;
    display_list.value = FruitConst.fruit.where((element) => element.title.toLowerCase().startsWith(value)).toList();
  }

  void display() {
    textController.clear();
    searchText.value = "";
    display_list.value = FruitConst.fruit;
  }

  void move() {
    final result = display_list.firstWhere((p0) => p0.title == selected.value);

    if (money.value - result.subtitle < 0) {
      selected.value = "";
      ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(content: Text("No Money")));
      return;
    }
    display_list.remove(result);
    shoppingList.add(result);
    money.value -= result.subtitle;
    selected.value = "";
  }
}
