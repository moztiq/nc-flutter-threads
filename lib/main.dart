import 'package:flutter/material.dart';
import 'package:nc_flutter_threads/screens/activity_screen.dart';
import 'package:nc_flutter_threads/screens/main_navigation_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Threads clone',
      home: MainNavigationScreen(),
    );
  }
}
