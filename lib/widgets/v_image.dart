import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class VNetworkImage extends StatelessWidget {
  const VNetworkImage({
    Key? key,
    required this.url,
    this.height = 100,
    this.width = 100,
    this.placeholder,
    this.errorWidget,
    this.boxFit = BoxFit.fill,
  }) : super(key: key);

  final String url;
  final double height;
  final double width;
  final Widget? placeholder, errorWidget;
  final BoxFit? boxFit;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      height: height,
      width: width,
      imageUrl: url,
      fit: boxFit,
      placeholder: (context, url) =>
          placeholder ??
          Image.asset(
            "assets/placeholder.jpg",
            width: width,
            height: height,
            fit: boxFit,
          ),
      errorWidget: (context, url, error) =>
          errorWidget ??
          Image.asset(
            "assets/placeholder.jpg",
            width: width,
            height: height,
            fit: boxFit,
          ),
    );
  }
}
