import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nuna_code_challenges/src/core/common/custom_shapes/curved_edges/curved_edge_widgets.dart';
import 'package:nuna_code_challenges/src/core/common/widgets/appbar/appbar.dart';
import 'package:nuna_code_challenges/src/core/common/widgets/icons/t_circular_icon.dart';
import 'package:nuna_code_challenges/src/core/common/widgets/images/t_rounded_images.dart';
import 'package:nuna_code_challenges/src/core/constants/colors.dart';
import 'package:nuna_code_challenges/src/core/constants/image_strings.dart';
import 'package:nuna_code_challenges/src/core/constants/sizes.dart';
import 'package:nuna_code_challenges/src/core/utils/helpers/helper_funcations.dart';
import 'package:nuna_code_challenges/src/presentation/screens/home.dart';

class ProductImageSlider extends StatelessWidget {
  const ProductImageSlider({
    super.key,
    required this.images,
  });
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return TCurvedEdgetWidget(
      child: Container(
        color: dark ? TColors.darkerGrey : TColors.light,
        child: Stack(
          children: [
            SizedBox(
              height: 400,
              child: Padding(
                padding: const EdgeInsets.all(TSizes.productImageRadius * 2),
                child: Center(
                  child: Image(
                    image: NetworkImage(images[0]),
                  ),
                ),
              ),
            ),
            // Image Slider
            Positioned(
              right: 0,
              bottom: 20,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 80,
                  child: ListView.separated(
                    itemCount: images.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: const AlwaysScrollableScrollPhysics(),
                    separatorBuilder: (_, index) => const SizedBox(
                      width: TSizes.spaceBtwItems,
                    ),
                    itemBuilder: (_, index) => TRoundedImages(
                      imageUrl: images[index],
                      width: 80,
                      backgroundColor: dark ? TColors.black : TColors.white,
                      border: Border.all(color: TColors.primary),
                      padding: const EdgeInsets.all(TSizes.sm),
                    ),
                  ),
                ),
              ),
            ),

            // AppBar  Icons

            TAppBar(
              shwBackArrow: true,
              actions: [
                TCircularIcon(
                  icon: Iconsax.heart5,
                  color: Colors.red,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen()),
                    );
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
