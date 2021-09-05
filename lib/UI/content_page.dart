import 'package:flutter/material.dart';
import 'package:logidemy/API/content_controller.dart';
import 'package:logidemy/Model/content.dart';
import 'package:logidemy/Widgets/General/page_title.dart';
import 'package:logidemy/Widgets/General/rounded_picture_widget.dart';

class ContentPage extends StatefulWidget {
  const ContentPage({Key? key, required this.contentKey}) : super(key: key);
  final String contentKey;

  @override
  _ContentState createState() => _ContentState();
}

class _ContentState extends State<ContentPage> {
  late Future<Content> content;
  @override
  void initState() {
    super.initState();
    content = ContentController.getContent(widget.contentKey);
  }

  @override
  Widget build(BuildContext context) {
    var pad = MediaQuery.of(context).size.height * 1.25 / 100;

    return FutureBuilder<Content>(
        future: content,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  // content picture
                  RoundedPictureWidget(picture: snapshot.data!.picture),
                  // pad between picture and title
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, pad, 0, pad),
                  ),
                  // Title
                  PageTitle(snapshot.data!.title),
                  // pad between title and text
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, pad, 0, pad),
                  ),
                  // Text about page
                  Text(
                    snapshot.data!.text,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(height: 1.5, fontSize: 17.5),
                  )
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          // By default, show a loading spinner.
          return const CircularProgressIndicator();
        });
  }
}
