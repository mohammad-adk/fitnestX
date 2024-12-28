import 'package:flutter/material.dart';
import 'app_color_scheme.dart';

class DarkColorScheme implements AppColorScheme {
  @override
  Color get primary => const Color(0xFF90CAF9);
  
  @override
  Color get onPrimary => const Color(0xFF0D47A1);
  
  @override
  Color get primaryContainer => const Color(0xFF1976D2);
  
  @override
  Color get secondary => const Color(0xFF64B5F6);
  
  @override
  Color get surface => const Color(0xFF1E1E1E);
  
  @override
  Color get error => const Color(0xFFCF6679);
} 