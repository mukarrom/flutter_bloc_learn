class HomeItem {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final bool isFavorite;

  HomeItem({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    this.isFavorite = false,
  });

  HomeItem copyWith({
    String? id,
    String? title,
    String? description,
    String? imageUrl,
    bool? isFavorite,
  }) {
    return HomeItem(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
