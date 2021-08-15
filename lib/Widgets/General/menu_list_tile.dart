import 'package:flutter/material.dart';
import 'package:logidemy/UI/Settings/settings_page.dart';

class MenuListTile extends StatefulWidget{
  const MenuListTile({
    Key? key,
    required this.tileText,
    this.onTap,
    this.children
  }) : super(key: key);
  final String tileText;
  final List<Widget>? children;
  final void Function()? onTap;

  @override
  _MenuListTileState createState() => _MenuListTileState();
}
class _MenuListTileState extends State<MenuListTile>{
  bool isOpen = false;
  @override
  Widget build(BuildContext context) {
    if (widget.children == null || widget.children!.isEmpty){
      return ListTile(
          title: Text(
              widget.tileText
          ),
          onTap: widget.onTap
      );
    }
    else{
      return ExpansionTile(
        title:
        ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 0.0),
          title: Text(widget.tileText),
          onTap: widget.onTap,
        ),
        trailing: isOpen ? const Icon(Icons.keyboard_arrow_down) : const Icon(Icons.chevron_right),
        children: widget.children!.toList(),
        initiallyExpanded: false,
        onExpansionChanged: (isOpen) {
          this.isOpen = isOpen;
          setState(() {
          });
        },
      );
    }
  }
}