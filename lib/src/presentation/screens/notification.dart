import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nuna_code_challenges/src/core/common/widgets/appbar/appbar.dart';
import 'package:nuna_code_challenges/src/core/constants/colors.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final message = ModalRoute.of(context)!.settings.arguments as RemoteMessage;

    return Scaffold(
      appBar: const TAppBar(
        title: Text("Notification"),
        shwBackArrow: false,
      ),
      body: Column(
        children: [
          ListTile(
              leading: const Icon(
                Iconsax.notification,
                size: 28,
                color: TColors.primary,
              ),
              title: Text(
                message.notification!.title.toString(),
                style: Theme.of(context).textTheme.titleMedium,
              ),
              subtitle: Text(
                (message.notification!.body.toString()),
              ))
        ],
      ),
    );
  }
}
