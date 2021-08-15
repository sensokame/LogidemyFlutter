import 'package:logidemy/Model/content.dart';

class ContentController{
  static Content getContent(String key){
    // TODO implement API call to get content from backend
    // for now return static content
    return const Content(
        "test_content",
        "Test Content",
        "https://external-preview.redd.it/Mu97csuMHib2P34ma_RyJJLKPBdXEnZJZ2wVBuWUaYI.png?auto=webp&s=26e1a352216a6ade12aa0e37e514d1b545f03058",
        "Let's make this a long ass text, let's give it some chance to reach two lines. \n let's do a line return and write some more shit, oh well, this is could be good enough for now.");
  }
}