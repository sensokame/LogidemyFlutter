import 'package:flutter/material.dart';
import 'package:logidemy/API/app_state_controller.dart';
import 'package:logidemy/API/fallacies_controller.dart';
import 'package:logidemy/API/fallacies_menu_controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:logidemy/Model/fallacy_category.dart';
import 'package:logidemy/UI/about_page.dart';
import 'package:logidemy/UI/home_page.dart';
import 'package:logidemy/UI/Settings/settings_page.dart';
import 'package:logidemy/Widgets/General/menu_list_tile.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({
    Key? key
  }) : super(key: key);
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  late Future<List<FallacyCategory>> categories;
  @override
  void initState(){
    super.initState();
    categories = FallaciesControllers.getAllCategories();
  }
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
          FutureBuilder<List<FallacyCategory>>(
            future: categories,
            builder: (context, snapshot){
              if (snapshot.hasData){
                return MenuListTile(
                    tileText : AppLocalizations.of(context)!.fallaciesText,
                    children: FallaciesMenuController.getFallacyCategories(snapshot.data, context),
                    onTap: FallaciesMenuController.getLogicalFallaciesContent(context)
                );
              }
              else if (snapshot.hasError){
                return Text('${snapshot.error}');
              }
              return const CircularProgressIndicator();
            },
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
