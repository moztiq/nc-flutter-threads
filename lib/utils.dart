import 'package:flutter/material.dart';
import 'package:nc_flutter_threads/screens/view_models/dark_mode_config_vm.dart';
import 'package:provider/provider.dart';

bool isDarkMode(BuildContext context) =>
    context.read<DarkModeConfigViewModel>().isDarkMode;
