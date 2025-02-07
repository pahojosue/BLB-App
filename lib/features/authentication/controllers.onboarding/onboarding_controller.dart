import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  static OnboardingController get instance => Get.find();

  /// variables
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  ///Update Current Index when page scroll
  void updatePageIndicator(index) => currentPageIndex = index;

  ///Jump to the specific dot selected page
  void dotNavigationClick(index) {}

  ///Update Current Index & Jump to next page
  void nextPage() {
    if (currentPageIndex.value == 0) {
      //Get.to(LoginScreen());
    } else {
      int page = currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }

  ///Update Current Index & Jump to the last page
  void skipPage() {
    currentPageIndex.value = 0; //last page index
    pageController.jumpToPage(0); //jump to last page
  }
}
