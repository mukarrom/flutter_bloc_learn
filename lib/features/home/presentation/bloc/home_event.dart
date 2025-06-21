part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeItemsRequested extends HomeEvent {}

class HomeItemFavoriteToggled extends HomeEvent {
  final String itemId;

  HomeItemFavoriteToggled({required this.itemId});
}
