import 'package:flutter/material.dart';
import 'package:logidemy/Model/fallacy.dart';
import 'package:logidemy/Widgets/Fallacy/action_button.dart';
import 'package:logidemy/Widgets/Fallacy/fallacy_card.dart';
import 'package:logidemy/Widgets/Fallacy/fallacy_card_actions.dart';

class FallacyPage extends StatelessWidget {
  const FallacyPage({
    Key? key,
    required this.fallacy,
  }) : super(key: key);
  final Fallacy fallacy;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FallacyCard(
        fallacy: fallacy,
        ),
      floatingActionButton: const FallacyCardActions(
        distance: 112.0,
        children: [
          ActionButton(
            // share
            //onPressed: () => _showAction(context, 0),
            icon: Icon(Icons.share),
          ),
          ActionButton(
            // show signs page
            //onPressed: () => _showAction(context, 1),
            icon: Icon(Icons.menu_book_rounded),
          )
        ],
      ),
    );
  }
}
