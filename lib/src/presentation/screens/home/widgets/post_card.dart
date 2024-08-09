import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nuna_code_challenges/src/core/common/styles/shadow_style.dart';
import 'package:nuna_code_challenges/src/core/common/widgets/texts/product_title_text.dart';
import 'package:nuna_code_challenges/src/core/constants/colors.dart';
import 'package:nuna_code_challenges/src/core/constants/image_strings.dart';
import 'package:nuna_code_challenges/src/core/constants/sizes.dart';
import 'package:nuna_code_challenges/src/domain/models/post.dart';
import 'package:nuna_code_challenges/src/presentation/blocs/comments/comments_bloc.dart';
import 'package:nuna_code_challenges/src/presentation/blocs/comments/comments_event.dart';
import 'package:nuna_code_challenges/src/presentation/blocs/comments/comments_state.dart';
import 'package:readmore/readmore.dart';

class PostCardWidget extends StatelessWidget {
  const PostCardWidget({
    super.key,
    required this.post,
  });

  final List<Post> post;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: post
              .map((post) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            boxShadow: [TShadowStyle.verticalProductShadow],
                            borderRadius: BorderRadius.circular(
                                TSizes.productImageRadius),
                            color: TColors.white),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    const CircleAvatar(
                                      backgroundImage:
                                          AssetImage(TImages.myprofile),
                                    ),
                                    const SizedBox(
                                      width: TSizes.spaceBtwItems,
                                    ),
                                    Text(
                                      "Users",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge,
                                    ),
                                  ],
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.more_vert)),
                              ],
                            ),
                            const SizedBox(
                              height: TSizes.spaceBtwItems,
                            ),
                            TProductTitleText(
                              textAlign: TextAlign.left,
                              title: post.title,
                              smallSize: true,
                            ),
                            const SizedBox(
                              height: TSizes.spaceBtwItems / 2,
                            ),
                            ReadMoreText(
                              post.body,
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
                            const SizedBox(
                              height: TSizes.spaceBtwItems / 2,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: post.tags
                                  .map(
                                    (tag) => Row(
                                      children: [
                                        Text(
                                          "#$tag",
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              fontStyle: FontStyle.italic),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        )
                                      ],
                                    ),
                                  )
                                  .toList(),
                            ),
                            const SizedBox(
                              height: TSizes.spaceBtwItems / 2,
                            ),
                            const Divider(
                              height: TSizes.dividerHeight,
                            ),
                            const SizedBox(
                              height: TSizes.spaceBtwItems / 2,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Iconsax.like_1,
                                      size: 12,
                                    ),
                                    const SizedBox(
                                      width: TSizes.spaceBtwItems / 4,
                                    ),
                                    Text(
                                      post.reactions.likes.toString(),
                                      style: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12,
                                          fontStyle: FontStyle.italic),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    //  Icon(
                                    //   Icons.,
                                    //   size: 12,
                                    // ),
                                    // SizedBox(
                                    //   width: TSizes.spaceBtwItems / 4,
                                    // ),
                                    Text(
                                      "${post.views > 1000 ? "${(post.views / 1000).toStringAsFixed(2)}k" : post.views} view",
                                      style: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12,
                                          fontStyle: FontStyle.italic),
                                    ),
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {
                                    BlocProvider.of<CommentsBloc>(context)
                                        .add(FetchCommentsDataEvent(post.id));
                                    _showBottomSheet(context);
                                  },
                                  child: const Row(
                                    children: [
                                      Icon(
                                        Icons.comment,
                                        size: 12,
                                      ),
                                      SizedBox(
                                        width: TSizes.spaceBtwItems / 4,
                                      ),
                                      Text(
                                        "53",
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 12,
                                            fontStyle: FontStyle.italic),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )

                        // ListTile(
                        //   leading: ClipRRect(
                        //     borderRadius:
                        //         BorderRadius.circular(10),
                        //     child: Image.network(
                        //       "https://media.istockphoto.com/id/1288095515/photo/african-woman-wearing-mask-in-supermarket-buying-food-in-store.webp?s=1024x1024&w=is&k=20&c=cIpkOwzXglxwX16-MHJPDd0DZhfqnsfQr-Qzm7GSXfQ=",
                        //       width: 80,
                        //       height: 120,
                        //       fit: BoxFit.cover,
                        //     ),
                        //   ),
                        //   title: Column(
                        //     crossAxisAlignment:
                        //         CrossAxisAlignment.start,
                        //     children: [
                        //       TProductTitleText(
                        //         title: post.title,
                        //         smallSize: true,
                        //       ),
                        //       const SizedBox(height: 4),
                        //       ReadMoreText(
                        //         post.body,
                        //         trimLines: 2,
                        //         trimMode: TrimMode.Line,
                        //         trimCollapsedText: 'Show more',
                        //         colorClickableText: Colors.pink,
                        //         trimExpandedText: 'Show less',
                        //         style: const TextStyle(
                        //           fontSize: 14,
                        //         ),
                        //       ),
                        //       const SizedBox(height: 4),
                        //       Row(
                        //         mainAxisAlignment:
                        //             MainAxisAlignment
                        //                 .spaceBetween,
                        //         children: [
                        //           Text(
                        //             "${post.reactions.likes.toString()} Like",
                        //             style: const TextStyle(
                        //                 color: Colors.grey,
                        //                 fontSize: 12,
                        //                 fontStyle:
                        //                     FontStyle.italic),
                        //           ),
                        //           Text(
                        //             "${post.views > 1000 ? "${(post.views / 1000).toStringAsFixed(2)}k" : post.views} view",
                        //             style: const TextStyle(
                        //                 color: Colors.grey,
                        //                 fontSize: 12,
                        //                 fontStyle:
                        //                     FontStyle.italic),
                        //           ),
                        //           GestureDetector(
                        //             onTap: () {

                        //               _showBottomSheet(context);
                        //             },
                        //             child: const Text(
                        //               "53 Comments",
                        //               style: TextStyle(
                        //                   color: Colors.grey,
                        //                   fontSize: 12,
                        //                   fontStyle:
                        //                       FontStyle.italic),
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //       Row(
                        //         mainAxisAlignment:
                        //             MainAxisAlignment.start,
                        //         children: post.tags
                        //             .map(
                        //               (tag) => Row(
                        //                 children: [
                        //                   Text(
                        //                     "#$tag",
                        //                     style: const TextStyle(
                        //                         color:
                        //                             Colors.black,
                        //                         fontSize: 10,
                        //                         fontStyle:
                        //                             FontStyle
                        //                                 .italic),
                        //                   ),
                        //                   const SizedBox(
                        //                     width: 5,
                        //                   )
                        //                 ],
                        //               ),
                        //             )
                        //             .toList(),
                        //       )
                        //     ],
                        //   ),
                        // ),

                        ),
                  ))
              .toList(),
        ),
      ],
    );
  }
}

//Bottom
void _showBottomSheet(BuildContext context) {
  Get.bottomSheet(
    Container(
      decoration: BoxDecoration(
        color: Get.isDarkMode ? Colors.black : Colors.white,
        // Remove the border radius to make it fullscreen
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      padding: const EdgeInsets.only(top: 4),
      height: MediaQuery.of(context).size.height * .9,
      child: Column(
        children: [
          // Optional: Add a handle to drag down the sheet
          Container(
            height: 6,
            width: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Get.isDarkMode ? Colors.grey[600] : Colors.grey,
            ),
          ),
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),
          Text(
            "Comments",
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),
          const Divider(
            indent: 2,
            endIndent: 2,
            color: TColors.grey,
          ),
          BlocBuilder<CommentsBloc, CommentsState>(builder: (context, state) {
            if (state is CommentsStateSucess) {
              return Expanded(
                child: ListView.builder(
                  itemCount: state.commentsResponse.comments.length,
                  itemBuilder: (context, index) {
                    final comment = state.commentsResponse.comments[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color:
                              Get.isDarkMode ? Colors.grey[800] : Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      const CircleAvatar(
                                        backgroundImage: AssetImage(TImages
                                            .myprofile), // Replace with your image
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        comment.user.username,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              ReadMoreText(
                                comment.body,
                                trimLines: 2,
                                trimMode: TrimMode.Line,
                                trimCollapsedText: 'Show more',
                                trimExpandedText: 'Less',
                                moreStyle: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue, // Replace with your color
                                ),
                                lessStyle: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue, // Replace with your color
                                ),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  Text(
                                    "${comment.likes} Likes",
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                  const SizedBox(width: 16),
                                  Text(
                                    "Reply",
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            }
            if (state is CommentsStateLoading) {
              return const Center(
                child: CircularProgressIndicator(
                    color: TColors.darkerGrey), // Replace with your color
              );
            }
            return const Center(
              child: Text("No Comments"),
            );
          })
        ],
      ),
    ),

    isScrollControlled: true,
    // Allows the bottom sheet to be fullscreen
  );
}
