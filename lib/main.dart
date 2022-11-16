import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ringier_axel_springer_test/controllers/book_details_controller.dart';
import 'package:ringier_axel_springer_test/controllers/books_find_page_controller.dart';
import 'package:ringier_axel_springer_test/pages/books_search_page.dart';
import 'package:ringier_axel_springer_test/pages/not_found.dart';
import 'package:get/get.dart';
import 'package:ringier_axel_springer_test/translations/app_translations.dart';
import 'package:ringier_axel_springer_test/widgets/app_logo.dart';

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
        appBar: AppBar(
            systemOverlayStyle: SystemUiOverlayStyle.dark,
            toolbarHeight: 50,
            leadingWidth: 0,
            backgroundColor: Color.fromARGB(255, 17, 75, 112),
            automaticallyImplyLeading: false,
            title: AppLogo(),
            iconTheme: const IconThemeData(color: Colors.grey),
            centerTitle: true,
            titleSpacing: 0,
            leading: null),
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
