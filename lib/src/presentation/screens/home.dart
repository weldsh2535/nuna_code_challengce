import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nuna_code_challenges/src/core/common/widgets/layouts/grid_layout.dart';
import 'package:nuna_code_challenges/src/core/common/widgets/products/product_card.dart';
import 'package:nuna_code_challenges/src/presentation/blocs/products/products_bloc.dart';
import 'package:nuna_code_challenges/src/presentation/blocs/products/products_event.dart';
import 'package:nuna_code_challenges/src/presentation/blocs/products/products_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ProductsBloc>(context).add(FetchDataEvent());
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BlocBuilder<ProductsBloc, ProductsState>(
              builder: (context, state) {
                if (state is ProductsStateSucess) {
                  return TGridLayout(
                      itemCount: state.data.products.length,
                      itemBuilder: (context, index) {
                        return ProductCard(
                            products: state.data.products[index]);
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
