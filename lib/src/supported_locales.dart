import 'package:flutter/material.dart';

@immutable
class SupportedLocale {
  final String name;

  final Locale locale;

  const SupportedLocale(this.name, this.locale);
}

const supportedLocales = [
  SupportedLocale("Brazilian Portuguese", Locale('pt', 'BR')),
  SupportedLocale("English", Locale('en', 'US')),
  SupportedLocale("German", Locale('de', 'DE')),
  SupportedLocale("Japanese", Locale('ja', 'JP')),
  SupportedLocale("Spanish", Locale('es', 'ES')),
];
