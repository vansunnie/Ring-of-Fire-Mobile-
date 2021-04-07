import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:ring_of_fire/modules/card_deck.dart';
import 'package:ring_of_fire/modules/rules_data.dart';

class Deck {
  BuildContext context;
  RulesData rulesData;
  List<CardDeck> deck = List<CardDeck>();
  CardDeck currentCard;
  int trackKing;
  bool gameOver;
  List<CardDeck> newDeck = List<CardDeck>();

  Deck(this.context) {
    rulesData = new RulesData(context);
    newDeck.clear();
    trackKing = 0;

    deck = [
      CardDeck('ace_hearts', rulesData.getRule(0)),
      CardDeck('2_hearts', rulesData.getRule(1)),
      CardDeck('3_hearts', rulesData.getRule(2)),
      CardDeck('4_hearts', rulesData.getRule(3)),
      CardDeck('5_hearts', rulesData.getRule(4)),
      CardDeck('6_hearts', rulesData.getRule(5)),
      CardDeck('7_hearts', rulesData.getRule(6)),
      CardDeck('8_hearts', rulesData.getRule(7)),
      CardDeck('9_hearts', rulesData.getRule(8)),
      CardDeck('10_hearts', rulesData.getRule(9)),
      CardDeck('jack_hearts', rulesData.getRule(10)),
      CardDeck('queen_hearts', rulesData.getRule(11)),
      CardDeck('king_hearts', rulesData.getRule(12)),
      CardDeck('ace_clubs', rulesData.getRule(0)),
      CardDeck('2_clubs', rulesData.getRule(1)),
      CardDeck('3_clubs', rulesData.getRule(2)),
      CardDeck('4_clubs', rulesData.getRule(3)),
      CardDeck('5_clubs', rulesData.getRule(4)),
      CardDeck('6_clubs', rulesData.getRule(5)),
      CardDeck('7_clubs', rulesData.getRule(6)),
      CardDeck('8_clubs', rulesData.getRule(7)),
      CardDeck('9_clubs', rulesData.getRule(8)),
      CardDeck('10_clubs', rulesData.getRule(9)),
      CardDeck('jack_clubs', rulesData.getRule(10)),
      CardDeck('queen_clubs', rulesData.getRule(11)),
      CardDeck('king_clubs', rulesData.getRule(12)),
      CardDeck('ace_spades', rulesData.getRule(0)),
      CardDeck('2_spades', rulesData.getRule(1)),
      CardDeck('3_spades', rulesData.getRule(2)),
      CardDeck('4_spades', rulesData.getRule(3)),
      CardDeck('5_spades', rulesData.getRule(4)),
      CardDeck('6_spades', rulesData.getRule(5)),
      CardDeck('7_spades', rulesData.getRule(6)),
      CardDeck('8_spades', rulesData.getRule(7)),
      CardDeck('9_spades', rulesData.getRule(8)),
      CardDeck('10_spades', rulesData.getRule(9)),
      CardDeck('jack_spades', rulesData.getRule(10)),
      CardDeck('queen_spades', rulesData.getRule(11)),
      CardDeck('king_spades', rulesData.getRule(12)),
      CardDeck('ace_diamonds', rulesData.getRule(0)),
      CardDeck('2_diamonds', rulesData.getRule(1)),
      CardDeck('3_diamonds', rulesData.getRule(2)),
      CardDeck('4_diamonds', rulesData.getRule(3)),
      CardDeck('5_diamonds', rulesData.getRule(4)),
      CardDeck('6_diamonds', rulesData.getRule(5)),
      CardDeck('7_diamonds', rulesData.getRule(6)),
      CardDeck('8_diamonds', rulesData.getRule(7)),
      CardDeck('9_diamonds', rulesData.getRule(8)),
      CardDeck('10_diamonds', rulesData.getRule(9)),
      CardDeck('jack_diamonds', rulesData.getRule(10)),
      CardDeck('queen_diamonds', rulesData.getRule(11)),
      CardDeck('king_diamonds', rulesData.getRule(12)),
    ];

    startNewDeck();
    gameOver = false;
    currentCard = null;
  }

  void startNewDeck() {
    newDeck = deck;
  }

  void pickCard() {
    Random random = new Random();
    int size = newDeck.length;
    int num = random.nextInt(size);
    currentCard = newDeck[num];
    if (currentCard.name == 'king_diamonds' ||
        currentCard.name == 'king_hearts' ||
        currentCard.name == 'king_spades' ||
        currentCard.name == 'king_clubs') {
      trackKing += 1;
      if (trackKing >= 4) {
        gameOver = true;
      }
    }
    removeCardFromDeck(num);
  }

  void removeCardFromDeck(int pos) {
    newDeck.removeAt(pos);
  }
}
