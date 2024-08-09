import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nuna_code_challenges/src/core/common/custom_shapes/curved_edges/curved_edge_widgets.dart';
import 'package:nuna_code_challenges/src/core/common/widgets/appbar/appbar.dart';
import 'package:nuna_code_challenges/src/core/common/widgets/icons/t_circular_icon.dart';
import 'package:nuna_code_challenges/src/core/common/widgets/images/cached_network_image.dart';
import 'package:nuna_code_challenges/src/core/common/widgets/images/t_rounded_images.dart';
import 'package:nuna_code_challenges/src/core/constants/colors.dart';
import 'package:nuna_code_challenges/src/core/constants/sizes.dart';
import 'package:nuna_code_challenges/src/core/utils/helpers/helper_funcations.dart';
import 'package:nuna_code_challenges/src/presentation/screens/home/home.dart';

class ProductImageSlider extends StatefulWidget {
  const ProductImageSlider({
    super.key,
    required this.images,
  });

  final List<String> images;

  @override
  _ProductImageSliderState createState() => _ProductImageSliderState();
}

class _ProductImageSliderState extends State<ProductImageSlider> {
  late String _currentImage;

  @override
  void initState() {
    super.initState();
    _currentImage = widget.images.isNotEmpty ? widget.images[0] : '';
  }

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
                padding: const EdgeInsets.only(top:100.0),
                child: Center(
                  child: TRoundedImages(
                    imageUrl: _currentImage,
                    applyImageRadius: true
                  ),
                ),
              ),
            ),
            // Thumbnail Slider
            Positioned(
              left: 0,
              bottom: 20,
              child: Padding(
                padding: const EdgeInsets.only(left: TSizes.defaultSpace, right: TSizes.defaultSpace),
                child: SizedBox(
                  height: 80,
                  child: ListView.separated(
                    itemCount: widget.images.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: const AlwaysScrollableScrollPhysics(),
                    separatorBuilder: (context, index) => const SizedBox(
                      width: TSizes.spaceBtwItems,
                    ),
                    itemBuilder: (_, index) => GestureDetector(
                      onTap: () {
                        setState(() {
                          _currentImage = widget.images[index];
                        });
                      },
                      child: TRoundedImages(
                        imageUrl: widget.images[index],
                        width: 80,
                        backgroundColor: dark ? TColors.black : TColors.white,
                        border: Border.all(color: TColors.primary),
                        padding: const EdgeInsets.all(TSizes.sm),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // AppBar Icons
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
            ),
          ],
        ),
      ),
    );
  }
}
