// import 'dart:ui';

// import 'package:flutter/material.dart';
// import 'package:flutter_application_store/store_controller.dart';
// import 'package:flutter_feather_icons/flutter_feather_icons.dart';
// import 'package:get/get.dart';

// import 'discount_model.dart';

// class VegetableWidget extends GetView<StoreController> {
//   const VegetableWidget({Key? key, required this.vegetableModel, required this.isSelected}) : super(key: key);
//   final VegetableModel vegetableModel;
//   final bool isSelected;

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         controller.selected.value = vegetableModel.title;
//       },
//       borderRadius: BorderRadius.circular(20),
//       child: Container(
//         padding: const EdgeInsets.all(6),
//         decoration: BoxDecoration(
//             border: Border.all(
//               width: 1,
//               color: const Color(0xff787878),
//             ),
//             borderRadius: BorderRadius.circular(16)),
//         child: ListTile(
//           leading: Image.asset(
//             vegetableModel.image,
//             width: 80,
//           ),
//           title: Text(
//             vegetableModel.title,
//             style: const TextStyle(fontWeight: FontWeight.w500),
//           ),
//           subtitle: Text("\$${vegetableModel.subtitle}"),
//           trailing: isSelected ? const Icon(FeatherIcons.checkCircle) : const Icon(FeatherIcons.circle),
//         ),
//       ),
//     );
//   }
// }
