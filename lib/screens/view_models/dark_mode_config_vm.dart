import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nc_flutter_threads/screens/models/dark_mode_config_model.dart';
import 'package:nc_flutter_threads/screens/repos/dark_mode_config_repo.dart';

class DarkModeConfigViewModel extends Notifier<DarkModeConfigModel> {
  final DarkModeConfigRepository _repository;

  DarkModeConfigViewModel(this._repository);

  void setDarkMode(bool value) {
    _repository.setDarkMode(value);
    state = DarkModeConfigModel(isDarkMode: value);
  }

  @override
  build() {
    return DarkModeConfigModel(
      isDarkMode: _repository.isDarkMode(),
    );
  }
}

final darkModeConfigProvider =
    NotifierProvider<DarkModeConfigViewModel, DarkModeConfigModel>(
  () => throw UnimplementedError(),
);
