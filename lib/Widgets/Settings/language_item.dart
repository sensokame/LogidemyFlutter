import 'package:flutter/material.dart';

class LanguageItem extends StatefulWidget{
  const LanguageItem({Key? key,  required this.language, this.onTap, required this.selected}) : super(key: key);
  final String language;
  final void Function()? onTap;
  final bool selected;
  @override
  _LanguageItemState createState() => _LanguageItemState();
}
class _LanguageItemState extends State<LanguageItem>{
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.language),
      onTap: widget.onTap,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0)
      ),
      trailing: widget.selected? const Icon(Icons.check) : const Icon(null),
    );
  }

}