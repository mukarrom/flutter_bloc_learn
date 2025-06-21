import '../../domain/models/home_item.dart';

class HomeItemDto {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final bool isFavorite;

  HomeItemDto({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.isFavorite,
  });

  HomeItem toDomain() {
    return HomeItem(
      id: id,
      title: title,
      description: description,
      imageUrl: imageUrl,
      isFavorite: isFavorite,
    );
  }

  static HomeItemDto fromDomain(HomeItem item) {
    return HomeItemDto(
      id: item.id,
      title: item.title,
      description: item.description,
      imageUrl: item.imageUrl,
      isFavorite: item.isFavorite,
    );
  }
}
