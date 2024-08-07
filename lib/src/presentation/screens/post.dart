import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nuna_code_challenges/src/core/common/widgets/layouts/grid_layout.dart';
import 'package:nuna_code_challenges/src/core/common/widgets/posts/post_card.dart';
import 'package:nuna_code_challenges/src/core/common/widgets/products/product_card.dart';
import 'package:nuna_code_challenges/src/presentation/blocs/posts/posts_bloc.dart';
import 'package:nuna_code_challenges/src/presentation/blocs/posts/posts_event.dart';
import 'package:nuna_code_challenges/src/presentation/blocs/posts/posts_state.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
     BlocProvider.of<PostsBloc>(context).add(FetchDataEvent());
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
   child: Column(
          children: [
            BlocBuilder<PostsBloc, PostsState>(
              builder: (context, state) {
                if (state is PostsStateSucess) {
                  return TGridLayout(
                      itemCount: state.data.posts.length,
                      itemBuilder: (context, index) {
                        return PostCard(
                            posts: state.data.posts[index]);
                      });
                }
                return Container();
              },
            )
          ],
        ),
     
      ),
    );
  }
}