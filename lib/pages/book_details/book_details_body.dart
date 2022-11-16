import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../controllers/book_details_controller.dart';
import '../../models/book_details_model.dart';
import '../../translations/app_translations.dart';
import 'package:get/get.dart';
import '../../utils/base_url.dart';
import '../../utils/constants.dart';
import '../../widgets/divider_widget.dart';
import '../../widgets/image_net.dart';
import '../../widgets/try_reload_widget.dart';

class BookDetailsBody extends StatelessWidget {
  final BookDetailsController _bookDetailsController = Get.find();
  late final Rx<BookDetailsModel> content = _bookDetailsController.bookDetails.value.obs;
  late final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    _bookDetailsController.fetchData();

    return RawScrollbar(
        thumbColor: Colors.grey,
        thickness: 3,
        controller: _scrollController,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            backgroundColor: Colors.white,
            resizeToAvoidBottomInset: false,
            body: Obx(
              () => _bookDetailsController.dataLoading.value && _bookDetailsController.dataLoadFail.value == false
                  ? const Center(
                      child: CircularProgressIndicator(
                      color: Colors.grey,
                    ))
                  : _bookDetailsController.dataLoading.value && _bookDetailsController.dataLoadFail.value
                      ? TryReloadWidget(BOOK_DETAILS_CONTROLLER)
                      : SingleChildScrollView(
                          controller: _scrollController,
                          child: Column(
                            children: [
                              // Header
                              Stack(
                                children: [
// Photo
                                  Container(
                                    height: 300,
                                    width: Get.width,
                                    child: ClipRRect(
                                      child: imageNetwork(
                                        image: _bookDetailsController.bookDetails.value.image,
                                        width: Get.width,
                                        height: 200,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              divider(0, 0, 0, 0),

// Authors
                              Container(
                                //alignment: Alignment.center,
                                width: MediaQuery.of(context).size.width,
                                child: Padding(
                                  padding: EdgeInsets.all(15),
                                  child: Text(
                                    _bookDetailsController.bookDetails.value.authors,
                                    textAlign: TextAlign.end,
                                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, fontStyle: FontStyle.italic, color: Colors.blue),
                                    maxLines: 2,
                                    softWrap: true,
                                  ),
                                ),
                              ),

// Title
                              Container(
                                padding: EdgeInsets.only(left: 20, right: 20),
                                alignment: Alignment.centerLeft,
                                width: MediaQuery.of(context).size.width,
                                child: Text(
                                  _bookDetailsController.bookDetails.value.title.toUpperCase(),
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                                  maxLines: 2,
                                  softWrap: true,
                                ),
                              ),

// SubTitle
                              Container(
                                //alignment: Alignment.center,
                                width: MediaQuery.of(context).size.width,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10, right: 20),
                                  child: Text(
                                    _bookDetailsController.bookDetails.value.subtitle,
                                    textAlign: TextAlign.start,
                                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                                    maxLines: 2,
                                    softWrap: true,
                                  ),
                                ),
                              ),

                              divider(0, 3, 0, 0),
// Description
                              Container(
                                padding: EdgeInsets.only(left: 20, bottom: 10, top: 20, right: 20),
                                alignment: Alignment.centerLeft,
                                child: Column(
                                  children: [Text(_bookDetailsController.bookDetails.value.desc)],
                                ),
                              ),

                              divider(0, 10, 0, 10),

// Publisher
                              Container(
                                alignment: Alignment.center,
                                width: MediaQuery.of(context).size.width,
                                child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Wrap(
                                    alignment: WrapAlignment.center,
                                    spacing: 20,
                                    children: [
                                      Text(
                                        PUBLISHER.tr,
                                        textAlign: TextAlign.end,
                                        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                                        maxLines: 2,
                                        softWrap: true,
                                      ),
                                      Text(
                                        _bookDetailsController.bookDetails.value.publisher,
                                        textAlign: TextAlign.end,
                                        style: const TextStyle(
                                            fontSize: 14, fontWeight: FontWeight.w700, fontStyle: FontStyle.italic, color: Colors.blue),
                                        maxLines: 2,
                                        softWrap: true,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              divider(0, 10, 0, 10),
                            ],
                          ),
                        ),
            ),
          ),
        ));
  }

  // Open link in Browser
  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }
}
