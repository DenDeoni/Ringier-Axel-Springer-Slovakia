import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/detail_scaffold.dart';
import 'book_details_body.dart';

class BookDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var leading = Platform.isIOS
        ? IconButton(
            onPressed: () {
              Get.back(result: 'hello');
            },
            icon: const Icon(Icons.keyboard_arrow_left),
          )
        : null;
    var body = BookDetailsBody();
    return DetailScaffold('null', leading, body);
  }
}
