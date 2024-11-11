import 'dart:convert';

import 'package:basic_structure/main.dart';
import 'package:basic_structure/src/db/api_response_db/api_response_db.dart';
import 'package:basic_structure/src/db/api_response_db/api_response_function.dart';
import 'package:basic_structure/src/modules/home/model/home_poem_model.dart';
import 'package:basic_structure/src/services/api_services.dart';
import 'package:basic_structure/src/url/base_url.dart';
import 'package:http/http.dart';

Future<PoemModel?> getPoemLines() async {
  try {
    const String url = '$poetryDbUrl/title/Ozymandias/lines.json';
    Response test = await ApiClient().getData(
      url: '$poetryDbUrl/title/Ozymandias/lines.json',
    );

    if (test.statusCode == 200 || test.statusCode == 201) {
      // Parse the response as a List first
      final List<dynamic> jsonList = jsonDecode(test.body);
      // Take the first item from the list
      final Map<String, dynamic> poemJson = jsonList[0];

      await addOfflineResponse(title: url, isar: isar, content: test.body);

      return PoemModel.fromJson(poemJson);
    }
  } catch (e) {
    talker.error('the error is $e');
  }
  return null;
}
