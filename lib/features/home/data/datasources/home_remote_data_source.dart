import 'dart:developer';
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
    try {
      log('Fetching posts from API...');
      
      // Add headers that might be required by the API
      final headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };

      // Use a relative path since we set baseUrl in Dio options
      final response = await dio.get<List<dynamic>>(
        '/posts',
        options: Options(
          responseType: ResponseType.json,
          headers: headers,
          validateStatus: (status) => status! < 500, // Accept status codes < 500
        ),
      );

      log('Response status: ${response.statusCode}');
      
      if (response.statusCode != 200) {
        throw Exception('Failed to load posts: ${response.statusCode} - ${response.statusMessage}');
      }

      final List<dynamic> data = response.data ?? [];
      log('Fetched ${data.length} posts');

      // Verify the structure of the first item (if any)
      if (data.isNotEmpty) {
        log('First item structure: ${data.first}');
      }

      // Convert each post into our DTO
      final items = data.map<HomeItemDto>((json) {
        try {
          final id = json['id']?.toString() ?? '0';
          return HomeItemDto(
            id: id,
            title: json['title']?.toString() ?? 'No Title',
            description: json['body']?.toString() ?? 'No Description',
            imageUrl: 'https://picsum.photos/seed/$id/200/300',
            isFavorite: false,
          );
        } catch (e) {
          log('Error mapping item: $e');
          log('Problematic item: $json');
          rethrow;
        }
      }).toList();

      log('Successfully converted ${items.length} items to DTOs');
      return items;
    } on DioException catch (e) {
      log('Dio error: ${e.message}');
      log('Response data: ${e.response?.data}');
      log('Status code: ${e.response?.statusCode}');
      log('Headers: ${e.response?.headers}');
      rethrow;
    } catch (e, stackTrace) {
      log('Unexpected error in getItems: $e', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  @override
  Future<void> toggleFavorite(String itemId, bool isFavorite) async {
    // In real implementation, this would make actual API call
    // await dio.post('/items/$itemId/favorite', data: {'isFavorite': isFavorite});
    
    // Demo implementation
    print('API call: Toggle favorite for item $itemId to $isFavorite');
  }
}
