import 'package:blb/data/repositories/item/item_repository.dart';
import 'package:blb/data/repositories/user/user_repository.dart';
import 'package:blb/features/authentication/screens/login/login.dart';
import 'package:blb/features/personalisation/models/item_model.dart';
import 'package:blb/features/personalisation/models/user_model.dart';
import 'package:blb/utils/constants/image_strings.dart';
import 'package:blb/utils/helpers/network_manager.dart';
import 'package:blb/utils/popups/full_screen_loader.dart';
import 'package:blb/utils/popups/loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemController extends GetxController {
  static ItemController get instance => Get.find();
  final _auth = FirebaseAuth.instance;

  //Variables
  final canBeBartered = true.obs;
  final isNetworkImage = false.obs;
  final name = TextEditingController();
  final description = TextEditingController();
  String imageUrl = "";
  final price = TextEditingController();
  String state = "";
  final lendingPeriod = TextEditingController();
  final ownerId = TextEditingController();
  final borrowerId = TextEditingController();
  final category = TextEditingController();
  GlobalKey<FormState> itemFormKey = GlobalKey<FormState>();

  RxList<ItemModel> items = <ItemModel>[].obs;
  final isLoading = false.obs;
  final itemRepository = Get.put(ItemRepository());
  final userRepository = UserRepository.instance;

  @override
  void onInit() {
    fetchItems();
    super.onInit();
  }

  void fetchItems() async {
    try {
      //Show loader while loading the items
      isLoading.value = true;

      //Fetch items
      final itemsFetched = await itemRepository.getItems();

      //Assign Items
      items.assignAll(itemsFetched);
    } catch (e) {
      BLBLoaders.errorSnackBar(title: 'Ob Snap', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void setState(String st) {
    state = st;
  }

  void setImageUrl(String image) {
    imageUrl = image;
  }

  //Send Item Details
  Future<void> sendItemDetails() async {
    try {
      //Start Loading
      BLBFullScreenLoader.openLoadingDialog(
          "We are processing your information...", BLBImages.docerAnimation);

      //Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        BLBFullScreenLoader.stopLoading();
        return;
      }

      final user = _auth.currentUser;
      if (user == null) {
        BLBFullScreenLoader.stopLoading();
        Get.offAll(() => LoginScreen());
        BLBLoaders.warningSnackBar(
            title: "Not a user", message: "You must be login to lend an item");
        return;
      }
      //Save the Item details in the firebase
      final newItem = ItemModel(
          id: '',
          name: name.text.trim(),
          description: description.text.trim(),
          imageUrl: imageUrl,
          price: price.text.trim(),
          state: state,
          lendingPeriod: lendingPeriod.text.trim(),
          ownerId: user.uid,
          borrowerId: '',
          category: '',
          canBeBartered: canBeBartered.value);

      await itemRepository.saveUserRecord(newItem);

      //Remove Loader
      BLBFullScreenLoader.stopLoading();

      //Show success Message
      BLBLoaders.successSnackBar(
          title: "Congratulations",
          message: "The item has been successfully saved");

      //Move to Lending Page
    } catch (e) {
      // Catch any error and show it
      BLBFullScreenLoader.stopLoading();
      BLBLoaders.errorSnackBar(
        title: "Oops!",
        message: "Something went wrong: ${e.toString()}",
      );
    }
  }

  Future<String> getLenderName(String id) async {
    UserModel user = await userRepository.fetchLenderDetails(id);
    return user.userName;
  }

  Future<String> getLenderAddress(String id) async {
    UserModel user = await userRepository.fetchLenderDetails(id);
    return user.address;
  }
}
