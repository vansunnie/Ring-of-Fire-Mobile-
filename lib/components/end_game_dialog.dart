import 'package:flutter/material.dart';
import 'package:ring_of_fire/constants.dart';
import 'package:ring_of_fire/localization/localization_constants.dart';

class EndGameDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        getTranslatedText(context, "game_over_dialog_title"),
        style: kRuleNameGameText,
      ),
      content: Text(
        getTranslatedText(context, "game_over_dialog_description"),
        style: kRuleGameText,
        textAlign: TextAlign.justify,
      ),
      actions: [
        FlatButton(
          textColor: kColorLight,
          onPressed: () {
            Navigator.pop(context);
            Navigator.pop(context);
          },
          child: Text(
            getTranslatedText(context, "quit_button"),
            style: kRuleText,
          ),
        ),
      ],
    );
  }
}
