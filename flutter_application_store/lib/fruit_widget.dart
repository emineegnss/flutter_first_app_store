import 'package:flutter/material.dart';
import 'package:flutter_application_store/store_controller.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';

import 'discount_model.dart';

class FruitWidget extends GetView<StoreController> {
  const FruitWidget({Key? key, required this.fruitModel, required this.isSelected}) : super(key: key);
  final FruitModel fruitModel;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (controller.selected.value == fruitModel.title) {
          controller.selected.value = "";
        } else {
          controller.selected.value = fruitModel.title;
        }
      },
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: const Color(0xff787878),
            ),
            borderRadius: BorderRadius.circular(16)),
        child: ListTile(
          leading: Image.asset(
            fruitModel.image,
            width: 60,
            height: 60,
          ),
          title: Text(
            fruitModel.title,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
          subtitle: Text("\$${fruitModel.subtitle}"),
          trailing: isSelected ? const Icon(FeatherIcons.checkCircle) : const Icon(FeatherIcons.circle),
        ),
      ),
    );
  }
}
