
import 'package:flutter/material.dart';
import 'package:nuna_code_challenges/src/core/constants/colors.dart';
import 'package:nuna_code_challenges/src/core/utils/device/device_utils.dart';

class RatingProgressIndicator extends StatelessWidget {
  const RatingProgressIndicator({
    super.key,
    required this.text,
    required this.value,
  });

  final String text;
  final double value;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 1,
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodyMedium,
            )),
        Expanded(
            flex: 11,
            child: SizedBox(
              width: TDeviceUtils.getScreenWidth(context) * 0.5,
              child: LinearProgressIndicator(
                value: value,
                minHeight: 15,
                backgroundColor: TColors.grey,
                borderRadius: BorderRadius.circular(7),
                valueColor: const AlwaysStoppedAnimation(TColors.primary),
              ),
            ))
      ],
    );
  }
}
