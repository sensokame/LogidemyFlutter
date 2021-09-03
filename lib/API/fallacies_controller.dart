import 'dart:convert';
import 'package:logidemy/Model/fallacy.dart';
import 'package:logidemy/Model/fallacy_category.dart';
import 'package:logidemy/Values/constants.dart';
import 'package:http/http.dart' as http;

class FallaciesControllers {
  // used at the startup of the app to get the fallacies from the backend
  static Future<List<FallacyCategory>> getAllCategories() async{
    final response = await http.get(
        Uri.parse(
            backendUrl +
                fallaciesBackendUrl +
                fallaciesCategoriesBackendUrl
        ));
    if (response.statusCode == 200 || response.statusCode == 304) {
      // If the server did return a 200 OK response,
      // or 304 cached response
      // then parse the JSON.
      List<FallacyCategory> res = [];
      for (var f in jsonDecode(response.body)){
        res.add(FallacyCategory.fromJson(f));
      }
      return res;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load categories');
    }
  }
  static Future<Fallacy> getFallacy(String key) async{
    final response = await http.get(Uri.parse(backendUrl + fallaciesBackendUrl + key));
    if (response.statusCode == 200 || response.statusCode == 304){
      return Fallacy.fromJson(jsonDecode(response.body));
    } else{
      throw Exception('Failed to get Fallacy (may not exist)');
    }
  }
}
