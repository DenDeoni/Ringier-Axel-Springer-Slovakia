import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ringier_axel_springer_test/widgets/try_reload_widget.dart';
import '../controllers/books_find_page_controller.dart';
import '../utils/constants.dart';

class ProgressPage extends StatelessWidget {
  late final BooksFindPageController _eventsListController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        height: 500,
        padding: EdgeInsets.only(top: 150),
        alignment: Alignment.topCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: CircularProgressIndicator(
                color: Colors.grey,
              ),
            ),
            TryReloadWidget(
              SEARCH_LIST_CONTROLLER,
            ),
          ],
        ),
      ),
    );
  }
}
