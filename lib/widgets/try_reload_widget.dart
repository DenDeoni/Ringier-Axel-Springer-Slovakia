import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/book_details_controller.dart';
import '../controllers/books_find_page_controller.dart';
import '../translations/app_translations.dart';
import '../utils/constants.dart';

class TryReloadWidget extends StatelessWidget {
  final String inputController;

  TryReloadWidget(this.inputController);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        direction: Axis.vertical,
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 5.0,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.7),
                  blurRadius: 3,
                  offset: const Offset(0, 4), // changes position of shadow
                ),
              ],
            ),
            padding: const EdgeInsets.all(8),
            child: Text(
              NO_DATA.tr,
              style: const TextStyle(fontSize: 20),
            ),
          ),
          ElevatedButton(
            style: ButtonStyle(elevation: MaterialStateProperty.all(4)),
            onPressed: () async {
              dynamic controller = _setController(inputController);
              controller.fetchData();
            },
            child: Text(TRY_RELOAD.tr),
          )
        ],
      ),
    );
  }

  dynamic _setController(String controller) {
    switch (controller) {
      case SEARCH_LIST_CONTROLLER:
        BooksFindPageController controller = Get.find();
        return controller;
      case BOOK_DETAILS_CONTROLLER:
        BookDetailsController controller = Get.find();
        return controller;
    }
  }
}
