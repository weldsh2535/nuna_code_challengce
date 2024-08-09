import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nuna_code_challenges/src/core/constants/colors.dart';

class CachedNewtorkImage extends StatelessWidget {
  final String? imageUrl;
  const CachedNewtorkImage({super.key, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
        imageUrl: imageUrl!,
        imageBuilder: (context, imageProvider) => ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                 color: TColors.white.withOpacity(0.08),
                    image: DecorationImage(
                        image: imageProvider, fit: BoxFit.cover)),
              ),
            ),
        progressIndicatorBuilder: (context, url, downloadProgress) => ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Container(
                width: MediaQuery.of(context).size.width / 3,
                height: double.maxFinite,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.08),
                ),
                child: const CupertinoActivityIndicator(),
              ),
            ),
        errorWidget: (context, url, error) => ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Container(
                width: MediaQuery.of(context).size.width / 3,
                height: double.maxFinite,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.08),
                ),
                child: const Icon(Icons.error),
              ),
            ));
  }
}