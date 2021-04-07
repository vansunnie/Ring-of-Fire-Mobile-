import 'package:flutter/cupertino.dart';
import 'package:ring_of_fire/localization/localization.dart';
import 'package:shared_preferences/shared_preferences.dart';

String getTranslatedText(BuildContext context, String key) {
  return Localization.of(context).getTranslatedValue(key);
}

//language code
const String ENGLISH = 'en';
const String POLISH = 'pl';
const String PORTUGUESE = 'pt';

const String LANGUAGE_CODE = 'languageCode';

Future<Locale> setLocale(String languageCode) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();

  await _prefs.setString(LANGUAGE_CODE, languageCode);

  return _locale(languageCode);
}

Locale _locale(String languageCode) {
  Locale _temp;

  switch (languageCode) {
    case ENGLISH:
      _temp = Locale(languageCode, 'US');
      break;
    case POLISH:
      _temp = Locale(languageCode, 'PL');
      break;
    case PORTUGUESE:
      _temp = Locale(languageCode, 'PT');
      break;
    default:
      _temp = Locale(ENGLISH, 'US');
  }

  return _temp;
}

Future<Locale> getLocale() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();

  String languageCode = _prefs.getString(LANGUAGE_CODE) ?? 'en';
  return _locale(languageCode);
}

Future<String> getCode() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();

  String languageCode = _prefs.getString(LANGUAGE_CODE) ?? 'en';
  return languageCode;
}
