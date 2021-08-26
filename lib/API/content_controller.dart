import 'dart:convert';

import 'package:logidemy/Model/content.dart';
import 'package:logidemy/Values/constants.dart';
import 'package:http/http.dart' as http;

class ContentController {
  static Future<Content> getContent(String key) async {
    final response = await http.get(
        Uri.parse(backendUrl + contentBackendUrl + key));
    if (response.statusCode == 200 || response.statusCode == 304) {
      return Content.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to get Fallacy (may not exist)');
    }
  }
}