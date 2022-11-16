import 'package:flutter/material.dart';
import 'package:ringier_axel_springer_test/controllers/book_details_controller.dart';
import 'package:ringier_axel_springer_test/controllers/books_find_page_controller.dart';
import 'package:ringier_axel_springer_test/pages/books_search_page.dart';
import 'package:ringier_axel_springer_test/pages/not_found.dart';
import 'package:get/get.dart';
import 'package:ringier_axel_springer_test/translations/app_translations.dart';

import 'app_routing.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(BookDetailsController());
  Get.put(BooksFindPageController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: AppTranslations(),
      title: 'Test',
      onGenerateTitle: (BuildContext) {
        return 'data';
      },
      color: Colors.red,
      home: Scaffold(
        body: BooksSearchPage(),
      ),
      initialRoute: '/',
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('cs', 'CZ'),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (RouteSettings settings) {
        return appRouting(settings);
      },
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          builder: (BuildContext context) {
            return NotFound();
          },
        );
      },
    );
  }
}
