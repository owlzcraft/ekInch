import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';

import 'messages_all_locales.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)
        as AppLocalizations;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      AppLocalizationsDelegate();

  String get appName {
    return Intl.message(
      'Your App Name',
      name: 'appName',
      desc: 'The application name',
      locale: locale.toString(),
    );
  }

  String get hello {
    return Intl.message(
      'Hello',
      name: 'hello',
      desc: 'Greeting',
      locale: locale.toString(),
    );
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  static List<Locale> getSupportedLocales() {
    return [
      Locale('en', 'US'),
      Locale('hi', 'IN'),
    ];
  }

  @override
  bool isSupported(Locale locale) {
    return getSupportedLocales().contains(locale);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    await initializeMessages(locale.toString());
    return AppLocalizations(locale);
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
