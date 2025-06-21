// import 'package:flutter/material.dart';
// import 'package:flutter_bloc_learn/routes/routes_name.dart';

// class BottomNavBarWidget extends StatelessWidget {
//   const BottomNavBarWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return NavigationBar(
//       destinations: [
//         NavigationDestination(icon: const Icon(Icons.home), label: "Home"),
//         NavigationDestination(
//           icon: const Icon(Icons.settings),
//           label: "Settings",
//         ),
//       ],
//       onDestinationSelected: (int index) {
//         switch (index) {
//           case 0:
//             RoutesName.goRoutes(context, RoutesName.home);
//             break;
//           case 1:
//             RoutesName.goRoutes(context, RoutesName.settings);
//             break;
//           default:
//             RoutesName.goRoutes(context, RoutesName.home);
//             break;
//         }
//       },
//       // selectedIndex: 0,
//     );
//   }
// }
