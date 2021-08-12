import 'package:logidemy/Model/content.dart';

class ContentController{
  static Content getContent(String key){
    // TODO implement API call to get content from backend
    // for now return static content
    return const Content(
        "test_content",
        "Test Content",
        "Test Url",
        "Let's make this a long ass text, let's give it some chance to reach two lines. \n let's do a line return and write some more shit, oh well, this is could be good enough for now.");
  }
}