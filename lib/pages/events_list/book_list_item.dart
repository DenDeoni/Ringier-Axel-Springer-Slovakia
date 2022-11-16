import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/book_details_controller.dart';
import '../../models/book_list_item_model.dart';
import '../../translations/app_translations.dart';
import '../../utils/base_url.dart';
import '../../utils/constants.dart';
import '../../widgets/divider_widget.dart';
import '../../widgets/image_net.dart';
import 'book_item_content.dart';

class BookListItem extends StatelessWidget {
  final BookListItemModel _content;

  late final BookDetailsController _bookDetailsController = Get.put(BookDetailsController());

  BookListItem(this._content);

  @override
  Widget build(BuildContext context) {
    return _content.isBlank != true
        ? Padding(
            padding: const EdgeInsets.only(top: 20),
            child: InkWell(
              onTap: () {
                _bookDetailsController.isbn13.value = _content.isbn13;
                Get.toNamed(BOOK_DETAILS_PAGE);
              },
              child: Wrap(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
// Image block
                      Wrap(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 0.0, top: 5),
                            child: ClipRRect(
                              child: _content.image != null
                                  ? imageNetwork(
                                      image: _content.image,
                                      width: 120,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    )
                                  : Container(
                                      alignment: Alignment.center,
                                      color: Colors.yellow[100],
                                      width: 120,
                                      height: 82,
                                      child: Center(
                                        child: Text(
                                          NO_IMAGE.tr,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                            ),
                          ),

// Content block
                          BookItemContent(_content),
                        ],
                      ),
                    ],
                  ),
                  Container(child: divider(0, 15, 0, 15)),
                ],
              ),
            ),
          )
        : Container(
            height: 20,
          );
  }
}
