import 'package:flutter/material.dart';
import 'package:logidemy/API/content_controller.dart';
import 'package:logidemy/Model/content.dart';
import 'package:logidemy/Widgets/General/rounded_picture_widget.dart';

class ContentPage extends StatefulWidget{
  const ContentPage({
    Key? key,
    required this.contentKey
  }) : super(key: key);
  final String contentKey;

  @override
  _ContentState createState() => _ContentState();
}
class _ContentState extends State<ContentPage>{
  late Future<Content> content;
  @override
  void initState(){
    super.initState();
    content = ContentController.getContent(widget.contentKey);
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Content>(
      future: content,
      builder: (context, snapshot) {
        if (snapshot.hasData){
          return Column(
            children: [
              // Title
              Text(snapshot.data!.title),
              // App logo
              RoundedPictureWidget(picture: snapshot.data!.picture),
              // Text about page
              Text(snapshot.data!.text)
              ],
          );
        }
        else if (snapshot.hasError){
          return Text('${snapshot.error}');
        }
        // By default, show a loading spinner.
        return const CircularProgressIndicator();
      }
    ) ;
  }

}