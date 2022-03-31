import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CardImageVehicle extends StatelessWidget {
  final String? image;

  const CardImageVehicle({Key? key, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: image != null,
      child: CachedNetworkImage(
        imageUrl: image!,
        progressIndicatorBuilder: (context, url, downloadProgress) => CircularProgressIndicator(value: downloadProgress.progress),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}
