import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../domain/repositories/home_repository.dart';
import '../../domain/models/home_item.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository repository;

  HomeBloc({required this.repository}) : super(HomeInitial()) {
    on<HomeItemsRequested>(_onItemsRequested);
    on<HomeItemFavoriteToggled>(_onItemFavoriteToggled);
  }

  Future<void> _onItemsRequested(
    HomeItemsRequested event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeLoading());
    try {
      print('Fetching items from repository...');
      final items = await repository.getItems();
      print('Successfully fetched ${items.length} items');
      emit(HomeLoaded(items: items));
    } catch (e, stackTrace) {
      print('Error in _onItemsRequested: $e\n$stackTrace');
      emit(HomeError(message: 'Failed to load items: $e'));
    }
  }

  Future<void> _onItemFavoriteToggled(
    HomeItemFavoriteToggled event,
    Emitter<HomeState> emit,
  ) async {
    if (state is! HomeLoaded) return;
    
    final loadedState = state as HomeLoaded;
    final items = loadedState.items.map((item) {
      if (item.id == event.itemId) {
        final newFavoriteStatus = !item.isFavorite;
        repository.toggleFavorite(item.id, newFavoriteStatus);
        return item.copyWith(isFavorite: newFavoriteStatus);
      }
      return item;
    }).toList();
    
    emit(HomeLoaded(items: items));
  }
}
