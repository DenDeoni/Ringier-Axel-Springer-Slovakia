import 'package:flutter/material.dart';
import '../controllers/books_find_page_controller.dart';
import '../translations/app_translations.dart';
import 'package:get/get.dart';

class SearchButton extends StatelessWidget {
  final BooksFindPageController _booksFindPageController = Get.find();

  SearchButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      width: Get.width - 20,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: const Color.fromARGB(255, 205, 38, 102),
          padding: const EdgeInsets.only(left: 10, right: 10),
          shape: const StadiumBorder(),
        ),
        onPressed: () {
          _booksFindPageController.checkText();
        },
        child: Text(
          FIND.tr.toUpperCase(),
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
