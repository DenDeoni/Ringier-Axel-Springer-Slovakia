import 'package:flutter/material.dart';
import '../../models/book_list_item_model.dart';
import 'package:get/get.dart';

import '../../translations/app_translations.dart';

class BookItemContent extends StatelessWidget {
  final BookListItemModel content;

  BookItemContent(this.content);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      direction: Axis.vertical,
      children: [
// Title
        Container(
          width: Get.width - 130,
          padding: const EdgeInsets.only(top: 5),
          child: Text(
            content.title,
            maxLines: 2,
            softWrap: true,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

// Subtitle
        if (content.subtitle.isNotEmpty)
          SizedBox(
            width: Get.width - 130,
            child: Text(
              content.subtitle,
              style: const TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),

// Price
        Container(
          width: Get.width - 130,
          padding: const EdgeInsets.only(top: 10),
          alignment: Alignment.bottomRight,
          child: Wrap(
            children: [
              Text(
                PRICE.tr,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
              Text(
                content.price,
                style: const TextStyle(fontSize: 16, color: Colors.red),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
