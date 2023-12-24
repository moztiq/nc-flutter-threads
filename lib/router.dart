import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nc_flutter_threads/screens/activity_screen.dart';
import 'package:nc_flutter_threads/screens/home_screen.dart';
import 'package:nc_flutter_threads/screens/login_screen.dart';
import 'package:nc_flutter_threads/screens/main_navigation_screen.dart';
import 'package:nc_flutter_threads/screens/privacy_screen.dart';
import 'package:nc_flutter_threads/screens/profile_screen.dart';
import 'package:nc_flutter_threads/screens/repos/authentication_repo.dart';
import 'package:nc_flutter_threads/screens/search_screen.dart';
import 'package:nc_flutter_threads/screens/settings_screen.dart';
import 'package:nc_flutter_threads/screens/signup_screen.dart';

final routerProvider = Provider(
  (ref) {
    ref.watch(authState);
    return GoRouter(
      initialLocation: "/home",
      redirect: (context, state) {
        final isLoggedIn = ref.read(authRepo).isLoggedIn;
        if (!isLoggedIn &&
            state.subloc != SignupScreen.routeURL &&
            state.subloc != LoginScreen.routeURL) {
          return LoginScreen.routeURL;
        }
        return null;
      },
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
          name: LoginScreen.routeName,
          path: LoginScreen.routeURL,
          builder: (context, state) => LoginScreen(),
        ),
        GoRoute(
          name: SignupScreen.routeName,
          path: SignupScreen.routeURL,
          builder: (context, state) => SignupScreen(),
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
  },
);
