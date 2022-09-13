import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_store/const.dart';
import 'package:flutter_application_store/discount_model.dart';
import 'package:flutter_application_store/fruit_widget.dart';
import 'package:flutter_application_store/pages/fruit.dart';
import 'package:flutter_application_store/pages/fruit_page.dart';
import 'package:flutter_application_store/pages/vegetable_page.dart';
import 'package:flutter_application_store/store_controller.dart';
import 'package:flutter_application_store/vegetable_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class MyStore extends StatelessWidget {
  const MyStore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(StoreController());

    // final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
    return Scaffold(
      // key: _scaffoldState,
      endDrawer: SafeArea(
          child: Drawer(
        child: ListView(
          children: [
            Container(
              color: Colors.green[600],
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 52,
                    backgroundImage: AssetImage(
                        "assets/user-profile-icon-vector-avatar-portrait-symbol-flat-shape-person-sign-logo-black-silhouette-isolated-on-white-background-400-215744553.jpg"),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const Text(
                    "deneme",
                    style: TextStyle(color: Colors.white, fontSize: 28),
                  ),
                  const Text(
                    "deneme@gmail.com",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Obx(
                    () => Text(
                      "Available Money:  \$${controller.getMoney} ",
                      style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              "Purchased",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.green[700],
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.underline),
            ),
            Obx(() => ListView(
                  shrinkWrap: true,
                  children: controller.shoppingList
                      .map(
                        (e) => Padding(
                          padding: EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
                          child: Obx(
                            () => FruitWidget(
                              fruitModel: e,
                              isSelected: controller.selected.value == e.title,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ))
          ],
        ),
      )),

      appBar: AppBar(
        backgroundColor: const Color.fromARGB(194, 255, 255, 255),
        title: Obx(
          () => controller.isOpen.value
              ? TextField(
                  decoration: const InputDecoration.collapsed(
                      hoverColor: Colors.green, hintText: "Search", hintStyle: TextStyle(fontSize: 18)),
                  controller: controller.textController,
                  onSubmitted: controller.updateList,
                )
              : Column(
                  children: [
                    Image.asset(
                      "assets/png-transparent-green-leaf-logo-color-grass-plant.png",
                      width: 15,
                      height: 15,
                    ),
                    Text(
                      "Greengrocer",
                      style: TextStyle(color: Colors.green[700]),
                    ),
                  ],
                ),
        ),
        leading: IconButton(
          onPressed: () => controller.isOpen.toggle(),
          icon: Obx(
            () => controller.isOpen.value
                ? Icon(Icons.close, color: Colors.green[700])
                : Icon(Icons.search, color: Colors.green[700]),
          ),
        ),
        actions: [
          Obx(
            () => controller.searchText.isEmpty
                ? const SizedBox()
                : IconButton(
                    onPressed: controller.display,
                    icon: Icon(
                      Icons.close,
                      color: Colors.green[700],
                      size: 20,
                    ),
                  ),
          ),
          Container(
            child: Row(
              children: [
                Obx(
                  () => Text(
                    "\$${controller.getMoney}",
                    style: TextStyle(color: Colors.green[700]),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    // _scaffoldState.currentState!.openEndDrawer();
                  },
                  icon: Icon(
                    FontAwesomeIcons.cartPlus,
                    color: Colors.green[700],
                    size: 20,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 8,
          )
        ],
      ),
      body: Obx(
        () => controller.searchText.isNotEmpty
            ? Column(
                children: [
                  ...controller.display_list
                      .map(
                        (e) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Obx(
                            () => FruitWidget(
                              fruitModel: e,
                              isSelected: controller.selected.value == e.title,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ],
              )
            : ListView(
                children: [
                  Stack(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(
                          top: 12,
                        ),
                        child: CarouselSlider(
                            options: CarouselOptions(
                                autoPlay: true,
                                enlargeCenterPage: true,
                                aspectRatio: 2.0,
                                onPageChanged: (index, reason) {
                                  controller.current.value = index;
                                }),
                            items: Const.discounts
                                .asMap()
                                .entries
                                .map((kv) => GestureDetector(
                                    onTap: () {
                                      if (kv.key == 1) {
                                        Get.to(FruitPagee());
                                      } else if (kv.key == 2) {
                                        Get.to(VegetablePage());
                                      }
                                    },
                                    child: Image.asset(kv.value, fit: BoxFit.fill)))
                                .toList(),
                            carouselController: controller.controller),
                      ),
                      Container(
                        height: 110,
                        margin: const EdgeInsets.only(left: 60, right: 60, top: 170),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(color: Color(0xffe8e8e8), blurRadius: 5.0, offset: Offset(0, 8)),
                              BoxShadow(color: Colors.white, offset: Offset(-9, 0)),
                              BoxShadow(color: Colors.white, offset: Offset(9, 0)),
                            ]),
                        child: Container(
                          padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Review Total",
                                style: TextStyle(color: Colors.grey[700], fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Wrap(
                                    children: List.generate(
                                        5,
                                        (index) => const Icon(
                                              Icons.star,
                                              color: Colors.yellow,
                                              size: 15,
                                            )),
                                  ),
                                  const SizedBox(
                                    width: 2,
                                  ),
                                  Text(
                                    " | 4.8",
                                    style: TextStyle(color: Colors.grey[700], fontWeight: FontWeight.w300),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    " 1298 comments",
                                    style:
                                        TextStyle(color: Colors.grey[700], fontWeight: FontWeight.w300, fontSize: 12),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 13,
                              ),
                              Row(
                                children: const [
                                  Icon(
                                    Icons.location_on,
                                    size: 15,
                                    color: Colors.teal,
                                  ),
                                  Text(
                                    "1.5 km",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Icon(
                                    Icons.access_time,
                                    size: 15,
                                    color: Color.fromARGB(255, 183, 97, 97),
                                  ),
                                  SizedBox(
                                    width: 3,
                                  ),
                                  Text(
                                    "32 min",
                                    style: TextStyle(fontSize: 12),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: Const.discounts.asMap().entries.map((e) {
                      return GestureDetector(
                          child: Obx(
                        () => Container(
                          width: 12.0,
                          height: 12.0,
                          margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: (Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black)
                                  .withOpacity(controller.current.value == e.key ? 0.9 : 0.4)),
                        ),
                      ));
                    }).toList(),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: const Text(
                      "Categories",
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 17),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: DefaultTabController(
                      length: 2,
                      child: Column(
                        children: [
                          const TabBar(
                            labelColor: Colors.black,
                            tabs: [
                              Tab(text: "Fruits"),
                              Tab(text: "Vegetables"),
                            ],
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: SizedBox(
                              height: FruitConst.fruit.length * 52,
                              child: TabBarView(children: [
                                Column(
                                  children: controller.display_list
                                      .where((p0) => p0.type == "fruit")
                                      .map(
                                        (e) => Padding(
                                          padding: const EdgeInsets.symmetric(vertical: 8),
                                          child: Obx(
                                            () => FruitWidget(
                                              fruitModel: e,
                                              isSelected: controller.selected.value == e.title,
                                            ),
                                          ),
                                        ),
                                      )
                                      .toList(),
                                ),
                                Column(
                                  children: controller.display_list
                                      .where((p0) => p0.type == "vegetable")
                                      .map(
                                        (e) => Padding(
                                          padding: const EdgeInsets.symmetric(vertical: 8),
                                          child: Obx(
                                            () => FruitWidget(
                                              fruitModel: e,
                                              isSelected: controller.selected.value == e.title,
                                            ),
                                          ),
                                        ),
                                      )
                                      .toList(),
                                ),
                              ]),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
      ),
      floatingActionButton: Obx(
        () => Container(
          width: 60,
          height: 60,
          child: controller.selected.isNotEmpty
              ? FloatingActionButton(
                  onPressed: controller.move,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 6,
                      ),
                      Text(
                        "Buy",
                        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
                      ),
                      Icon(
                        Icons.add,
                        size: 14,
                      ),
                    ],
                  ),
                  backgroundColor: Colors.green[600],
                )
              : null,
        ),
      ),
    );
  }
}
