import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

// ignore: camel_case_types
class localization {
   final Locale locale;

  localization(this.locale);

  static localization of(BuildContext context) {
    return Localizations.of<localization>(context, localization)!;
  }

  static const LocalizationsDelegate<localization> delegate =
      _AppLocalizationsDelegate();

  late Map<String, String> _localizedStrings;

  Future<bool> load() async {
    try {
      String jsonString =
          await rootBundle.loadString('assets/lang/${locale.languageCode}.json');
      Map<String, dynamic> jsonMap = json.decode(jsonString);

      _localizedStrings = jsonMap.map((key, value) {
        return MapEntry(key, value.toString());
      });
    } catch (e) {
      print('Error loading localization for ${locale.languageCode}: $e');
      _localizedStrings = {}; // Fallback to empty map if loading fails
    }

    return true;
  }

  String translate(String key) {
    return _localizedStrings[key] ?? '';
  }
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<localization> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'es'].contains(locale.languageCode);
  }

  @override
  Future<localization> load(Locale locale) async {
    localization localizations = new localization(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(LocalizationsDelegate<localization> old) {
    return false;
  }
}
