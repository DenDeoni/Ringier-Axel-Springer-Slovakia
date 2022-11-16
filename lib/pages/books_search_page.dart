import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ringier_axel_springer_test/utils/constants.dart';
import 'package:ringier_axel_springer_test/widgets/progress_page.dart';
import '../controllers/books_find_page_controller.dart';
import '../translations/app_translations.dart';
import '../utils/to_list_iterable.dart';
import '../widgets/search_button.dart';
import '../widgets/input_field.dart';
import '../widgets/try_reload_widget.dart';
import 'books_list/book_list_item.dart';

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
      thumbColor: Colors.red,
      thickness: 5,
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
// -- Progress bar is showings --
                    _booksFindPageController.dataLoading.value == true && _booksFindPageController.dataLoadFail.value == false
                        ? toList(
                            () => {
                              Container(
                                color: Colors.white,
                                width: Get.width,
                                height: Get.height / 5,
                                child: const Center(
                                    child: CircularProgressIndicator(
                                  color: Colors.grey,
                                )),
                              )
                            },
                          )
                        :
// -- Block Events List created and showings--

                        _booksFindPageController.dataLoading.value == false && _booksFindPageController.dataLoadFail.value == false
                            ? _booksFindPageController.booksList.map((content) {
                                Padding widget = Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: BookListItem(content),
                                );
                                return widget;
                              }).toList(growable: false)

// -- Block - IF Data Loaded is Fail, NO DATA text --
                            : toList(
                                () => {
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Container(
                                      height: 100,
                                      alignment: Alignment.bottomCenter,
                                      child: TryReloadWidget(SEARCH_LIST_CONTROLLER),
                                    ),
                                  ),
                                },
                              ),
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
          SearchButton(),
        ],
      ),
    );
  }
}
