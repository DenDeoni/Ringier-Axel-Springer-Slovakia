import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget divider(double right, double top, double left, double bottom) {
  return Padding(
    padding: EdgeInsets.only(left: left, top: top, right: right, bottom: bottom),
    child: SizedBox(
      width: Get.width,
      child: Row(
        children: List.generate(
          Get.width ~/ 3,
          (index) => Expanded(
            child: Container(
              color: index % 2 == 0 ? Colors.transparent : Colors.black,
              height: 1,
            ),
          ),
        ),
      ),
    ),
  );
}
