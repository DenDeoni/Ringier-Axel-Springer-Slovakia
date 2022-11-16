import 'package:flutter/material.dart';
import 'package:ringier_axel_springer_test/controllers/books_find_page_controller.dart';
import '../translations/app_translations.dart';
import 'package:get/get.dart';

class InputTextField extends StatelessWidget {
  InputTextField({Key? key}) : super(key: key);

  final BooksFindPageController _booksFindPageController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, top: 20, right: 10),
        child: TextField(
          style: const TextStyle(color: Colors.black87, fontSize: 16),
          controller: _booksFindPageController.controllerTextField.value,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: const BorderSide(
                width: 0,
                style: BorderStyle.none,
              ),
            ),
            filled: true,
            hintText: SEARCHED_TEXT.tr,
            hintStyle: const TextStyle(color: Colors.black38),
            suffixIcon: IconButton(
              onPressed: () {
                _booksFindPageController.controllerTextField.value.clear();
                _booksFindPageController.searchedText.value = '';
                _booksFindPageController.textSearchIsNotEmpty.value = false;
              },
              icon: const Icon(Icons.clear),
            ),
          ),
          onChanged: (value) {
            _booksFindPageController.searchedText.value = _booksFindPageController.controllerTextField.value.text;
            _booksFindPageController.textSearchIsNotEmpty.value = true;
          },
        ),
      ),
    );
  }
}
