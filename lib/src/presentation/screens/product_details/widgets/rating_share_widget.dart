import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nuna_code_challenges/src/core/constants/sizes.dart';

class RatingAndShareWidget extends StatelessWidget {
  const RatingAndShareWidget({
    super.key, required this.rating,
  });
final double rating;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //Rating
        Row(
          children: [
            const Icon(Iconsax.star5,color: Colors.amber,size: 24,),
            const SizedBox(width: TSizes.spaceBtwItems /2,),
            Text.rich(
              TextSpan(children: [
                TextSpan(text: rating.toString(),style: Theme.of(context).textTheme.bodyLarge,),
                const TextSpan(text: "(3)")
              ])
            )
          ],
        )
      ],
    );
  }
}
