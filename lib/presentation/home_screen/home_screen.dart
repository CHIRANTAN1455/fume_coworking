import 'package:flutter/material.dart';

import '../../routes/app_routes.dart';
import '../../widgets/custom_bottom_bar.dart';
import './home_screen_initial_page.dart';
import '../amenities_screen/amenities_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  int currentIndex = 0;

  final List<String> routes = [
    '/home-screen',
    '/locations-screen',
    '/workspaces-screen',
    '/amenities-screen',
    '/profile-screen',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Navigator(
        key: navigatorKey,
        initialRoute: '/home-screen',
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/home-screen' || '/':
              return MaterialPageRoute(
                builder: (context) => const HomeScreenInitialPage(),
                settings: settings,
              );
            case '/amenities-screen':
              return MaterialPageRoute(
                builder: (context) => const AmenitiesScreen(),
                settings: settings,
              );
            default:
              if (AppRoutes.routes.containsKey(settings.name)) {
                return MaterialPageRoute(
                  builder: AppRoutes.routes[settings.name]!,
                  settings: settings,
                );
              }
              return null;
          }
        },
      ),
      bottomNavigationBar: CustomBottomBar(
        currentIndex: currentIndex,
        onTap: (index) {
          if (index == 1) return; // locations not yet implemented
          if (currentIndex != index) {
            setState(() => currentIndex = index);
            navigatorKey.currentState?.pushReplacementNamed(routes[index]);
          }
        },
      ),
    );
  }
}
