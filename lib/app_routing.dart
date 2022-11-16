import 'package:flutter/material.dart';
import 'package:ringier_axel_springer_test/pages/book_details/book_details_page.dart';
import 'package:ringier_axel_springer_test/pages/books_search_page.dart';
import 'package:ringier_axel_springer_test/utils/constants.dart';

Route<dynamic> appRouting(RouteSettings settings) {
  switch (settings.name) {
    case BOOKS_SEARCH_PAGE:
      return PageRouteBuilder(
        pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
          return BooksSearchPage();
        },
      );

    case BOOK_DETAILS_PAGE:
      return PageRouteBuilder(
        pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
          return BookDetailsPage();
        },
      );

    default:
      return PageRouteBuilder(
        pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
          return BooksSearchPage();
        },
      );
  }
}
