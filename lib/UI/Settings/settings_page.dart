import 'package:flutter/material.dart';
import 'package:logidemy/API/app_state_controller.dart';
import 'package:logidemy/UI/Settings/language_page.dart';
import 'package:logidemy/UI/Settings/themes_page.dart';
import 'package:logidemy/Widgets/Settings/settings_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsPage extends StatelessWidget{
  const SettingsPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return
       Column(
        children: [
          SettingsItem(
              text: AppLocalizations.of(context)!.languageText,
              icon: Icons.language,
              onTap: () => {AppStateController.setAppContent(const LanguagePage(), context, AppLocalizations.of(context)!.languageText, false)}
              ),
          SettingsItem(
            text:AppLocalizations.of(context)!.themeText,
            icon: Icons.brush,
            onTap: () => {AppStateController.setAppContent(const ThemesPage(), context, AppLocalizations.of(context)!.themeText, false)}
          )
        ],
      );
  }

}