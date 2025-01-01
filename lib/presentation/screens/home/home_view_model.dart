import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fitnest/presentation/providers/theme_provider.dart';

final homeViewModelProvider = Provider.autoDispose((ref) => HomeViewModel(ref));

class HomeViewModel {
  final Ref _ref;

  HomeViewModel(this._ref);

  void toggleTheme() {
    _ref.read(themeProvider.notifier).toggleTheme();
  }
} 