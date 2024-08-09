import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nuna_code_challenges/src/core/common/custom_shapes/containers/search_container.dart';
import 'package:nuna_code_challenges/src/core/common/widgets/appbar/appbar.dart';
import 'package:nuna_code_challenges/src/core/common/widgets/icons/cart_menu_icon.dart';
import 'package:nuna_code_challenges/src/core/common/widgets/layouts/grid_layout.dart';
import 'package:nuna_code_challenges/src/core/common/widgets/skeleton_widget/skeleton_widget.dart';
import 'package:nuna_code_challenges/src/core/common/widgets/texts/primary_header_container.dart';
import 'package:nuna_code_challenges/src/presentation/blocs/comments/comments_bloc.dart';
import 'package:nuna_code_challenges/src/presentation/blocs/comments/comments_event.dart';
import 'package:nuna_code_challenges/src/presentation/screens/home/widgets/post_card.dart';
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

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ProductsBloc>(context).add(FetchDataEvent());
    BlocProvider.of<PostsBloc>(context).add(FetchPostEvent());

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  TAppBar(
                    shwBackArrow: false,
                    title: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TSectionHeading(
                          title: "Nuna Tech",
                          showActionButton: false,
                        ),
                      ],
                    ),
                    actions: [
                      TCartCounterIcon(
                        onPressed: () {},
                      )
                    ],
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  const TSearchContainer(text: "Search in Store"),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  const TSectionHeading(
                    title: "Our Products",
                    showActionButton: true,
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
                       return const NewsCardSkelton();
                      } 
                      return Container();
                    },
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  const TSectionHeading(
                    title: "Our Blog",
                    showActionButton: true,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  BlocBuilder<PostsBloc, PostsState>(
                    builder: (context, state) {
                      if (state is PostsStateSucess) {
                        return PostCardWidget(post: state.data.posts);
                      }
                      if (state is PostsStateLoading) {
                        return const Center(
                          child: CircularProgressIndicator(
                              color: TColors.darkerGrey),
                        );
                      } else if (state is PostsStateInital) {
                        return const Center(
                          child: CircularProgressIndicator(
                              color: TColors.darkerGrey),
                        );
                      }
                      return Container();
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
