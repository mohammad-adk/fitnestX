import 'package:flutter/material.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'hello': 'Hello',
      'settings': 'Settings',
      'theme': 'Theme',
      'language': 'Language',
      'dark_mode': 'Dark Mode',
      'english': 'English',
      'persian': 'Persian',
    },
    'fa': {
      'hello': 'سلام',
      'settings': 'تنظیمات',
      'theme': 'تم',
      'language': 'زبان',
      'dark_mode': 'حالت تاریک',
      'english': 'انگلیسی',
      'persian': 'فارسی',
    },
  };

  String get hello => _localizedValues[locale.languageCode]?['hello'] ?? 'Hello';
  String get settings => _localizedValues[locale.languageCode]?['settings'] ?? 'Settings';
  String get theme => _localizedValues[locale.languageCode]?['theme'] ?? 'Theme';
  String get language => _localizedValues[locale.languageCode]?['language'] ?? 'Language';
  String get darkMode => _localizedValues[locale.languageCode]?['dark_mode'] ?? 'Dark Mode';
  String get english => _localizedValues[locale.languageCode]?['english'] ?? 'English';
  String get persian => _localizedValues[locale.languageCode]?['persian'] ?? 'Persian';
} 