import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/books_list.dart';
import '../network/data_network.dart';
import '../translations/app_translations.dart';
import '../utils/base_url.dart';
import '../utils/constants.dart';

class BooksFindPageController extends GetxController {
  late RxBool dataLoading = false.obs;
  late RxBool dataLoadFail = false.obs;
  late RxList<dynamic> booksList = [].obs;
  late RxInt booksCountFound = 0.obs;
  late RxInt booksCountViewed = 0.obs;
  late RxDouble controllerOffset = 0.0.obs;
  late RxString query = ''.obs;
  late RxBool textSearchIsNotEmpty = false.obs;
  late RxString searchedText = ''.obs;
  final Rx<TextEditingController> controllerTextField = Rx(TextEditingController());

  void createRequest() {
    booksList.value = [];
    query.value = '${baseURL()}/1.0/search/${searchedText.value}';
  }

  void fetchData() async {
    createRequest();
    dataLoadFail.value = false;
    dataLoading.value = true;
    Map<String, dynamic> data = await DataNetwork().getDataFromNetwork(query.value);
    dataLoading.value = false;
    dataLoadFail.value = data[DATA_LOADING_FAIL] ?? false;
    BooksList content = data != {DATA_LOADING_FAIL: null} ? BooksList.fromJson(data) : const BooksList(books: [], page: '0', total: '0');
    booksList.value = content.books;
    booksCountFound.value = int.parse(content.total);
    booksCountViewed.value = booksList.length;
    emptyResponseMessage();
  }

  void checkText() {
    if (searchedText.value.length >= 2) {
      fetchData();
    } else {
      Get.snackbar('!', TOO_MUCH_SHORT.tr);
    }
  }

  void emptyResponseMessage() {
    if (booksList.isEmpty) {
      Get.snackbar(NOTHNING_FOUND.tr, TRY_CHANGE_REQUEST.tr);
    }
  }
}
