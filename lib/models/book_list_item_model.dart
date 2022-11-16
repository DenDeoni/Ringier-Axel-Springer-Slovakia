import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import 'index.dart';

@immutable
class BookListItemModel {

  const BookListItemModel({
    required this.title,
    required this.subtitle,
    required this.isbn13,
    required this.price,
    required this.image,
    required this.url,
  });

  final String title;
  final String subtitle;
  final String isbn13;
  final String price;
  final String image;
  final String url;

  factory BookListItemModel.fromJson(Map<String,dynamic> json) => BookListItemModel(
    title: json['title'].toString(),
    subtitle: json['subtitle'].toString(),
    isbn13: json['isbn13'].toString(),
    price: json['price'].toString(),
    image: json['image'].toString(),
    url: json['url'].toString()
  );
  
  Map<String, dynamic> toJson() => {
    'title': title,
    'subtitle': subtitle,
    'isbn13': isbn13,
    'price': price,
    'image': image,
    'url': url
  };

  BookListItemModel clone() => BookListItemModel(
    title: title,
    subtitle: subtitle,
    isbn13: isbn13,
    price: price,
    image: image,
    url: url
  );


  BookListItemModel copyWith({
    String? title,
    String? subtitle,
    String? isbn13,
    String? price,
    String? image,
    String? url
  }) => BookListItemModel(
    title: title ?? this.title,
    subtitle: subtitle ?? this.subtitle,
    isbn13: isbn13 ?? this.isbn13,
    price: price ?? this.price,
    image: image ?? this.image,
    url: url ?? this.url,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is BookListItemModel && title == other.title && subtitle == other.subtitle && isbn13 == other.isbn13 && price == other.price && image == other.image && url == other.url;

  @override
  int get hashCode => title.hashCode ^ subtitle.hashCode ^ isbn13.hashCode ^ price.hashCode ^ image.hashCode ^ url.hashCode;
}
