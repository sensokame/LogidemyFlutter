import 'package:logidemy/Model/fallacy.dart';
import 'package:logidemy/Model/fallacy_category.dart';
import 'package:logidemy/Model/fallacy_key.dart';

class FallaciesControllers {
  // used at the startup of the app to get the fallacies from the backend
  static getAllCategories() {
    // TODO implement backend API calls
    // for now return static mock list
    return [
      const FallacyCategory(
          "logical one",
          [
            FallacyKey("one", "one"),
            FallacyKey("second", "second"),
            FallacyKey("third", "third")
          ]
      ),
      const FallacyCategory(
          "logical two",
          [
            FallacyKey("fourth", "fourth"),
            FallacyKey("fifth", "fifth"),
            FallacyKey("sixth", "sixth")
          ]
      ),
      const FallacyCategory(
          "logical three",
          [
            FallacyKey("seventh", "seventh"),
            FallacyKey("eighth", "eighth"),
            FallacyKey("ninth", "ninth")
          ]
      )
    ];
  }
  static getFallacy(String key){
    // TODO implement API calls to get fallacy by key
    // for now return static fallacy
    return const Fallacy(
        "test",
        "Test Fallacy",
        "Test Category",
        "https://external-preview.redd.it/Mu97csuMHib2P34ma_RyJJLKPBdXEnZJZ2wVBuWUaYI.png?auto=webp&s=26e1a352216a6ade12aa0e37e514d1b545f03058",
        "Test Description, pretend that this is a long ass paragraph",
        "Test Example, pretend that this is an example",
        [
          "sign test 1",
          "test sign 2"
        ]);
  }
}
