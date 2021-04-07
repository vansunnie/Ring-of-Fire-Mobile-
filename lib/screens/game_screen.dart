import 'package:flutter/material.dart';
import 'package:ring_of_fire/components/icon_menu.dart';
import 'package:ring_of_fire/components/rounded_button.dart';
import 'package:ring_of_fire/constants.dart';
import 'package:ring_of_fire/localization/localization_constants.dart';
import 'package:ring_of_fire/modules/deck.dart';
import 'package:ring_of_fire/screens/rules_screen.dart';
import 'package:ring_of_fire/components/end_game_dialog.dart';

class GameScreen extends StatefulWidget {
  static const String id = 'game_screen';
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  Deck game;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    game = new Deck(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(color: kColorBackground, child: gameBuild()),
      ),
    );
  }

  Widget gameBuild() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: EdgeInsets.only(
              right: 20.0,
              top: 20.0,
            ),
            child: settingsMenu(),
          ),
        ),
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.only(bottom: 20.0),
            child: Container(
              child: game.currentCard == null
                  ? Text('')
                  : Image(
                      image: AssetImage(
                          'images/deck/${game.currentCard.name}.png'),
                    ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: infoButtonContainer(),
        )
      ],
    );
  }

  IconMenu settingsMenu() {
    return IconMenu(
      [
        getTranslatedText(context, "rules_button"),
        getTranslatedText(context, "quit_button"),
      ],
      (String choice) {
        if (choice == getTranslatedText(context, "rules_button")) {
          Navigator.pushNamed(context, RulesScreen.id);
        } else if (choice == getTranslatedText(context, "quit_button")) {
          Navigator.pop(context);
        }
      },
    );
  }

  Widget infoButtonContainer() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 20.0,
      ),
      decoration: BoxDecoration(
        color: kColorCustomRedDark,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              game.currentCard == null ? '' : game.currentCard.rule.ruleName,
              style: kRuleNameGameText,
              textAlign: TextAlign.center,
            ),
          ),
          Text(
            game.currentCard == null
                ? ''
                : game.currentCard.rule.ruleDescription,
            style: kRuleGameText,
            textAlign: TextAlign.justify,
          ),
          RoundedButton(
            getTranslatedText(context, "draw_new_card_button"),
            () {
              setState(() {
                game.pickCard();
              });
              if (game.gameOver == true) {
                showDialog<void>(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) => EndGameDialog(),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
