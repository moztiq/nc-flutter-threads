import 'package:go_router/go_router.dart';
import 'package:nc_flutter_threads/screens/activity_screen.dart';
import 'package:nc_flutter_threads/screens/home_screen.dart';
import 'package:nc_flutter_threads/screens/main_navigation_screen.dart';
import 'package:nc_flutter_threads/screens/privacy_screen.dart';
import 'package:nc_flutter_threads/screens/profile_screen.dart';
import 'package:nc_flutter_threads/screens/search_screen.dart';
import 'package:nc_flutter_threads/screens/settings_screen.dart';

final router = GoRouter(
  initialLocation: "/home",
  routes: [
    GoRoute(
      name: MainNavigationScreen.routeName,
      path: "/:tab(home|search|activity|profile)",
      builder: (context, state) {
        final tab = state.params["tab"]!;
        return MainNavigationScreen(tab: tab);
      },
    ),
    GoRoute(
      name: HomeScreen.routeName,
      path: HomeScreen.routeURL,
      builder: (context, state) => HomeScreen(),
    ),
    GoRoute(
      name: SearchScreen.routeName,
      path: SearchScreen.routeURL,
      builder: (context, state) => SearchScreen(),
    ),
    GoRoute(
      name: ActivityScreen.routeName,
      path: ActivityScreen.routeURL,
      builder: (context, state) => ActivityScreen(),
    ),
    GoRoute(
      name: ProfileScreen.routeName,
      path: ProfileScreen.routeURL,
      builder: (context, state) => ProfileScreen(),
    ),
    GoRoute(
      name: SettingsScreen.routeName,
      path: SettingsScreen.routeURL,
      builder: (context, state) => SettingsScreen(),
      routes: [
        GoRoute(
          name: PrivacyScreen.routeName,
          path: PrivacyScreen.routeURL,
          builder: (context, state) => PrivacyScreen(),
        ),
      ],
    ),
  ],
);
