
import 'package:flutter/material.dart';
import 'package:nuna_code_challenges/src/core/common/custom_shapes/containers/rounded_container.dart';
import 'package:nuna_code_challenges/src/core/common/widgets/texts/product_title_text.dart';
import 'package:nuna_code_challenges/src/core/common/widgets/texts/t_section_heading.dart';
import 'package:nuna_code_challenges/src/core/constants/colors.dart';
import 'package:nuna_code_challenges/src/core/constants/sizes.dart';
import 'package:nuna_code_challenges/src/core/utils/helpers/helper_funcations.dart';

class ProductAttribute extends StatelessWidget {
  const ProductAttribute({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return  Column(
      children: [
        TRoundedContainer(
          padding: const EdgeInsets.all(TSizes.md),
          backgroundColor: dark ? TColors.darkerGrey : TColors.grey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const TSectionHeading(title: "Variation",showActionButton: false,),
                  const SizedBox(width: TSizes.spaceBtwItems,),
                  Text('\$25',style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough),),

                  const TProductTitleText(title: "price",smallSize: true,),
                  Row(
                    children: [
                      const SizedBox(width: TSizes.spaceBtwItems,),

                      Text('\$20', style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough),),
                    ],
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}