import 'package:flutter/material.dart';

class MenuListTile extends StatelessWidget{
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
  Widget build(BuildContext context) {
    if (children == null || children!.isEmpty){
      return ListTile(
        title: Text(
            tileText
        ),
        onTap: onTap
      );
    }
    else{
      return ExpansionTile(
        leading: IconButton(
          icon: const Icon(Icons.info),
          onPressed: onTap,
        ),
          title: Text(
              tileText
          ),
          children: children!.toList()
      );
    }
  }
}