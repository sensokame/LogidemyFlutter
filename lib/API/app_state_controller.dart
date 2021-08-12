import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logidemy/UI/app_page.dart';
import 'package:stack/stack.dart' as s;

class Content {
  const Content(
      this.content,
      this.context,
      this.title
      );
  final Widget content;
  final BuildContext context;
  final String title;
}

class AppStateController{
  // since app state is a singleton getting the instance is done this way
  static AppState state = AppState();
  static s.Stack<Content> appStack = s.Stack();
  static void setAppContent(Widget content, BuildContext context, String title, bool fromDrawer, {bool addToStack = true}){
    // push the old state onto the app stack
    if (addToStack){
      if (appStack.isEmpty ||  !(appStack.top().content == state.content)){
        appStack.push(Content(state.content, context, state.title));
      }
    }
    state.setContent(content, title);
    if (fromDrawer){
      Navigator.pop(context);
    }
  }
  static void goBack(){
    // if stack is empty, exit application
    if (appStack.isEmpty){
      // will only work on android. let's include this in a FAQ
      SystemNavigator.pop();
    }
    // stack is not empty, so pop the last app content and put it
    var last = appStack.pop();
    // we need to pop navigation
    setAppContent(last.content, last.context, last.title, false, addToStack: false);
  }
}