import 'package:flutter/material.dart';
import 'package:logidemy/API/fallacies_controller.dart';
import 'package:logidemy/Model/fallacy_category.dart';
import 'package:logidemy/Model/fallacy_key.dart';
import 'package:logidemy/UI/content_page.dart';
import 'package:logidemy/UI/fallacy_page.dart';
import 'package:logidemy/Widgets/General/menu_list_tile.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'app_state_controller.dart';
import 'content_controller.dart';

class FallaciesMenuController{
  static List<Widget> getFallacyCategories(List<FallacyCategory> fallacies, BuildContext context) {
    var children = <Widget>[];
    for (var fallacy in fallacies) {
      children.add(createFallacyCategory(fallacy, context));
    }
    return children;
  }

  static Widget createFallacyCategory(FallacyCategory fallacy, BuildContext context) {
    var fallacyContent = ContentController.getContent(fallacy.category);
    return MenuListTile(
        tileText: fallacy.category,
        children: getFallaciesFromCategory(fallacy.fallacies, context),
        onTap: () => AppStateController.setAppContent(
          ContentPage(
            title: fallacyContent.title,
            pictureUrl: fallacyContent.picture,
            content: fallacyContent.text
          ),
          context,
          AppLocalizations.of(context)!.fallaciesText,
          true
        ),
    );
  }
  static List<Widget> getFallaciesFromCategory(Iterable<FallacyKey> fallacies, BuildContext context){
    var children = <Widget>[];
    for (var f in fallacies){
      children.add(MenuListTile(
        tileText: f.name,
        onTap: () => AppStateController.setAppContent(
            FallacyPage(
              fallacy: FallaciesControllers.getFallacy(f.key),
            ),
            context,
            AppLocalizations.of(context)!.fallaciesText,
          true
        )
      ));
    }
    return children;
  }
}