import '../models/home_item.dart';

abstract class HomeRepository {
  Future<List<HomeItem>> getItems();
  Future<void> toggleFavorite(String itemId, bool isFavorite);
}
