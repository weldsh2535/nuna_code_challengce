import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nuna_code_challenges/src/core/common/widgets/appbar/appbar.dart';
import 'package:nuna_code_challenges/src/core/constants/colors.dart';
import 'package:nuna_code_challenges/src/core/constants/sizes.dart';
import 'package:nuna_code_challenges/src/domain/models/products.dart';
import 'package:nuna_code_challenges/src/presentation/screens/product_reviews/widgets/rating_bar_indicator.dart';
import 'package:nuna_code_challenges/src/presentation/screens/product_reviews/widgets/user_review_card.dart';

class ProductReviewScreen extends StatelessWidget {
  const ProductReviewScreen({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        title: Text("Reviews & Ratings"),
        shwBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TRatingBarIndicator(rating:product.rating),
              RatingBarIndicator(
                rating: 3.4,
                itemSize: 20,
                unratedColor: TColors.grey,
                itemBuilder: (_, index) =>
                    const Icon(Iconsax.star1, color: TColors.primary),
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              ...product.reviews.map((review) => UserReviewCard(review: review)),
               
            ],
          ),
        ),
      ),
    );
  }
}

