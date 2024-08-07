
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nuna_code_challenges/src/core/common/custom_shapes/containers/rounded_container.dart';
import 'package:nuna_code_challenges/src/core/common/styles/shadow_style.dart';
import 'package:nuna_code_challenges/src/core/common/widgets/icons/t_circular_icon.dart';
import 'package:nuna_code_challenges/src/core/common/widgets/texts/product_title_text.dart';
import 'package:nuna_code_challenges/src/core/common/widgets/texts/t_brand_title_text_with_verified_icon.dart';
import 'package:nuna_code_challenges/src/core/constants/colors.dart';
import 'package:nuna_code_challenges/src/core/constants/sizes.dart';
import 'package:nuna_code_challenges/src/core/utils/helpers/helper_funcations.dart';
import 'package:nuna_code_challenges/src/domain/models/products.dart';
import '../images/t_rounded_images.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.products});
  final Product products;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () {
        
      },
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [TShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: dark ? TColors.darkerGrey : TColors.white
        ),
        child: Column(
          children: [
            // Thumbnail, wishlist button, Discount Tag
            TRoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(TSizes.md),
              backgroundColor: dark ? TColors.dark:TColors.light,
              child:  Stack(
                children: [
                  // -- Thumbnail Image
                   TRoundedImages(imageUrl: products.thumbnail,applyImageRadius: true,),
                 // -- Sale Tag
                  Positioned(
                    top: 2,
                    child: TRoundedContainer(
                      radius: TSizes.sm,
                      backgroundColor: TColors.secondary.withOpacity(0.8),
                      padding:  const EdgeInsets.symmetric(horizontal: TSizes.sm,vertical: TSizes.xs),
                      child: Text('${products.discountPercentage}%',style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.black),),
                    ),
                  ),
                  //--Favourite Icon Button
                  const Positioned(
                    top: 0,
                    right: 0,
                    child: TCircularIcon(icon: Iconsax.heart5,color: Colors.red,))
                 
                ],
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems/2,),
            //-- Details
            Padding(
              padding: const EdgeInsets.only(left: TSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   TProductTitleText(title: products.title.toString(),smallSize: true,),
                  const SizedBox(height: TSizes.spaceBtwItems/2,),
                  // TBrandTitleText(),
                   TBrandTitleTextWithVerifiedIcon(title: products.brand.toString()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Text('\$${products.price}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.headlineMedium,),
                    Container(
                      decoration: const BoxDecoration(
                        color: TColors.dark,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(TSizes.cardRadiusMd),
                          bottomRight: Radius.circular(TSizes.productImageRadius)
                        ),
                      ),
                      child:  const SizedBox(
                        width: TSizes.iconLg * 1.2,
                        height: TSizes.iconLg * 1.2,
                        child: Center(child: Icon(Iconsax.add,color: TColors.white,)),
                      ),
                    ),
                  ],)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

