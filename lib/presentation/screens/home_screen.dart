import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';
import '../../core/localization/app_localizations.dart';
import '../../core/router/app_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    
    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.hello),
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
              onPressed: () {
                context.read<ThemeProvider>().toggleTheme();
              },
              child: Text(localizations.theme),
            ),
          ],
        ),
      ),
    );
  }
} 