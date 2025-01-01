import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fitnest/config/localization/app_localizations.dart';
import 'package:fitnest/presentation/widgets/app_dropdown.dart';
import 'package:fitnest/presentation/widgets/async_settings_tile.dart';
import 'settings_view_model.dart';

class SettingsView extends ConsumerWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(settingsViewModelProvider);
    final localizations = context.l10n;
    
    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.settings),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 16),
          _buildThemeTile(viewModel, localizations),
          _buildLanguageTile(viewModel, localizations),
        ],
      ),
    );
  }

  Widget _buildThemeTile(SettingsViewModel viewModel, AppLocalizations l10n) {
    return AsyncSettingsTile<bool>(
      title: l10n.darkMode,
      state: viewModel.themeState,
      onChanged: (_) => viewModel.toggleTheme(),
      trailingBuilder: (value) => Switch(
        value: value,
        onChanged: (_) => viewModel.toggleTheme(),
      ),
    );
  }

  Widget _buildLanguageTile(SettingsViewModel viewModel, AppLocalizations l10n) {
    return AsyncSettingsTile<String>(
      title: l10n.language,
      state: viewModel.languageState,
      onChanged: viewModel.setLanguage,
      trailingBuilder: (value) => SizedBox(
        width: 140,
        child: AppDropdown<String>(
          value: value,
          items: [
            AppDropdownItem(value: 'en', label: l10n.english),
            AppDropdownItem(value: 'fa', label: l10n.persian),
          ],
          onChanged: (value) {
            if (value != null) {
              viewModel.setLanguage(value);
            }
          },
          label: '',
          margin: EdgeInsets.zero,
        ),
      ),
    );
  }
} 