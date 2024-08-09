
import 'package:flutter/material.dart';
import 'package:nuna_code_challenges/src/core/common/custom_shapes/containers/circular_container.dart';
import 'package:nuna_code_challenges/src/core/common/custom_shapes/curved_edges/curved_edge_widgets.dart';
import 'package:nuna_code_challenges/src/core/constants/colors.dart';

class TPrimaryHeaderContainer extends StatelessWidget {
  const TPrimaryHeaderContainer({
    super.key,
    required this.child,
  });

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return TCurvedEdgetWidget(
        child: Container(
            color: TColors.primary,
            padding: const EdgeInsets.all(0),
            child: Stack(
              children: [
                Positioned(
                    top: -150,
                    right: -250,
                    child: TCirularContainer(
                      backgroundColor: TColors.textWhite.withOpacity(0.1),
                    )),
                Positioned(
                    top: 100,
                    right: -300,
                    child: TCirularContainer(
                      backgroundColor: TColors.textWhite.withOpacity(0.1),
                    )),
                child
              ],
            )));
  }
}
