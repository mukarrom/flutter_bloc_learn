import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (value) {
          navigationShell.goBranch(value, initialLocation: value == 0);
        },
        selectedIndex: navigationShell.currentIndex,
        destinations: [
          NavigationDestination(icon: const Icon(Icons.home), label: 'Home'),
          NavigationDestination(
            icon: const Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc_learn/features/main_layout/presentation/widgets/bottom_nav_bar_widget.dart';
// import 'package:flutter_bloc_learn/features/main_layout/presentation/widgets/my_drawer_widget.dart';

// class MainLayout extends StatelessWidget {
//   final Widget child;

//   const MainLayout({super.key, required this.child});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Flutter Bloc")),
//       drawer: MyDrawerWidget(),
//       body: child,
//       bottomNavigationBar: BottomNavBarWidget(),
//     );
//   }
// }
