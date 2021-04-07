import 'package:flutter/material.dart';
import 'package:ring_of_fire/constants.dart';
import 'package:ring_of_fire/localization/localization_constants.dart';
import 'package:ring_of_fire/main.dart';
import 'package:ring_of_fire/modules/language.dart';

class LanguageScreen extends StatefulWidget {
  static const String id = 'language_screen';
  @override
  _LanguageScreenState createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  List<Language> languages;
  Language selectedLanguage;

  @override
  void initState() {
    super.initState();
    languages = Language.languageList();
  }

  setSelectedLanguage(Language language) {
    setState(() {
      selectedLanguage = language;
      _changeLanguage(language);
    });
  }

  void _changeLanguage(Language language) async {
    Locale _temp = await setLocale(language.code);

    RingOfFireApp.setLocale(context, _temp);
  }

  List<Widget> createRadioListLanguages() {
    List<Widget> widgets = [];
    for (Language language in languages) {
      widgets.add(
        RadioListTile(
          value: language,
          groupValue: selectedLanguage,
          title: Text(language.flag),
          subtitle: Text(language.name),
          onChanged: (currentLanguage) {
            print("Current Language ${currentLanguage.name}");
            setSelectedLanguage(currentLanguage);
          },
          selected: selectedLanguage == language,
          activeColor: kColorCustomRed,
        ),
      );
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: kColorBackground,
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: Icon(Icons.keyboard_backspace),
                  color: kColorLight,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Column(
                children: createRadioListLanguages(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
