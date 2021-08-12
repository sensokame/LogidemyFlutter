import 'package:flutter/material.dart';

class RoundedPictureWidget extends StatefulWidget {
  const RoundedPictureWidget({
    Key? key,
    required this.picture
  }) : super(key: key);
  final String picture;
  @override
  _RoundedPictureWidgetState createState() => _RoundedPictureWidgetState();
}

class _RoundedPictureWidgetState extends State<RoundedPictureWidget> {
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      key: UniqueKey(),
      backgroundImage: NetworkImage(widget.picture),
    );
  }
}
