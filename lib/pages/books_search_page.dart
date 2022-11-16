import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/books_find_page_controller.dart';
import '../widgets/filter_button.dart';
import '../widgets/input_field.dart';
import '../widgets/try_reload_widget.dart';
import 'events_list/book_list_item.dart';

class BooksSearchPage extends StatelessWidget {
  late final double fontSize = 16;
  final BooksFindPageController _booksFindPageController = Get.find();

  late RxList<dynamic> content = _booksFindPageController.booksList;
  late final GlobalKey _keyHeaderFindBooks = GlobalKey();

  late RxBool renewSelectors = false.obs;

  late TextStyle textSelectors = TextStyle(color: Colors.black, fontSize: fontSize - 2);
  late final RxBool _showBackToTopButton = false.obs;
  late final ScrollController _scrollController = ScrollController();
  late PageStorageBucket searchEventsBucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    _scrollController.addListener(() {
      if (_scrollController.offset >= 400) {
        _showBackToTopButton.value = true;
      } else {
        _showBackToTopButton.value = false;
      }
      _booksFindPageController.controllerOffset.value = _scrollController.offset;
    });

    return RawScrollbar(
      thumbColor: Colors.grey,
      thickness: 3,
      controller: _scrollController,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        backgroundColor: Colors.white,
        body: CustomScrollView(
          shrinkWrap: true,
          controller: _scrollController,
          slivers: [
            SliverAppBar(
              expandedHeight: 150,
              elevation: 0,
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              automaticallyImplyLeading: false,
              pinned: true,
              floating: true,
              snap: true,
              primary: false,
              flexibleSpace: FlexibleSpaceBar(
                stretchModes: const [StretchMode.blurBackground],
                collapseMode: CollapseMode.parallax,
                background: _header(), // HEADER CONNECTED
              ),
            ),
            Obx(
              () {
                return SliverList(
                  delegate: SliverChildListDelegate(
// -- Block Events List created and showings--
                    _booksFindPageController.booksList.map((content) {
                      Padding widget = Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: BookListItem(content),
                      );
                      return widget;
                    }).toList(growable: false),
                  ),
                );
              },
            )
          ],
        ),

// FLOATING BUTTON UP
        floatingActionButton: Obx(
          () => _showBackToTopButton.value == false
              ? const SizedBox.shrink()
              : FloatingActionButton(
                  mini: true,
                  onPressed: () {
                    _scrollController.animateTo(0, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
                  },
                  child: Stack(
                    children: [
                      const Center(child: Icon(Icons.arrow_upward)),
                      _booksFindPageController.dataLoading.value == true
                          ? Transform.translate(offset: Offset(0, -Get.height / 4), child: CircularProgressIndicator())
                          : const SizedBox.shrink(),
                    ],
                  ),
                ),
        ),
      ),
    );
  }

// HEADER
  Widget _header() {
    return Container(
      color: Colors.white,
      child: Wrap(
        alignment: WrapAlignment.center,
        key: _keyHeaderFindBooks,
        children: [
          InputTextField(),
          FilterButton(),
        ],
      ),
    );
  }
}
