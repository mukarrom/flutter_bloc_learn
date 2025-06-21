import '../../domain/models/home_item.dart';
import '../../domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  @override
  Future<List<HomeItem>> getItems() async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));

    // Demo data - in real app this would come from API
    return [
      HomeItem(
        id: '1',
        title: 'Item 1',
        description: 'Description for item 1',
        imageUrl: 'https://picsum.photos/200/300?random=1',
      ),
      HomeItem(
        id: '2',
        title: 'Item 2',
        description: 'Description for item 2',
        imageUrl: 'https://picsum.photos/200/300?random=2',
      ),
      HomeItem(
        id: '3',
        title: 'Item 3',
        description: 'Description for item 3',
        imageUrl: 'https://picsum.photos/200/300?random=3',
      ),
    ];
  }

  @override
  Future<void> toggleFavorite(String itemId, bool isFavorite) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));

    // In real app, this would call API to update favorite status
    print('Item $itemId favorite status changed to $isFavorite');
  }
}
