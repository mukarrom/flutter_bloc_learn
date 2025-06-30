import '../../domain/models/home_item.dart';
import '../../domain/repositories/home_repository.dart';
import '../datasources/home_remote_data_source.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource remoteDataSource;

  HomeRepositoryImpl({required this.remoteDataSource});
  @override
  Future<List<HomeItem>> getItems() async {
    final dtoList = await remoteDataSource.getItems();
    return dtoList.map((dto) => dto.toDomain()).toList();
  }

  @override
  Future<void> toggleFavorite(String itemId, bool isFavorite) async {
    await remoteDataSource.toggleFavorite(itemId, isFavorite);
  }
}
