import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:ring_of_fire/constants.dart';
import 'package:ring_of_fire/localization/localization.dart';
import 'package:ring_of_fire/localization/localization_constants.dart';
import 'package:ring_of_fire/screens/game_screen.dart';
import 'package:ring_of_fire/screens/language_screen.dart';
import 'package:ring_of_fire/screens/main_screen.dart';
import 'package:flutter/services.dart';
import 'package:ring_of_fire/screens/rules_screen.dart';

void main() {
  runApp(RingOfFireApp());
}

class RingOfFireApp extends StatefulWidget {
  //set language of app
  static void setLocale(BuildContext context, Locale locale) {
    _RingOfFireAppState state =
        context.findAncestorStateOfType<_RingOfFireAppState>();

    state.setLocale(locale);
  }

  @override
  _RingOfFireAppState createState() => _RingOfFireAppState();
}

class _RingOfFireAppState extends State<RingOfFireApp> {
  Locale _locale;

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  //get current app language
  @override
  void didChangeDependencies() {
    getLocale().then((locale) {
      setState(() {
        this._locale = locale;
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    //remove bottom nav bar from device --> full screen
    SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    if (_locale == null) {
      return Container(
        child: Center(
          child: CircularProgressIndicator(
            backgroundColor: kColorBackground,
            strokeWidth: 10.0,
          ),
        ),
      );
    } else {
      return MaterialApp(
        theme: ThemeData.dark(),
        locale: _locale,
        localizationsDelegates: [
          Localization.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          //supported languages
          const Locale('en', 'US'),
          const Locale('pl', 'PL'),
          const Locale('pt', 'PT'),
        ],
        localeResolutionCallback: (locale, supportedLocales) {
          for (var supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == locale.languageCode &&
                supportedLocale.countryCode == locale.countryCode) {
              return supportedLocale;
            }
          }
          return supportedLocales.first;
        },
        initialRoute: MainScreen.id,
        routes: {
          MainScreen.id: (context) => MainScreen(),
          GameScreen.id: (context) => GameScreen(),
          RulesScreen.id: (context) => RulesScreen(),
          LanguageScreen.id: (context) => LanguageScreen(),
        },
      );
    }
  }
}
