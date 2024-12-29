import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fitnest/presentation/providers/theme_provider.dart';
import 'package:fitnest/presentation/providers/language_provider.dart';
import 'package:fitnest/presentation/widgets/app_dropdown.dart';
import 'package:fitnest/core/localization/app_localizations.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeState = ref.watch(themeProvider);
    final languageState = ref.watch(languageProvider);
    
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.settings),
      ),
      body: themeState.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
        data: (isDarkMode) => languageState.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stack) => Center(child: Text('Error: $error')),
          data: (currentLanguage) => ListView(
            children: [
              const SizedBox(height: 16),
              ListTile(
                title: Text(context.l10n.darkMode),
                trailing: Switch(
                  value: isDarkMode,
                  onChanged: (_) => ref.read(themeProvider.notifier).toggleTheme(),
                ),
              ),
              ListTile(
                title: Text(context.l10n.language),
                trailing: SizedBox(
                  width: 140,
                  child: AppDropdown<String>(
                    value: currentLanguage,
                    items: [
                      AppDropdownItem(value: 'en', label: context.l10n.english),
                      AppDropdownItem(value: 'fa', label: context.l10n.persian),
                    ],
                    onChanged: (value) {
                      if (value != null) {
                        ref.read(languageProvider.notifier).setLanguage(value);
                      }
                    },
                    label: '',
                    margin: EdgeInsets.zero,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
} 