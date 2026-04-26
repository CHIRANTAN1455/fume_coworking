import 'package:flutter/material.dart';
import '../presentation/workspaces_screen/workspaces_screen.dart';
import '../presentation/profile_screen/profile_screen.dart';
import '../presentation/home_screen/home_screen.dart';
import '../presentation/amenities_screen/amenities_screen.dart';
import '../presentation/send_to_printer_screen/send_to_printer_screen.dart';

class AppRoutes {
  // TODO: Add your routes here
  static const String initial = '/';
  static const String workspaces = '/workspaces-screen';
  static const String profile = '/profile-screen';
  static const String home = '/home-screen';
  static const String amenities = '/amenities-screen';
  static const String sendToPrinter = '/send-to-printer-screen';

  static Map<String, WidgetBuilder> routes = {
    initial: (context) => const WorkspacesScreen(),
    workspaces: (context) => const WorkspacesScreen(),
    profile: (context) => const ProfileScreen(),
    home: (context) => const HomeScreen(),
    amenities: (context) => const AmenitiesScreen(),
    sendToPrinter: (context) => const SendToPrinterScreen(),
    // TODO: Add your other routes here
  };
}
