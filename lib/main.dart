// main.dart
import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/home_screen.dart';
import 'screens/auth_screens.dart';
import 'screens/location_search_screen.dart';
import 'screens/route_results_screen.dart';
import 'screens/detailed_route_screen.dart';
import 'screens/saved_routes_screen.dart';
import 'screens/settings_screen.dart';

void main() {
  runApp(const TaxiTeraApp());
}

class TaxiTeraApp extends StatelessWidget {
  const TaxiTeraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Taxi Tera',
      theme: ThemeData(
      fontFamily: 'YourFont',
      primaryColor: Color(0xFF000000), // Your exact colors
),
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/home': (context) => const HomeScreen(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignUpScreen(),
        '/selectStart': (context) => const SelectStartingPointScreen(),
        '/selectDestination': (context) => const SelectDestinationScreen(),
        '/routeResults': (context) => const RouteResultsScreen(),
        '/detailedRoute': (context) => const DetailedRouteScreen(),
        '/savedRoutes': (context) => const SavedRoutesScreen(),
        '/settings': (context) => const SettingsScreen(),
      },
    );
  }
}