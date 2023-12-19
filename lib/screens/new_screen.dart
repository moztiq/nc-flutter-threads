import 'package:flutter/material.dart';
import 'package:nc_flutter_threads/utils.dart';

class NewScreen extends StatelessWidget {
  const NewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: isDarkMode(context) ? Colors.black : Colors.white,
      alignment: Alignment.center,
      child: const Text('New thread'),
    );
  }
}
