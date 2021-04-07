import 'package:flutter/material.dart';
import 'package:ring_of_fire/components/icon_menu.dart';
import 'package:ring_of_fire/components/rounded_button.dart';
import 'package:ring_of_fire/constants.dart';
import 'package:ring_of_fire/localization/localization_constants.dart';
import 'package:ring_of_fire/screens/game_screen.dart';
import 'package:ring_of_fire/screens/rules_screen.dart';
import 'package:ring_of_fire/screens/language_screen.dart';
import 'package:flutter/services.dart';

class MainScreen extends StatelessWidget {
  static const String id = 'main_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/bg_img.png'),
              fit: BoxFit.cover,
            ),
          ),
          constraints: BoxConstraints.expand(),
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                settingsMenu(context),
                buttons(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget settingsMenu(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: IconMenu([
        getTranslatedText(context, "language_button"),
        getTranslatedText(context, "quit_button")
      ], (String choice) {
        if (choice == getTranslatedText(context, "language_button")) {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return LanguageScreen();
          }));
        } else if (choice == getTranslatedText(context, "quit_button")) {
          //leave the application
          SystemChannels.platform.invokeMethod('SystemNavigator.pop');
        }
      }),
    );
  }

  Widget buttons(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FittedBox(
            //fitted box to make text not overflow
            fit: BoxFit.fitWidth,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                getTranslatedText(context, 'ring_of_fire'),
                style: kTitleText,
              ),
            ),
          ),
          RoundedButton(
            getTranslatedText(context, "new_game_button"),
            () {
              Navigator.pushNamed(context, GameScreen.id);
            },
          ),
          RoundedButton(getTranslatedText(context, "rules_button"), () {
            Navigator.pushNamed(context, RulesScreen.id);
          }),
        ],
      ),
    );
  }
}
