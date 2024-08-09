
import 'package:flutter/material.dart';
import 'package:nuna_code_challenges/src/core/common/widgets/images/cached_network_image.dart';
import 'package:nuna_code_challenges/src/core/constants/colors.dart';
import 'package:nuna_code_challenges/src/core/constants/sizes.dart';
import 'package:nuna_code_challenges/src/core/utils/helpers/helper_funcations.dart';

class TCircularImage extends StatelessWidget {
  const TCircularImage({
    super.key,
    this.width = 56,
    this.height = 56,
    required this.imageUrl,
    this.overlayColor,
    this.backgroundColor,
    this.fit = BoxFit.cover,
    this.padding = TSizes.sm,
    this.isNetworkImage = false,
    this.borderRadius = TSizes.md,
  });

  final double width, height,padding;
  final String imageUrl;
  final Color? backgroundColor;
  final BoxFit? fit;
   final bool isNetworkImage;
  final Color? overlayColor;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color:backgroundColor ?? (THelperFunctions.isDarkMode(context) ? TColors.black : TColors.white),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Center(
        child: CachedNewtorkImage(imageUrl: imageUrl,),
                
      ),
    );
  }
}
