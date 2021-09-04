import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:logidemy/API/app_state_controller.dart';
import 'package:logidemy/Widgets/General/app_drawer.dart';

import 'home_page.dart';

class AppPage extends StatefulWidget{
  const AppPage({
    Key? key,
  }) : super (key : key);
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
    // keep 10% off the top and bot and 5 % of left and right
    var screen = MediaQuery.of(context).size;
    var leftRight = screen.width * 2.5 / 100;
    var topBot = screen.height * 5 / 100;
    return Scaffold(
      drawer: const AppDrawer(),
      body: Container(
        padding: EdgeInsets.fromLTRB(leftRight, topBot, leftRight, topBot),
        child: content
      ),
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => AppStateController.goBack()
        ),
        title: Text(title),
      ),
    );
  }

}