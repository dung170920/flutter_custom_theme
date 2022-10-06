import 'package:custom_theme/color_schemes.g.dart';
import 'package:custom_theme/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final base = ThemeData.light().textTheme;
    final baseDark = ThemeData.dark().textTheme;

    return MaterialApp(
      title: 'Custom Theme',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark().copyWith(
        shadowColor: darkColorScheme.outline.withOpacity(0.1),
        scaffoldBackgroundColor: darkColorScheme.surface,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
        textTheme: baseDark
            .copyWith(
                displayMedium: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                titleLarge: const TextStyle(fontWeight: FontWeight.bold),
                headlineSmall: const TextStyle(fontWeight: FontWeight.w800),
                titleMedium: const TextStyle(fontWeight: FontWeight.bold))
            .apply(
              bodyColor: darkColorScheme.onSurface,
              displayColor: darkColorScheme.outline,
            ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: darkColorScheme.outline,
          ),
        ),
        colorScheme: darkColorScheme,
        useMaterial3: true,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: darkColorScheme.secondary,
            foregroundColor: darkColorScheme.onSecondary,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            textStyle: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: darkColorScheme.surfaceVariant,
          selectedItemColor: darkColorScheme.secondary,
        ),
      ),
      theme: ThemeData(
        shadowColor: lightColorScheme.onSurface.withOpacity(0.1),
        scaffoldBackgroundColor: lightColorScheme.surface,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          elevation: 0,
        ),
        textTheme: base
            .copyWith(
              displayMedium: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
              titleLarge: const TextStyle(fontWeight: FontWeight.bold),
              headlineSmall: const TextStyle(
                fontWeight: FontWeight.w800,
              ),
              titleMedium: const TextStyle(fontWeight: FontWeight.bold),
            )
            .apply(),
        colorScheme: lightColorScheme,
        primarySwatch: Colors.lightGreen,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: lightColorScheme.secondary,
            foregroundColor: lightColorScheme.onSecondary,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            textStyle: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        useMaterial3: true,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: lightColorScheme.surfaceVariant,
          selectedItemColor: lightColorScheme.onPrimaryContainer,
        ),
      ),
      home: const OnboardingPage(),
    );
  }
}
