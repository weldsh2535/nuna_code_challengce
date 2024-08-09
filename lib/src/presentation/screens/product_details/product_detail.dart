
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nuna_code_challenges/src/core/common/widgets/texts/t_section_heading.dart';
import 'package:nuna_code_challenges/src/core/constants/sizes.dart';
import 'package:nuna_code_challenges/src/core/utils/helpers/helper_funcations.dart';
import 'package:nuna_code_challenges/src/domain/models/products.dart';
import 'package:nuna_code_challenges/src/presentation/screens/product_details/widgets/product_image_slider.dart';
import 'package:nuna_code_challenges/src/presentation/screens/product_details/widgets/product_meta_data.dart';
import 'package:nuna_code_challenges/src/presentation/screens/product_details/widgets/rating_share_widget.dart';
import 'package:nuna_code_challenges/src/presentation/screens/product_reviews/product_review.dart';
import 'package:readmore/readmore.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key, required this.products});
    final Product products;


  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Product Image Slider
             ProductImageSlider(images:products.images),

            //product Details

            Padding(padding: const EdgeInsets.only(right: TSizes.defaultSpace,left: TSizes.defaultSpace),
            child: Column(
              children: [
                //Rating and share button
                 RatingAndShareWidget(rating: products.rating,),
                 ProductMetaData(product: products),

                //description
                const TSectionHeading(title: 'Description',showActionButton: false,),
                const SizedBox(height: TSizes.spaceBtwItems,),
                 ReadMoreText(products.description,
                trimLines: 2,
                trimMode: TrimMode.Line,
                trimCollapsedText: 'Show more',
                trimExpandedText: 'Less',
                moreStyle: const TextStyle(fontSize: 14,fontWeight: FontWeight.w800),
                lessStyle: const TextStyle(fontSize: 14,fontWeight: FontWeight.w800),),
                //reviews
                const Divider(),
                const SizedBox(height:TSizes.spaceBtwItems),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     TSectionHeading(title: "Reviews(${products.reviews.length})",showActionButton: false,),
                    IconButton(onPressed: ()=>Get.to( ProductReviewScreen(product: products)), icon: const Icon(Iconsax.arrow_right_3,size:18,))
                  ],
                )

              ],
            ),)
          ],
        ),
      ),
    );
  }
}

