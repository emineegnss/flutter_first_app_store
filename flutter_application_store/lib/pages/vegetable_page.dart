import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

import '../text_widget.dart';

class VegetablePage extends StatelessWidget {
  const VegetablePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              expandedHeight: 280,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  "assets/Screenshot_11.jpg",
                  width: double.maxFinite,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ],
          body: Stack(
            children: [
              Positioned(
                  top: 45,
                  left: 10,
                  right: 10,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          padding: EdgeInsets.only(left: 10),
                          width: 42,
                          height: 42,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.amber[100]),
                          child: Icon(
                            Icons.arrow_back_ios,
                            size: 20,
                            color: Colors.black,
                          )),
                      Container(
                        padding: EdgeInsets.only(right: 5),
                        width: 42,
                        height: 42,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.amber[100]),
                        child: Icon(
                          FontAwesomeIcons.cartPlus,
                          size: 20,
                          color: Colors.black,
                        ),
                      )
                    ],
                  )),
              Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  top: 0,
                  child: Container(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
                        color: Colors.black),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Vegetable Review Total",
                              style: TextStyle(color: Colors.grey[700], fontSize: 21, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Wrap(
                                  children: List.generate(
                                      5,
                                      (index) => Icon(
                                            Icons.star,
                                            color: Colors.yellow,
                                            size: 15,
                                          )),
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                Text(
                                  " | 4.8",
                                  style: TextStyle(color: Colors.grey[700], fontWeight: FontWeight.w300),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  " 682 comments",
                                  style: TextStyle(color: Colors.grey[700], fontWeight: FontWeight.w300, fontSize: 12),
                                ),
                              ],
                            ),
                            SizedBox(
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
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Essential Nutrients in Vegetables",
                          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500, color: Colors.grey[900]),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: TextWidget(
                                text:
                                    "  Vegetables are an important part of a healthy eating pattern and are excellent sources of many nutrients, including potassium, fiber, folate (folic acid) and vitamins A, E and C. These nutrients are vital for overall health and maintenance of body systems: \n \n  -Potassium: This nutrient may help to maintain healthy blood pressure. A few sources of potassium include sweet potatoes, white potatoes, tomato products and spinach. \n\n  -Fiber: Fiber regulates bowel function, helps reduce blood cholesterol levels and may lower risk of heart disease. \n\n  -Fiber: Fiber regulates bowel function, helps reduce blood cholesterol levels and may lower risk of heart disease. \n\n  -Vitamin A, E and C: These vitamins are found predominantly in green and yellow vegetables. Together, they protect against infection, help maintain eye and skin health, aid in wound healing, and have antioxidant functions. "),
                          ),
                        )
                      ],
                    ),
                  ))
            ],
          ),
        ));
  }
}
