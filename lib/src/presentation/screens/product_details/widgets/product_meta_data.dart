
import 'package:flutter/material.dart';
import 'package:nuna_code_challenges/src/core/common/custom_shapes/containers/rounded_container.dart';
import 'package:nuna_code_challenges/src/core/common/widgets/images/t_circular_images.dart';
import 'package:nuna_code_challenges/src/core/common/widgets/texts/product_price_text.dart';
import 'package:nuna_code_challenges/src/core/common/widgets/texts/product_title_text.dart';
import 'package:nuna_code_challenges/src/core/common/widgets/texts/t_brand_title_text_with_verified_icon.dart';
import 'package:nuna_code_challenges/src/core/constants/colors.dart';
import 'package:nuna_code_challenges/src/core/constants/enums.dart';
import 'package:nuna_code_challenges/src/core/constants/image_strings.dart';
import 'package:nuna_code_challenges/src/core/constants/sizes.dart';
import 'package:nuna_code_challenges/src/core/utils/helpers/helper_funcations.dart';
import 'package:nuna_code_challenges/src/domain/models/products.dart';

class ProductMetaData extends StatelessWidget {
  const ProductMetaData({super.key, required this.product});
 final Product product;
  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            TRoundedContainer(
              radius: TSizes.sm,
              backgroundColor: TColors.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(horizontal: TSizes.sm,vertical: TSizes.xs),
              child: Text("${product.discountPercentage}%",style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.black),),
            ),
            const SizedBox(width: TSizes.spaceBtwItems,),
            //Price
            Text('\$${product.price}',style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough),),
            const SizedBox(width: TSizes.spaceBtwItems,),
            const ProductPriceText(price: '177',isLarge: true,) ,
          ],
        ),
        const SizedBox(width: TSizes.spaceBtwItems / 1.5,),
        //title
         TProductTitleText(title: product.title),
        const SizedBox(width: TSizes.spaceBtwItems,),
        Text("In Stock", style: Theme.of(context).textTheme.titleMedium,),
        const SizedBox(width: TSizes.spaceBtwItems / 1.5,),
        //stock status
        Row(
          children: [
            const TProductTitleText(title: 'Status'),
            const SizedBox(width: TSizes.spaceBtwItems,),
            Text(product.availabilityStatus,style: Theme.of(context).textTheme.titleMedium,),
          ],
        ),
       const SizedBox(height: TSizes.spaceBtwItems /1.5,),

       //Brand

       Row(
         children: [
          TCircularImage(imageUrl: TImages.facebook,
          width: 32,
          height: 32,
          overlayColor: darkMode ? TColors.white : TColors.black ,),
           TBrandTitleTextWithVerifiedIcon(title: product.brand!,brandTextSize: TextSizes.medium,),
         ],
       )
      ],
    );
  }
}