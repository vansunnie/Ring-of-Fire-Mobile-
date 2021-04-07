import 'package:flutter/material.dart';
import 'package:ring_of_fire/localization/localization_constants.dart';
import 'package:ring_of_fire/modules/rule.dart';

class RulesData {
  final BuildContext context;
  List<Rule> rules = List<Rule>();

  RulesData(this.context) {
    rules = [
      //1
      Rule(
        getTranslatedText(context, "ace_rule_title"),
        getTranslatedText(context, "ace_rule_description"),
        getTranslatedText(context, "ace_rule_full_description"),
      ),
      //2
      Rule(
        getTranslatedText(context, "2_rule_title"),
        getTranslatedText(context, "2_rule_description"),
        getTranslatedText(context, "2_rule_full_description"),
      ),
      //3
      Rule(
        getTranslatedText(context, "3_rule_title"),
        getTranslatedText(context, "3_rule_description"),
        getTranslatedText(context, "3_rule_full_description"),
      ),
      //4
      Rule(
        getTranslatedText(context, "4_rule_title"),
        getTranslatedText(context, "4_rule_description"),
        getTranslatedText(context, "4_rule_full_description"),
      ),
      //5
      Rule(
        getTranslatedText(context, "5_rule_title"),
        getTranslatedText(context, "5_rule_description"),
        getTranslatedText(context, "5_rule_full_description"),
      ),
      //6
      Rule(
        getTranslatedText(context, "6_rule_title"),
        getTranslatedText(context, "6_rule_description"),
        getTranslatedText(context, "6_rule_full_description"),
      ),
      //7
      Rule(
        getTranslatedText(context, "7_rule_title"),
        getTranslatedText(context, "7_rule_description"),
        getTranslatedText(context, "7_rule_full_description"),
      ),
      //8
      Rule(
        getTranslatedText(context, "8_rule_title"),
        getTranslatedText(context, "8_rule_description"),
        getTranslatedText(context, "8_rule_full_description"),
      ),

      //9
      Rule(
        getTranslatedText(context, "9_rule_title"),
        getTranslatedText(context, "9_rule_description"),
        getTranslatedText(context, "9_rule_full_description"),
      ),

      //10
      Rule(
        getTranslatedText(context, "10_rule_title"),
        getTranslatedText(context, "10_rule_description"),
        getTranslatedText(context, "10_rule_full_description"),
      ),
      //Jack
      Rule(
        getTranslatedText(context, "jack_rule_title"),
        getTranslatedText(context, "jack_rule_description"),
        getTranslatedText(context, "jack_rule_full_description"),
      ),
      //Queen
      Rule(
        getTranslatedText(context, "queen_rule_title"),
        getTranslatedText(context, "queen_rule_description"),
        getTranslatedText(context, "queen_rule_full_description"),
      ),
      //king
      Rule(
        getTranslatedText(context, "king_rule_title"),
        getTranslatedText(context, "king_rule_description"),
        getTranslatedText(context, "king_rule_full_description"),
      ),
    ];
  }

  Rule getRule(int n) {
    return rules[n];
  }
}
