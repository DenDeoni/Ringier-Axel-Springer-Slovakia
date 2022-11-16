import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import 'index.dart';

@immutable
class BooksList {

  const BooksList({
    required this.total,
    required this.page,
    required this.books,
  });

  final String total;
  final String page;
  final List<BookListItemModel> books;

  factory BooksList.fromJson(Map<String,dynamic> json) => BooksList(
    total: json['total'].toString(),
    page: json['page'].toString(),
    books: (json['books'] as List? ?? []).map((e) => BookListItemModel.fromJson(e as Map<String, dynamic>)).toList()
  );
  
  Map<String, dynamic> toJson() => {
    'total': total,
    'page': page,
    'books': books.map((e) => e.toJson()).toList()
  };

  BooksList clone() => BooksList(
    total: total,
    page: page,
    books: books.map((e) => e.clone()).toList()
  );


  BooksList copyWith({
    String? total,
    String? page,
    List<BookListItemModel>? books
  }) => BooksList(
    total: total ?? this.total,
    page: page ?? this.page,
    books: books ?? this.books,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is BooksList && total == other.total && page == other.page && books == other.books;

  @override
  int get hashCode => total.hashCode ^ page.hashCode ^ books.hashCode;
}
