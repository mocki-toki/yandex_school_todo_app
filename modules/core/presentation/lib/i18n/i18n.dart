import 'package:core_presentation/core_presentation.dart';

class AppLocalizations {
  AppLocalizations(this.locale);
  final Locale locale;

  static App of(BuildContext context) {
    final result =
        Localizations.of<AppLocalizations>(context, AppLocalizations);
    assert(result != null, 'No AppLocalizations found in context');
    return AppLocalizations.supportLocales[result!.locale.languageCode]!;
  }

  static LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  static const supportLocales = {
    'en': App(),
    'ru': AppRu(),
  };

  static List<Locale> supportedLocales =
      supportLocales.keys.map((key) => Locale(key)).toList();

  App get localization => supportLocales[locale.languageCode]!;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  @override
  bool isSupported(Locale locale) {
    return AppLocalizations.supportLocales.keys.contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations(locale);
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) => false;
}

// TODO: перенести task локализацию в модуль
