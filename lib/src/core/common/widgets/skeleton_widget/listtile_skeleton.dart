import 'package:flutter/material.dart';
import 'package:nuna_code_challenges/src/core/common/widgets/skeleton_widget/Skeleton.dart';
import 'package:nuna_code_challenges/src/core/constants/colors.dart';

class ListtileSkeleton extends StatelessWidget {
  const ListtileSkeleton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .6,
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => Container(
          margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          decoration: BoxDecoration(
            color: TColors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                offset: Offset(0, 5),
                blurRadius: 10,
                color: TColors.grey,
              ),
            ],
          ),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Placeholder for image or icon
                Skeleton(
                  height: 50,
                  width: 50,
                ),
                SizedBox(width: 10),
                // Column for text skeletons
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Skeleton(
                        height: 15,
                        width: double.infinity,
                      ),
                      SizedBox(height: 10),
                      Skeleton(
                        height: 10,
                        width: double.infinity,
                      ),
                    
                   
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
