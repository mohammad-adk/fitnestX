import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';
import '../providers/language_provider.dart';
import '../widgets/app_dropdown.dart';
import '../../core/localization/app_localizations.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    
    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.settings),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 16),
          ListTile(
            title: Text(localizations.darkMode),
            trailing: Switch(
              value: context.watch<ThemeProvider>().isDarkMode,
              onChanged: (value) {
                context.read<ThemeProvider>().toggleTheme();
              },
            ),
          ),
          ListTile(
            title: Text(localizations.language),
            trailing: SizedBox(
              width: 140,
              child: AppDropdown<String>(
                value: context.watch<LanguageProvider>().currentLanguage,
                items: [
                  AppDropdownItem(value: 'en', label: localizations.english),
                  AppDropdownItem(value: 'fa', label: localizations.persian),
                ],
                onChanged: (value) {
                  if (value != null) {
                    context.read<LanguageProvider>().setLanguage(value);
                  }
                },
                label: '',
                margin: EdgeInsets.zero,
              ),
            ),
          ),
        ],
      ),
    );
  }
} 