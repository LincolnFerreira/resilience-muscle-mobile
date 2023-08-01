import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePlaceholder extends StatelessWidget {
  final dynamic imageUrl; // Use dynamic type
  final Function(dynamic) onClickImage;
  const ImagePlaceholder({
    Key? key,
    required this.imageUrl,
    required this.onClickImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: GestureDetector(
        onTap: () => onClickImage(imageUrl),
        child: SizedBox(
          width: 90,
          height: 90,
          child: getImageWidget(imageUrl),
        ),
      ),
    );
  }

  Widget getImageWidget(dynamic imageUrl) {
    if (imageUrl is String) {
      if (imageUrl.contains('http')) {
        return Image.network(imageUrl, cacheWidth: 90, cacheHeight: 90);
      } else {
        return Image.asset(imageUrl, cacheWidth: 90, cacheHeight: 90);
      }
    } else if (imageUrl is XFile) {
      return Image.file(File(imageUrl.path), cacheWidth: 90, cacheHeight: 90);
    }
    return Image.asset('');
  }
}
