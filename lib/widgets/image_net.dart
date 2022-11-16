import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

Widget imageNetwork({required String image, required double width, required double height, required BoxFit fit}) {
  Widget _imageError() {
    return Center(
      child: Container(
        color: Colors.yellow[100],
        width: width,
        height: height,
        child: Center(
          child: Image.asset(
            'assets/images/broken_chain.png',
            height: 50,
            color: Colors.black54,
            // License: '<a href="https://www.flaticon.com/free-icons/freedom" title="freedom icons">Freedom icons created by Freepik - Flaticon</a>')
          ),
        ),
      ),
    );
  }

  return CachedNetworkImage(
    imageUrl: image,
    width: width,
    height: height,
    fit: fit,
    progressIndicatorBuilder: (context, url, progress) => Center(
      child: CircularProgressIndicator(
        value: progress.progress,
      ),
    ),
    errorWidget: (context, url, error) => _imageError(),
  );
}
