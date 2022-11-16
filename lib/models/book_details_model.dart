import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import 'index.dart';

@immutable
class BookDetailsModel {
  const BookDetailsModel({
    required this.error,
    required this.title,
    required this.subtitle,
    required this.authors,
    required this.publisher,
    required this.isbn10,
    required this.isbn13,
    required this.pages,
    required this.year,
    required this.rating,
    required this.desc,
    required this.price,
    required this.image,
    required this.url,
    this.pdf,
  });

  final String error;
  final String title;
  final String subtitle;
  final String authors;
  final String publisher;
  final String isbn10;
  final String isbn13;
  final String pages;
  final String year;
  final String rating;
  final String desc;
  final String price;
  final String image;
  final String url;
  final PdfModel? pdf;

  factory BookDetailsModel.fromJson(Map<String, dynamic> json) => BookDetailsModel(
      error: json['error'].toString(),
      title: json['title'].toString(),
      subtitle: json['subtitle'].toString(),
      authors: json['authors'].toString(),
      publisher: json['publisher'].toString(),
      isbn10: json['isbn10'].toString(),
      isbn13: json['isbn13'].toString(),
      pages: json['pages'].toString(),
      year: json['year'].toString(),
      rating: json['rating'].toString(),
      desc: json['desc'].toString(),
      price: json['price'].toString(),
      image: json['image'].toString(),
      url: json['url'].toString(),
      pdf: json['pdf'] != null ? PdfModel.fromJson(json['pdf'] as Map<String, dynamic>) : null);

  Map<String, dynamic> toJson() => {
        'error': error,
        'title': title,
        'subtitle': subtitle,
        'authors': authors,
        'publisher': publisher,
        'isbn10': isbn10,
        'isbn13': isbn13,
        'pages': pages,
        'year': year,
        'rating': rating,
        'desc': desc,
        'price': price,
        'image': image,
        'url': url,
        'pdf': pdf?.toJson()
      };

  BookDetailsModel clone() => BookDetailsModel(
      error: error,
      title: title,
      subtitle: subtitle,
      authors: authors,
      publisher: publisher,
      isbn10: isbn10,
      isbn13: isbn13,
      pages: pages,
      year: year,
      rating: rating,
      desc: desc,
      price: price,
      image: image,
      url: url,
      pdf: pdf?.clone());

  factory BookDetailsModel.empty() => BookDetailsModel(
      error: ' ',
      title: ' ',
      subtitle: ' ',
      authors: ' ',
      publisher: ' ',
      isbn10: ' ',
      isbn13: ' ',
      pages: ' ',
      year: '',
      rating: '',
      desc: ' ',
      price: '',
      image: '',
      url: '',
      pdf: null);

  BookDetailsModel copyWith(
          {String? error,
          String? title,
          String? subtitle,
          String? authors,
          String? publisher,
          String? isbn10,
          String? isbn13,
          String? pages,
          String? year,
          String? rating,
          String? desc,
          String? price,
          String? image,
          String? url,
          Optional<PdfModel?>? pdf}) =>
      BookDetailsModel(
        error: error ?? this.error,
        title: title ?? this.title,
        subtitle: subtitle ?? this.subtitle,
        authors: authors ?? this.authors,
        publisher: publisher ?? this.publisher,
        isbn10: isbn10 ?? this.isbn10,
        isbn13: isbn13 ?? this.isbn13,
        pages: pages ?? this.pages,
        year: year ?? this.year,
        rating: rating ?? this.rating,
        desc: desc ?? this.desc,
        price: price ?? this.price,
        image: image ?? this.image,
        url: url ?? this.url,
        pdf: checkOptional(pdf, () => this.pdf),
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookDetailsModel &&
          error == other.error &&
          title == other.title &&
          subtitle == other.subtitle &&
          authors == other.authors &&
          publisher == other.publisher &&
          isbn10 == other.isbn10 &&
          isbn13 == other.isbn13 &&
          pages == other.pages &&
          year == other.year &&
          rating == other.rating &&
          desc == other.desc &&
          price == other.price &&
          image == other.image &&
          url == other.url &&
          pdf == other.pdf;

  @override
  int get hashCode =>
      error.hashCode ^
      title.hashCode ^
      subtitle.hashCode ^
      authors.hashCode ^
      publisher.hashCode ^
      isbn10.hashCode ^
      isbn13.hashCode ^
      pages.hashCode ^
      year.hashCode ^
      rating.hashCode ^
      desc.hashCode ^
      price.hashCode ^
      image.hashCode ^
      url.hashCode ^
      pdf.hashCode;
}
