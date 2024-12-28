import 'package:flutter/material.dart';

class AppDropdownItem<T> {
  final T value;
  final String label;

  AppDropdownItem({required this.value, required this.label});
}

class AppDropdown<T> extends StatelessWidget {
  final T value;
  final List<AppDropdownItem<T>> items;
  final Function(T?) onChanged;
  final String label;
  final EdgeInsetsGeometry? margin;

  const AppDropdown({
    super.key,
    required this.value,
    required this.items,
    required this.onChanged,
    required this.label,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? const EdgeInsets.symmetric(horizontal: 16),
      child: DropdownButtonFormField<T>(
        value: value,
        items: items.map((item) {
          return DropdownMenuItem(
            value: item.value,
            child: Text(item.label),
          );
        }).toList(),
        onChanged: onChanged,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        isExpanded: true,
      ),
    );
  }
} 