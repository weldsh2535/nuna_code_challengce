import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nuna_code_challenges/src/core/common/custom_shapes/containers/rounded_container.dart';
import 'package:nuna_code_challenges/src/core/common/styles/shadow_style.dart';
import 'package:nuna_code_challenges/src/core/common/widgets/layouts/grid_layout.dart';
import 'package:nuna_code_challenges/src/core/common/widgets/texts/product_title_text.dart';
import 'package:nuna_code_challenges/src/core/constants/image_strings.dart';
import 'package:nuna_code_challenges/src/core/utils/formatters/formatter.dart';
import 'package:nuna_code_challenges/src/presentation/blocs/comments/comments_bloc.dart';
import 'package:nuna_code_challenges/src/presentation/blocs/comments/comments_event.dart';
import 'package:nuna_code_challenges/src/presentation/blocs/comments/comments_state.dart';
import 'package:nuna_code_challenges/src/presentation/screens/home/widgets/product_card.dart';
import 'package:nuna_code_challenges/src/core/common/widgets/texts/t_section_heading.dart';
import 'package:nuna_code_challenges/src/core/constants/colors.dart';
import 'package:nuna_code_challenges/src/core/constants/sizes.dart';
import 'package:nuna_code_challenges/src/presentation/blocs/posts/posts_bloc.dart';
import 'package:nuna_code_challenges/src/presentation/blocs/posts/posts_event.dart';
import 'package:nuna_code_challenges/src/presentation/blocs/posts/posts_state.dart';
import 'package:nuna_code_challenges/src/presentation/blocs/products/products_bloc.dart';
import 'package:nuna_code_challenges/src/presentation/blocs/products/products_event.dart';
import 'package:nuna_code_challenges/src/presentation/blocs/products/products_state.dart';
import 'package:readmore/readmore.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ProductsBloc>(context).add(FetchDataEvent());
    BlocProvider.of<PostsBloc>(context).add(FetchPostEvent());
    BlocProvider.of<CommentsBloc>(context).add(FetchCommentsDataEvent());
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const TSectionHeading(
                title: "Our Products",
                showActionButton: false,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              BlocBuilder<ProductsBloc, ProductsState>(
                builder: (context, state) {
                  if (state is ProductsStateSucess) {
                    return TGridLayout(
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return ProductCard(
                              products: state.data.products[index]);
                        });
                  }
                  if (state is ProductsStateLoading) {
                    return const Center(
                      child:
                          CircularProgressIndicator(color: TColors.darkerGrey),
                    );
                  } else if (state is ProductsStateInital) {
                    return const Center(
                      child:
                          CircularProgressIndicator(color: TColors.darkerGrey),
                    );
                  }
                  return Container();
                },
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              const TSectionHeading(
                title: "Our Blog",
                showActionButton: false,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              BlocBuilder<PostsBloc, PostsState>(
                builder: (context, state) {
                  if (state is PostsStateSucess) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: state.data.posts
                              .map((post) => Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      padding: const EdgeInsets.all(1),
                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            TShadowStyle.verticalProductShadow
                                          ],
                                          borderRadius: BorderRadius.circular(
                                              TSizes.productImageRadius),
                                          color: TColors.white),
                                      child: ListTile(
                                        leading: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image.network(
                                            "https://media.istockphoto.com/id/1288095515/photo/african-woman-wearing-mask-in-supermarket-buying-food-in-store.webp?s=1024x1024&w=is&k=20&c=cIpkOwzXglxwX16-MHJPDd0DZhfqnsfQr-Qzm7GSXfQ=",
                                            width: 80,
                                            height: 120,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        title: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            TProductTitleText(
                                              title: post.title,
                                              smallSize: true,
                                            ),
                                            const SizedBox(height: 4),
                                            ReadMoreText(
                                              post.body,
                                              trimLines: 2,
                                              trimMode: TrimMode.Line,
                                              trimCollapsedText: 'Show more',
                                              colorClickableText: Colors.pink,
                                              trimExpandedText: 'Show less',
                                              style: const TextStyle(
                                                fontSize: 14,
                                              ),
                                            ),
                                            const SizedBox(height: 4),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "${post.reactions.likes.toString()} Like",
                                                  style: const TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 12,
                                                      fontStyle:
                                                          FontStyle.italic),
                                                ),
                                                Text(
                                                  "${post.views > 1000 ? "${(post.views / 1000).toStringAsFixed(2)}k" : post.views} view",
                                                  style: const TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 12,
                                                      fontStyle:
                                                          FontStyle.italic),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    
                                                    _showBottomSheet(context);
                                                  },
                                                  child: const Text(
                                                    "53 Comments",
                                                    style: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 12,
                                                        fontStyle:
                                                            FontStyle.italic),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: post.tags
                                                  .map(
                                                    (tag) => Row(
                                                      children: [
                                                        Text(
                                                          "#$tag",
                                                          style: const TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 10,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .italic),
                                                        ),
                                                        const SizedBox(
                                                          width: 5,
                                                        )
                                                      ],
                                                    ),
                                                  )
                                                  .toList(),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ))
                              .toList(),
                        ),
                      ],
                    );
                  }
                  if (state is PostsStateLoading) {
                    return const Center(
                      child:
                          CircularProgressIndicator(color: TColors.darkerGrey),
                    );
                  } else if (state is PostsStateInital) {
                    return const Center(
                      child:
                          CircularProgressIndicator(color: TColors.darkerGrey),
                    );
                  }
                  return Container();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void _showBottomSheet(BuildContext context) {
  Get.bottomSheet(
    BlocBuilder<CommentsBloc, CommentsState>(
      builder: (context, state) {
        if (state is CommentsStateSucess) {
          return Container(
            decoration: BoxDecoration(
              color: Get.isDarkMode ? Colors.black : Colors.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            padding: const EdgeInsets.only(top: 4),
            height: MediaQuery.of(context).size.height * .9,
            child: Column(
              children: [
                Container(
                  height: 6,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Get.isDarkMode ? Colors.grey[600] : Colors.grey,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: state.commentsResponse.comments.length,
                    itemBuilder: (context, index) {
                      final comment = state.commentsResponse.comments[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Get.isDarkMode ? Colors.grey[800] : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            // boxShadow: const [
                            //   BoxShadow(
                            //     color: Colors.black26,
                            //     blurRadius: 4,
                            //     offset: Offset(0, 2),
                            //   ),
                            // ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        const CircleAvatar(
                                          backgroundImage: AssetImage(TImages.myprofile), // Replace with your image
                                        ),
                                        const SizedBox(width: 8),
                                        Text(
                                          comment.user.username,
                                          style: Theme.of(context).textTheme.titleLarge,
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
                                      style: Theme.of(context).textTheme.bodyMedium,
                                    ),
                                    const SizedBox(width: 16),
                                    Text(
                                      "Reply",
                                      style: Theme.of(context).textTheme.bodyMedium,
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
                ),
              ],
            ),
          );
        }
        if (state is CommentsStateLoading) {
          return const Center(
            child:  CircularProgressIndicator(color: TColors.darkerGrey), // Replace with your color
          );
        }
        return Container();
      },
    ),
  );
}
