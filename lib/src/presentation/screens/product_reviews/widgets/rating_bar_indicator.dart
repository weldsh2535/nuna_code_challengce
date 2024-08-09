import 'package:flutter/material.dart';
import 'package:nuna_code_challenges/src/presentation/screens/product_reviews/widgets/rating_progress_indicator.dart';

class TRatingBarIndicator extends StatelessWidget {
  const TRatingBarIndicator({
    super.key, required this.rating,
  });
  final double rating;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 3,
            child: Text(
              double.parse(rating.toStringAsFixed(1)).toString(),
              style: Theme.of(context).textTheme.displayLarge,
            )),
        const Expanded(
          flex: 7,
          child: Column(
            children: [
              RatingProgressIndicator(
                text: '5',
                value: 1.0,
              ),
              RatingProgressIndicator(
                text: '4',
                value: 0.8,
              ),
              RatingProgressIndicator(
                text: '3',
                value: 0.6,
              ),
              RatingProgressIndicator(
                text: '2',
                value: 0.4,
              ),

              //   const UserReviewCard()
            ],
          ),
        )
      ],
    );
  }
}
