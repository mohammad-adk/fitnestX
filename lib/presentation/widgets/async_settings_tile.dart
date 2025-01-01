import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AsyncSettingsTile<T> extends StatelessWidget {
  final String title;
  final AsyncValue<T> state;
  final Widget Function(T value) trailingBuilder;
  final Function(T value)? onChanged;

  const AsyncSettingsTile({
    super.key,
    required this.title,
    required this.state,
    required this.trailingBuilder,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      trailing: state.when(
        loading: () => const SizedBox(
          width: 24,
          height: 24,
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
        error: (error, _) => Icon(Icons.error, color: Theme.of(context).colorScheme.error),
        data: trailingBuilder,
      ),
    );
  }
} 