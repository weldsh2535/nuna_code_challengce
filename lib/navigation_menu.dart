import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nuna_code_challenges/src/core/constants/colors.dart';
import 'package:nuna_code_challenges/src/core/utils/helpers/helper_funcations.dart';
import 'package:nuna_code_challenges/src/presentation/screens/home.dart';
import 'package:nuna_code_challenges/src/presentation/screens/video.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final bottomSelectedItemProvider = StateProvider((ref) => 0);

class NavigationMenu extends ConsumerStatefulWidget {
  const NavigationMenu({super.key});

  @override
  ConsumerState<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends ConsumerState<NavigationMenu> {
  @override
  void initState() {
    super.initState();
    // Ensure the default value is set
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(bottomSelectedItemProvider.notifier).state = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final bottomSelectedItem = ref.watch(bottomSelectedItemProvider);
    final darkMode = THelperFunctions.isDarkMode(context);
    return WillPopScope(
      onWillPop: () async {
        if (bottomSelectedItem >= 1) {
          setState(() {
            ref.read(bottomSelectedItemProvider.notifier).state = 0;
          });
        } else {
          // return BackPress().onBackPressed(context);
        }
        return false;
      },
      child: Scaffold(
        backgroundColor: TColors.white,
        body: [
          const HomeScreen(),
          const VideoScreen(),
        ][bottomSelectedItem],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: darkMode ? TColors.black : TColors.white,
          currentIndex: bottomSelectedItem,
          selectedItemColor: darkMode
              ? TColors.white.withOpacity(0.1)
              : TColors.black.withOpacity(0.1),
          unselectedItemColor: TColors.black,
          onTap: (index) {
            ref.read(bottomSelectedItemProvider.notifier).state = index;
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                bottomSelectedItem == 0 ? Icons.home : Icons.home_outlined,
                color: bottomSelectedItem == 0 ? TColors.white : Colors.black54,
                size: 30,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                bottomSelectedItem == 1
                    ? Icons.add_box_rounded
                    : Icons.add_box_outlined,
                color:
                    bottomSelectedItem == 1 ? Colors.redAccent : Colors.black54,
                size: 30,
              ),
              label: "Video",
            ),
          ],
        ),
      ),
    );
  }
}
