
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nuna_code_challenges/src/core/constants/colors.dart';

class TCartCounterIcon extends StatelessWidget {
  const TCartCounterIcon({
    super.key,
    this.iconColor = TColors.borderPrimary,
    required this.onPressed,
  });

  final Color? iconColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          IconButton(
              onPressed: onPressed,
              icon: Icon(Iconsax.shopping_bag, color: iconColor)),
          Positioned(
              right: 0,
              child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: TColors.black,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Center(
                  child: Text(
                    '2',
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .apply(color: TColors.white, fontSizeFactor: 0.8),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
