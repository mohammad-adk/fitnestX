import 'package:fitnest/domain/repositories/theme_repository.dart';

class MockThemeRepository implements ThemeRepository {
  bool _isDarkMode = false;
  bool _throwError = false;

  @override
  Future<bool> isDarkMode() async {
    if (_throwError) {
      throw Exception('Mock theme repository error');
    }
    return _isDarkMode;
  }

  @override
  Future<void> setDarkMode(bool isDark) async {
    if (_throwError) {
      throw Exception('Mock theme repository error');
    }
    _isDarkMode = isDark;
  }

  // Helper methods for testing
  void setMockDarkMode(bool value) {
    _isDarkMode = value;
  }

  set throwError(bool value) {
    _throwError = value;
  }
} 