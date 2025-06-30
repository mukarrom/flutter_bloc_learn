import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:dio/dio.dart';

import '../../data/datasources/home_remote_data_source.dart';
import '../../data/repositories/home_repository_impl.dart';
import '../bloc/home_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final dio = Dio();
        // Add base options for better debugging
        dio.options = BaseOptions(
          baseUrl: 'https://jsonplaceholder.typicode.com',
          connectTimeout: const Duration(seconds: 5),
          receiveTimeout: const Duration(seconds: 3),
        );
        final remoteDataSource = HomeRemoteDataSourceImpl(dio: dio);
        final repository = HomeRepositoryImpl(remoteDataSource: remoteDataSource);
        return HomeBloc(repository: repository)..add(HomeItemsRequested());
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Home')),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeInitial || state is HomeLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is HomeLoaded) {
              return ListView.builder(
                itemCount: state.items.length,
                itemBuilder: (context, index) {
                  final item = state.items[index];
                  return ListTile(
                    onTap: () {
                      context.push('/home/item');
                    },
                    leading: Image.network(
                      item.imageUrl,
                      width: 50,
                      height: 50,
                      errorBuilder:
                          (context, error, stackTrace) =>
                              const Icon(Icons.error),
                    ),
                    title: Text(item.title),
                    subtitle: Text(item.description),
                    trailing: IconButton(
                      icon: Icon(
                        item.isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: item.isFavorite ? Colors.red : null,
                      ),
                      onPressed: () {
                        context.read<HomeBloc>().add(
                          HomeItemFavoriteToggled(itemId: item.id),
                        );
                      },
                    ),
                  );
                },
              );
            } else if (state is HomeError) {
              return Center(child: Text(state.message));
            }
            return const Center(child: Text('Unknown state'));
          },
        ),
      ),
    );
  }
}
