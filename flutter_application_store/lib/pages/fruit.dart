import 'package:flutter/material.dart';
import 'package:flutter_application_store/text_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class FruitPage extends StatelessWidget {
  const FruitPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
              right: 0,
              left: 0,
              child: Container(
                height: 350,
                child: Image.asset(
                  "assets/Screenshot_17.jpg",
                  fit: BoxFit.cover,
                ),
              )),
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
              top: ((Get.context!.height) / 2.41) - 20,
              child: Container(
                padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
                    color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Fruit Review Total",
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
                              " | 4.7",
                              style: TextStyle(color: Colors.grey[700], fontWeight: FontWeight.w300),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              " 616 comments",
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
                      "Essential Nutrients in Fruit",
                      style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500, color: Colors.grey[900]),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: TextWidget(
                            text:
                                "The nutrients in fruit are vital for overall health and maintenance of body systems. The benefits of these nutrients include: \n \n  -Reduced risk of chronic disease:  Eating a diet rich in fruit may reduce risk for stroke, cardiovascular disease and type 2 diabetes. \n\n  -Improved heart health: The potassium in fruit can reduce the risk of heart disease and stroke.  Potassium may also reduce the risk of developing kidney stones and help to decrease bone loss. \n\n  -Lower risk of neural tube defects: Folate (folic acid) helps the body form red blood cells. Women of childbearing age who may become pregnant and those in the first trimester of pregnancy need adequate folate. Folate helps prevent neural tube birth defects such as spina bifida. \n\n  -Protection against cell damage: An eating pattern where fruit is part of an overall healthy diet provides antioxidants that help repair damage done by free radicals and may protect against certain cancers. It may also have a positive impact on digestive health. Polyphenols are antioxidants that have been shown to alter gut microecology, or the proportion of healthy versus harmful bacteria. "),
                      ),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
