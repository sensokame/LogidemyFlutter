import 'package:flutter/material.dart';

class LanguageItem extends StatefulWidget{
  const LanguageItem({Key? key,  required this.language, this.onTap}) : super(key: key);
  final String language;
  final void Function()? onTap;
  @override
  _LanguageItemState createState() => _LanguageItemState();
}
class _LanguageItemState extends State<LanguageItem>{
  bool selected = false;
  void toggleSelected(bool value){
    setState((){
      selected = value;
    });
  }
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.language),
      onTap: widget.onTap,
    );
  }

}