import 'package:flutter/material.dart';
import 'package:ring_of_fire/constants.dart';
import 'package:ring_of_fire/localization/localization_constants.dart';
import 'package:ring_of_fire/modules/deck.dart';

class RulesScreen extends StatefulWidget {
  static const String id = 'rules_screen';

  @override
  _RulesScreenState createState() => _RulesScreenState();
}

class _RulesScreenState extends State<RulesScreen> {
  Deck deck;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    deck = new Deck(context);
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
              buildListRules(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildListRules() {
    return Expanded(
      child: ListView.builder(
          itemCount: 13,
          itemBuilder: (context, index) {
            final rule = deck.deck[index].rule;
            final card = deck.deck[index].name;

            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: [
                  index == 0
                      ? Padding(
                          padding: EdgeInsets.only(
                            bottom: 10.0,
                          ),
                          child: Text(
                            getTranslatedText(context, "rules_main_text"),
                            style: kRuleText,
                            textAlign: TextAlign.justify,
                          ),
                        )
                      : Text(''),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Padding(
                          padding:
                              EdgeInsets.only(top: 2.0, left: 4.0, right: 10.0),
                          child: Image(
                            alignment: Alignment.centerLeft,
                            image: AssetImage('images/deck/$card.png'),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                top: 4.0,
                              ),
                              child: Text(
                                rule.ruleName,
                                style: kRuleTitleText,
                                textAlign: TextAlign.justify,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: 2.0,
                              ),
                              child: Text(
                                rule.ruleFullDescription,
                                style: kRuleDescriptionText,
                                textAlign: TextAlign.justify,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
    );
  }
}
