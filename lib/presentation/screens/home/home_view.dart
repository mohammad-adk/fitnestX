import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fitnest/config/localization/app_localizations.dart';
import 'package:fitnest/config/router/app_router.dart';
import 'home_view_model.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(homeViewModelProvider);
    final localizations = context.l10n;
    
    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.appTitle),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => AppRouter.pushNamed(context, 'settings'),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(localizations.hello),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: viewModel.toggleTheme,
              child: Text(localizations.theme),
            ),
          ],
        ),
      ),
    );
  }
} 