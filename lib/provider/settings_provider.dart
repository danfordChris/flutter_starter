import 'package:changisha/services/preferences.dart';
import 'package:flutter/material.dart';
import 'package:ipf_flutter_starter_pack/bases.dart';

enum Language {
  english("en", "US", "English"),
  swahili("sw", "TZ", "Swahili");

  const Language(this._code, this._country, this._label);
  final String _code;
  final String _country;
  final String _label;

  Locale get locale => Locale(_code, _country);
}

class SettingProvider extends ChangeNotifier {
  static SettingProvider of(BuildContext context) =>
      BaseDataProvider.of(context);

  Language? _currentLanguage;
  Language get currentLanguage => _currentLanguage ?? Language.english;
  Locale get locale => currentLanguage.locale;
  String get languageLabel => currentLanguage._label;

  ThemeMode? _themeMode;
  ThemeMode get themeMode => _themeMode ?? ThemeMode.system;

  void init() async {
    await _load();
  }

  Future<void> _load() async {
    Preferences preferences = Preferences.instance;
    String? language = await preferences.language;
    _currentLanguage = language == null || language == "en"
        ? Language.english
        : Language.swahili;
    bool? isDarkMode = await preferences.darkMode;
    _themeMode = (isDarkMode == null || !isDarkMode)
        ? ThemeMode.light
        : ThemeMode.dark;
    notifyListeners();
  }

  Future<void> changeThemeMode() async {
    _themeMode = _themeMode == ThemeMode.light
        ? ThemeMode.dark
        : ThemeMode.light;
    Preferences.instance.save(PrefKeys.darkMode, _themeMode == ThemeMode.dark);
    notifyListeners();
  }

  void changeLanguage() async {
    _currentLanguage = _currentLanguage == Language.english
        ? Language.swahili
        : Language.english;
    Preferences.instance.save(PrefKeys.language, currentLanguage._code);
    notifyListeners();
  }
}
