import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextWidget extends StatefulWidget {
  const TextWidget({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  State<TextWidget> createState() => _TextWidgetState();
}

class _TextWidgetState extends State<TextWidget> {
  late String firstHalf;

  late String secondHalf;

  bool hiddenText = true;

  @override
  void initState() {
    super.initState();
    if (widget.text.length > (Get.context!.height) / 5.63) {
      firstHalf = widget.text.substring(0, ((Get.context!.height) / 5.63).toInt());
      secondHalf = widget.text.substring(((Get.context!.height) / 5.63).toInt() + 1, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty
          ? Text(
              firstHalf,
              style: TextStyle(fontSize: 15, color: Colors.grey[700]),
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  hiddenText ? (firstHalf + "...") : firstHalf + secondHalf,
                  style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      hiddenText = !hiddenText;
                    });
                  },
                  child: Row(
                    children: [
                      const Text(
                        "Show more",
                        style: TextStyle(color: Colors.teal),
                      ),
                      Icon(
                        hiddenText ? Icons.arrow_drop_down_outlined : Icons.arrow_drop_up_outlined,
                        color: Colors.teal,
                      )
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
