import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  static OnboardingController get instance => Get.find();

  /// variables
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  ///Update Current Index when page scroll
  void updatePageIndicator(index) => currentPageIndex.value = index;

  ///Jump to the specific dot selected page
  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpTo(index);
  }

  ///Update Current Index & Jump to next page
  void nextPage() {
    if (currentPageIndex.value == 2) {
      //Get.to(LoginScreen());
    } else {
      int page = currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }

  ///Update Current Index & Jump to the last page
  void skipPage() {
    currentPageIndex.value = 2; //last page index
    pageController.jumpToPage(2); //jump to last page
  }
}
