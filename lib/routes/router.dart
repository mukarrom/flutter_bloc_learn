// import 'package:flutter/material.dart';
// import 'package:flutter_bloc_learn/features/home/presentation/pages/home_page.dart';
// import 'package:flutter_bloc_learn/features/main_layout/presentation/pages/main_layout.dart'; // Import MainLayout
// import 'package:flutter_bloc_learn/features/main_layout/presentation/pages/settings_page.dart';
// import 'package:flutter_bloc_learn/routes/routes_name.dart';
// import 'package:go_router/go_router.dart';

// final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

// GoRouter router = GoRouter(
//   initialLocation: '/',
//   debugLogDiagnostics: true,
//   navigatorKey: navigatorKey,
//   routes: [
//     ShellRoute(
//       builder: (BuildContext context, GoRouterState state, Widget child) {
//         // The child is the widget returned by the current GoRoute (e.g., HomePage)
//         // return MainLayout(child: child);
//       },
//       routes: <RouteBase>[
//         // These are the routes that will be displayed within the ShellRoute's builder
//         GoRoute(
//           name: RoutesName.mainLayout,
//           path: RoutesName.mainLayout,
//           builder: (context, state) {
//             return const HomePage();
//           },
//         ),
//         GoRoute(
//           name: RoutesName.home,
//           path: "/${RoutesName.home}",
//           builder: (BuildContext context, GoRouterState state) {
//             return const HomePage();
//           },
//         ),
//         GoRoute(
//           name: RoutesName.settings,
//           path: "/${RoutesName.settings}",
//           builder: (BuildContext context, GoRouterState state) {
//             return const SettingsPage();
//           },
//         ),
//       ],
//     ),
//   ],
// );
