// lib/app.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc_learn/features/home/presentation/pages/home_page.dart';
import 'package:flutter_bloc_learn/features/home/presentation/pages/home_item_page.dart';
import 'package:flutter_bloc_learn/features/main_layout/presentation/pages/main_layout.dart';
import 'package:flutter_bloc_learn/features/home/presentation/pages/settings_page.dart';
import 'package:go_router/go_router.dart'; // Make sure this import is correct

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> homeNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> settingsNavigatorKey =
    GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}

GoRouter _router = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: '/home',
  debugLogDiagnostics: true,
  routes: <RouteBase>[
    GoRoute(path: '/', redirect: (_, __) => '/home'),
    StatefulShellRoute.indexedStack(
      builder: (
        BuildContext context,
        GoRouterState state,
        StatefulNavigationShell navigationShell,
      ) {
        return MainLayout(navigationShell: navigationShell);
      },
      branches: <StatefulShellBranch>[
        StatefulShellBranch(
          navigatorKey: homeNavigatorKey,
          routes: <RouteBase>[
            GoRoute(
              path: '/home',
              builder:
                  (BuildContext context, GoRouterState state) =>
                      const HomePage(),
              routes: [
                GoRoute(
                  path: 'item',
                  builder: (context, state) => const HomeItemPage(),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: settingsNavigatorKey,
          routes: <RouteBase>[
            GoRoute(
              path: '/settings',
              builder:
                  (BuildContext context, GoRouterState state) =>
                      const SettingsPage(),
            ),
          ],
        ),
      ],
    ),
  ],
);
