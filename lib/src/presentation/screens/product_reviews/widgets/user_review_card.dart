
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nuna_code_challenges/src/core/common/custom_shapes/containers/rounded_container.dart';
import 'package:nuna_code_challenges/src/core/constants/colors.dart';
import 'package:nuna_code_challenges/src/core/constants/image_strings.dart';
import 'package:nuna_code_challenges/src/core/constants/sizes.dart';
import 'package:nuna_code_challenges/src/core/utils/formatters/formatter.dart';
import 'package:nuna_code_challenges/src/core/utils/helpers/helper_funcations.dart';
import 'package:nuna_code_challenges/src/domain/models/products.dart';
import 'package:readmore/readmore.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key, required this.review});
  final Review review;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage(TImages.myprofile),
                ),
                const SizedBox(
                  width: TSizes.spaceBtwItems,
                ),
                Text(
                  review.reviewerName,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
          ],
        ),
        const SizedBox(
          width: TSizes.spaceBtwItems,
        ),
        Row(
          children: [
            RatingBarIndicator(
              rating: review.rating.toDouble(),
              itemSize: 20,
              unratedColor: TColors.grey,
              itemBuilder: (_, index) =>
                  const Icon(Iconsax.star1, color: TColors.primary),
            ),
            const SizedBox(
              width: TSizes.spaceBtwItems,
            ),
            Text(
              TFormatter.formatDate(review.date),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
          const SizedBox(
              width: TSizes.spaceBtwItems,
            ),
             ReadMoreText(
              review.comment,
              trimLines: 2,
              trimMode: TrimMode.Line,
              trimCollapsedText: 'Show more',
              trimExpandedText: 'Less',
              moreStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: TColors.primary),
              lessStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: TColors.primary),
            ),
            // const SizedBox(
            //   width: TSizes.spaceBtwItems,
            // ),
            // TRoundedContainer(
            //   backgroundColor: dark ? TColors.darkerGrey : TColors.grey,
            //   child: Padding(
            //     padding: const EdgeInsets.all(TSizes.md),
            //     child: Column(
            //       children: [
            //         Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //           children: [
            //             Text(
            //               "I am agree",
            //               style: Theme.of(context).textTheme.titleMedium,
            //             ),
            //             Text(
            //               "I am agree",
            //               style: Theme.of(context).textTheme.bodyMedium,
            //             ),
            //           ],
            //         ),
            //         const SizedBox(
            //           width: TSizes.spaceBtwItems,
            //         ),
            //         const ReadMoreText(
            //           "When you refer to best context, it could mean several things depending on what you're looking to achieve. Here are a few interpretations and tips for handling context effectively in different scenarios:n",
            //           trimLines: 2,
            //           trimMode: TrimMode.Line,
            //           trimCollapsedText: 'Show more',
            //           trimExpandedText: 'Less',
            //           moreStyle: TextStyle(
            //               fontSize: 14,
            //               fontWeight: FontWeight.bold,
            //               color: TColors.primary),
            //           lessStyle: TextStyle(
            //               fontSize: 14,
            //               fontWeight: FontWeight.bold,
            //               color: TColors.primary),
            //         ),
            //       ],
            //     ),
            //   ),
            // )
          
      ],
    );
  }
}

