import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:logidemy/API/app_state_controller.dart';
import 'package:logidemy/Model/fallacy_category.dart';
import 'package:logidemy/Widgets/General/app_drawer.dart';

import 'home_page.dart';

class AppPage extends StatefulWidget{
  const AppPage({
    Key? key,
    required this.fallacies
  }) : super (key : key);
  final List<FallacyCategory> fallacies;
  @override
  AppState createState() => AppState();
}
class AppState extends State<AppPage>{
  // https://stackoverflow.com/questions/12649573/how-do-you-build-a-singleton-in-dart
  static final AppState _instance = AppState._internal();
  factory AppState(){
    return _instance;
  }
  AppState._internal();
  Widget content = const HomePage();
  String title = "Logidemy";
  void setContent(Widget content, String title){
    setState(() {
      this.content = content;
      this.title = title;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(fallacies: widget.fallacies),
      body: content,
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => AppStateController.goBack()
        ),
        title: Text(title),
      ),
    );
  }

}