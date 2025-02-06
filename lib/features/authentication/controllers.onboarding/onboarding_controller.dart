import 'package:get/get.dart';

class OnboardingController extends GetxController {
  static OnboardingController get instance => Get.find();

  /// variables

  ///Update Current Index when page scroll
  void updatePageIndicator(index) {}

  ///Jump to the specific dot selected page
  void dotNavigationClick(index) {}

  ///Update Current Index & Jump to next page
  void nextPage() {}

  ///Update Current Index & Jump to the last page
  void skipPage() {}
}
