import 'package:flutter/material.dart';
import 'package:logidemy/API/app_state_controller.dart';
import 'package:logidemy/API/fallacies_menu_controller.dart';
import 'package:logidemy/Model/fallacy_category.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:logidemy/UI/about_page.dart';
import 'package:logidemy/UI/home_page.dart';
import 'package:logidemy/UI/Settings/settings_page.dart';
import 'package:logidemy/Widgets/General/menu_list_tile.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({
    Key? key,
    required this.fallacies
  }) : super(key: key);
  final List<FallacyCategory> fallacies;
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          // home page
          MenuListTile(
            tileText: AppLocalizations.of(context)!.homeText,
            onTap: () => AppStateController.setAppContent(const HomePage(), context, AppLocalizations.of(context)!.appNameText, true),
          ),
          // fallacies
          MenuListTile(
              tileText : AppLocalizations.of(context)!.fallaciesText,
            children: FallaciesMenuController.getFallacyCategories(widget.fallacies, context),
          ),
          const Divider(),
          // about
          MenuListTile(
            tileText: AppLocalizations.of(context)!.settingsText,
            onTap: () => AppStateController.setAppContent(const SettingsPage(), context, AppLocalizations.of(context)!.settingsText, true),
          ),
          // about
          MenuListTile(
            tileText: AppLocalizations.of(context)!.aboutText,
            onTap: () => AppStateController.setAppContent(const AboutPage(), context, AppLocalizations.of(context)!.aboutText, true),
          )
        ],
      ),
    );
  }
}
