import 'package:flutter/material.dart';
import 'package:logidemy/Widgets/Settings/theme_card.dart';
import 'package:logidemy/theme/config.dart';
import 'package:logidemy/theme/custom_themes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ThemesPage extends StatefulWidget {
  const ThemesPage({Key? key}) : super(key: key);

  @override
  _ThemePageState createState() => _ThemePageState();
}

class _ThemePageState extends State<ThemesPage> {
  ThemeMode? theme = currentTheme.currentTheme;

  void setTheme(ThemeMode? theme){
    setState(() {
      this.theme = theme;
    });
    currentTheme.toggleTheme(theme);
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
            child: Column(
          children: [
            ThemeCard(theme: CustomTheme.lightTheme),
            ListTile(
              title: Text(AppLocalizations.of(context)!.lightThemeText),
              leading: Radio<ThemeMode>(
                  value: ThemeMode.light,
                  groupValue: theme,
                  onChanged: (val) => setTheme(val)
              ),
            )
          ],
        )),
        Flexible(
            child: Column(
          children: [
            ThemeCard(theme: CustomTheme.darkTheme),
            ListTile(
              title: Text(AppLocalizations.of(context)!.darkThemeText),
              leading: Radio<ThemeMode>(
                  value: ThemeMode.dark,
                  groupValue: theme,
                  onChanged: (val) => setTheme(val)
              ),
            )
          ],
        ))
      ],
    );
  }
}
