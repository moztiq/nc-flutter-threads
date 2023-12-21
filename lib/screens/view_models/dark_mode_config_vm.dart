import 'package:flutter/material.dart';
import 'package:nc_flutter_threads/screens/models/dark_mode_config_model.dart';
import 'package:nc_flutter_threads/screens/repos/dark_mode_config_repo.dart';

class DarkModeConfigViewModel extends ChangeNotifier {
  final DarkModeConfigRepository _repository;
  late final DarkModeConfigModel _model = DarkModeConfigModel(
    isDarkMode: _repository.isDarkMode(),
  );

  DarkModeConfigViewModel(this._repository);

  bool get isDarkMode => _model.isDarkMode;

  void setDarkMode(bool value) {
    _repository.setDarkMode(value);
    _model.isDarkMode = value;
    notifyListeners();
  }
}
