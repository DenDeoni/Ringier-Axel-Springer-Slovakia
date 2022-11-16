import 'package:flutter/foundation.dart';

@immutable
class PdfModel {
  const PdfModel({
    required this.chapter2,
    required this.chapter5,
  });

  final String chapter2;
  final String chapter5;

  factory PdfModel.fromJson(Map<String, dynamic> json) => PdfModel(chapter2: json['Chapter 2'].toString(), chapter5: json['Chapter 5'].toString());

  Map<String, dynamic> toJson() => {'Chapter 2': chapter2, 'Chapter 5': chapter5};

  PdfModel clone() => PdfModel(chapter2: chapter2, chapter5: chapter5);

  PdfModel copyWith({String? chapter2, String? chapter5}) => PdfModel(
        chapter2: chapter2 ?? this.chapter2,
        chapter5: chapter5 ?? this.chapter5,
      );

  @override
  bool operator ==(Object other) => identical(this, other) || other is PdfModel && chapter2 == other.chapter2 && chapter5 == other.chapter5;

  @override
  int get hashCode => chapter2.hashCode ^ chapter5.hashCode;
}
