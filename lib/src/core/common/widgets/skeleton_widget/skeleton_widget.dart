import 'package:flutter/material.dart';
import 'package:nuna_code_challenges/src/core/common/widgets/layouts/grid_layout.dart';
import 'package:nuna_code_challenges/src/core/common/widgets/skeleton_widget/Skeleton.dart';
import 'package:nuna_code_challenges/src/core/constants/colors.dart';

class NewsCardSkelton extends StatelessWidget {
  const NewsCardSkelton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height * .6,
        child: TGridLayout(
          itemCount: 10,
          itemBuilder: (context, index) => Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: TColors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          offset: Offset(0, 5),
                          blurRadius: 10,
                          color: TColors.grey,
                        ),
                      ]),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Skeleton(
                                height: 200,
                                width: 150,
                              ),
                             
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: Skeleton(
                                height: 10,
                                width: 150,
                              ),
                            ),
                          ],
                        ),
                       SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: Skeleton(
                                height: 10,
                                width: 150,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: Skeleton(
                                height: 10,
                                width: 150,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
