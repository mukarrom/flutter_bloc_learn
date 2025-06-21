import 'package:dio/dio.dart';
import '../models/home_item_dto.dart';

abstract class HomeRemoteDataSource {
  Future<List<HomeItemDto>> getItems();
  Future<void> toggleFavorite(String itemId, bool isFavorite);
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final Dio dio;

  HomeRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<HomeItemDto>> getItems() async {
    // In real implementation, this would make actual API call
    // final response = await dio.get('/items');
    // return (response.data as List).map((json) => HomeItemDto.fromJson(json)).toList();
    
    // Demo implementation
    return [
      HomeItemDto(
        id: '1',
        title: 'Item 1',
        description: 'Description for item 1',
        imageUrl: 'https://picsum.photos/200/300?random=1',
        isFavorite: false,
      ),
      HomeItemDto(
        id: '2',
        title: 'Item 2',
        description: 'Description for item 2',
        imageUrl: 'https://picsum.photos/200/300?random=2',
        isFavorite: false,
      ),
      HomeItemDto(
        id: '3',
        title: 'Item 3',
        description: 'Description for item 3',
        imageUrl: 'https://picsum.photos/200/300?random=3',
        isFavorite: false,
      ),
    ];
  }

  @override
  Future<void> toggleFavorite(String itemId, bool isFavorite) async {
    // In real implementation, this would make actual API call
    // await dio.post('/items/$itemId/favorite', data: {'isFavorite': isFavorite});
    
    // Demo implementation
    print('API call: Toggle favorite for item $itemId to $isFavorite');
  }
}
