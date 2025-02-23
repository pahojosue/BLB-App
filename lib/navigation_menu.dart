import 'package:blb/features/blb_app/screens/categories/categories.dart';
import 'package:blb/features/blb_app/screens/home/home.dart';
import 'package:blb/utils/constants/colors.dart';
import 'package:blb/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final darkMode = BLBHelperFunctions.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 60,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
          backgroundColor:
              darkMode ? const Color.fromARGB(255, 0, 0, 0) : BLBColors.white,
          indicatorColor: darkMode
              ? BLBColors.white.withValues(alpha: 0.1)
              : BLBColors.black.withValues(alpha: 0.1),
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
            NavigationDestination(
              icon: Icon(Icons.density_medium_rounded),
              label: "Categories",
            ),
            NavigationDestination(
                icon: Icon(Iconsax.add_circle), label: 'Lend'),
            NavigationDestination(icon: Icon(Iconsax.box), label: 'My Items'),
            NavigationDestination(
                icon: Icon(Iconsax.setting), label: 'Settings'),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const HomeScreen(),
    const CategoriesScreen(),
    Container(color: Colors.purple),
    Container(color: Colors.orange),
    Container(color: Colors.blue)
  ];
}
