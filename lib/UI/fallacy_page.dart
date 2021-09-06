import 'package:flutter/material.dart';
import 'package:logidemy/API/fallacies_controller.dart';
import 'package:logidemy/API/fallacy_actions_controller.dart';
import 'package:logidemy/Model/fallacy.dart';
import 'package:logidemy/Widgets/Fallacy/action_button.dart';
import 'package:logidemy/Widgets/Fallacy/fallacy_card.dart';
import 'package:logidemy/Widgets/Fallacy/fallacy_card_actions.dart';

class FallacyPage extends StatefulWidget {
  const FallacyPage({
    Key? key,
    required this.fallacyKey,
  }) : super(key: key);
  final String fallacyKey;
  @override
  _FallacyPageState createState() => _FallacyPageState();
}

class _FallacyPageState extends State<FallacyPage> {
  late Future<Fallacy> fallacy;
  @override
  void initState() {
    super.initState();
    fallacy = FallaciesControllers.getFallacy(widget.fallacyKey);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Fallacy>(
      future: fallacy,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return getFallacyPage(snapshot.data);
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return const CircularProgressIndicator();
      },
    );
  }
  Widget getFallacyPage(Fallacy? fallacy){
    return Scaffold(
      body: FallacyCard(
        fallacy: fallacy,
      ),
      floatingActionButton: FallacyCardActions(
        distance: 112.0,
        children: [
          ActionButton(
            // share
            onPressed: () => FallacyActionsController.shareFallacy(fallacy),
            icon: Icon(
              Icons.share,
              color: Theme.of(context).colorScheme.surface,
            ),
          ),
          ActionButton(
            // show signs page
            onPressed: () => FallacyActionsController.showSigns(context, fallacy!.signs),
            icon: Icon(
                Icons.menu_book_rounded,
                color: Theme.of(context).colorScheme.surface,
            ),
          )
        ],
      ),
    );
  }

}
