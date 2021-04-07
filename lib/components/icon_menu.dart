import 'package:flutter/material.dart';

class IconMenu extends StatelessWidget {
  final List<String> menuItems;
  final Function menuItemsFunctions;

  IconMenu(this.menuItems, this.menuItemsFunctions);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: Icon(Icons.settings),
      onSelected: menuItemsFunctions,
      itemBuilder: (BuildContext context) {
        return menuItems.map((String choice) {
          return PopupMenuItem<String>(
            value: choice,
            child: Text(choice),
          );
        }).toList();
      },
    );
  }
}
