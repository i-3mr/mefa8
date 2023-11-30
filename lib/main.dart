import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mefa8/screens/main.dart';

void main() {
  runApp(
    ProviderScope(
      child: MaterialApp(
        home: const Main(),
        theme: ThemeData.dark(useMaterial3: true),
        themeMode: ThemeMode.dark,
      ),
    ),
  );
}
