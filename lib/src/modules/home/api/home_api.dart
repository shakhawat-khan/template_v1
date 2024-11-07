import 'dart:convert';

import 'package:basic_structure/src/modules/home/model/home_poem_model.dart';
import 'package:basic_structure/src/services/api_services.dart';
import 'package:basic_structure/src/url/base_url.dart';

Future<PoemModel?> getPoemLines() async {
  try {
    var test = await ApiClient().getData(
      url: '$poetryDbUrl/title/Ozymandias/lines.json',
    );

    if (test.statusCode == 200 || test.statusCode == 201) {
      // Parse the response as a List first
      final List<dynamic> jsonList = jsonDecode(test.body);
      // Take the first item from the list
      final Map<String, dynamic> poemJson = jsonList[0];
      return PoemModel.fromJson(poemJson);
    }
  } catch (e) {}
  return null;
}
