import 'package:get/get.dart';
import 'package:ringier_axel_springer_test/models/index.dart';
import 'package:ringier_axel_springer_test/utils/constants.dart';
import '../models/book_details_model.dart';
import '../network/data_network.dart';
import '../utils/base_url.dart';

class BookDetailsController extends GetxController {
  late Rx<BookDetailsModel> bookDetails = BookDetailsModel.empty().obs;
  late RxString isbn13 = ''.obs;
  late RxBool dataLoading = false.obs;
  late RxBool dataLoadFail = false.obs;

  void fetchData() async {
    bookDetails.value = BookDetailsModel.empty();
    final String query = '${baseURL()}/1.0/books/${isbn13.value}';
    dataLoading.value = true;
    Map<String, dynamic> data = await DataNetwork().getDataFromNetwork(query);
    dataLoading.value = false;
    dataLoadFail.value = data[DATA_LOADING_FAIL] ?? false;
    bookDetails.value = BookDetailsModel.fromJson(data);
  }
}
