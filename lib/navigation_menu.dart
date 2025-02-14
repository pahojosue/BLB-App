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
          backgroundColor: darkMode ? BLBColors.black : BLBColors.white,
          indicatorColor: darkMode
              ? BLBColors.white.withOpacity(0.1)
              : BLBColors.black.withOpacity(0.1),
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
            NavigationDestination(icon: Icon(Iconsax.shop), label: 'Lend'),
            NavigationDestination(
                icon: Icon(Iconsax.notification), label: 'Notifications'),
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
    Container(color: Colors.purple),
    Container(color: Colors.orange),
    Container(color: Colors.blue)
  ];
}
