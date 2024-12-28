import 'package:flutter/material.dart';
import 'app_color_scheme.dart';

class LightColorScheme implements AppColorScheme {
  @override
  Color get primary => const Color(0xFF2196F3);
  
  @override
  Color get onPrimary => Colors.white;
  
  @override
  Color get primaryContainer => const Color(0xFFBBDEFB);
  
  @override
  Color get secondary => const Color(0xFF03A9F4);
  
  @override
  Color get surface => Colors.white;
  
  @override
  Color get error => const Color(0xFFB00020);
} 