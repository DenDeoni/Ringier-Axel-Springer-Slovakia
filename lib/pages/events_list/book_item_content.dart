import 'package:flutter/material.dart';
import '../../models/book_list_item_model.dart';
import 'package:get/get.dart';

class BookItemContent extends StatelessWidget {
  final BookListItemModel content;
  final bool isLarge;

  BookItemContent(this.content, this.isLarge);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15.0, top: 0),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
// Title
                Container(
                  padding: EdgeInsets.only(top: 5),
                  alignment: Alignment.centerLeft,
                  transform: isLarge == true ? null : Matrix4.translationValues(125, 0, 0),
                  width: isLarge == true ? MediaQuery.of(context).size.width - 20 : MediaQuery.of(context).size.width - 150,
                  child: Text(
                    content.title,
                    maxLines: 2,
                    softWrap: true,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
