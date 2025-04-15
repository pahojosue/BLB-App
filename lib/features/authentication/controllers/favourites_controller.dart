import 'dart:convert';

import 'package:blb/data/repositories/item/item_repository.dart';
import 'package:blb/features/personalisation/models/item_model.dart';
import 'package:blb/utils/local_storage/storage_utility.dart';
import 'package:blb/utils/popups/loaders.dart';
import 'package:get/get.dart';

class FavouritesController extends GetxController {
  static FavouritesController get instance => Get.find();

  /// Variables
  final favorites = <String, bool>{}.obs;
  
  @override
  void onInit() {
    super.onInit();
    initFavorites();
  }

  // Method to initialize the favorites by reading from storage
  Future<void> initFavorites() async {
    final json = BLBLocalStorage.instance().readData('favorites');
    if (json !=null) {
      final storedFavorites= jsonDecode(json) as Map<String, dynamic>;
      favorites.assignAll(storedFavorites.map((key, value) => MapEntry(key, value as bool))); 
    }
  }

  bool isFavorite(String itemId) {
    return favorites[itemId] ?? false;
  }

  void toggleFavoriteItem(String itemId) {
    if(!favorites.containsKey(itemId)) {
      favorites[itemId] = true;
      saveFavoritesToStorage();
      BLBLoaders.customToast(message: 'Item has been added to your wishlist.' );
    } else {
      BLBLocalStorage.instance().removeData(itemId);
      favorites.remove(itemId);
      saveFavoritesToStorage();
      favorites.refresh();
      BLBLoaders.customToast(message: 'Item has been removed from your wishlist.' );
    
    }
  }

  void saveFavoritesToStorage() {
    final encodedFavorites = json.encode(favorites);
    BLBLocalStorage.instance().saveData('favorites', encodedFavorites);
  }

  Future<List<ItemModel>> favoriteItems() async {
    return await ItemRepository.instance.getFavouriteItems(favorites.keys.toList());
  }
}