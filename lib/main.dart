import 'package:expense_tracker/widgets/expenses.dart';
import 'package:flutter/material.dart';

var kColorScheme = ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(1,173,216,230)
);

var kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
    seedColor: const Color.fromARGB(1,63,14,64)
);


void main() {
    runApp(MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme: kDarkColorScheme,
        cardTheme: const CardTheme().copyWith(
          color: kDarkColorScheme.primaryContainer.withGreen(110).withRed(60),
          margin: const EdgeInsets.symmetric(horizontal: 16 , vertical: 8),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kDarkColorScheme.secondaryContainer,
            foregroundColor: kDarkColorScheme.primaryContainer.withGreen(170).withRed(30).withBlue(130),
          ),
        ),
      ),
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: kColorScheme,
        cardTheme: const CardTheme().copyWith(
          color: kColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 16 , vertical: 8),
        ),
        appBarTheme:  const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.primary,
          foregroundColor: kColorScheme.primaryContainer,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.primaryContainer,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
          titleLarge: const TextStyle(fontWeight: FontWeight.normal, fontSize: 22),
        ),
      ),
      home: const Expenses(),
    ));
}
