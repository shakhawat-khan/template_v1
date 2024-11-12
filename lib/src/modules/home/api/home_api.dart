import 'dart:convert';

import 'package:basic_structure/main.dart';
import 'package:basic_structure/src/db/api_response_db/api_response_db.dart';
import 'package:basic_structure/src/db/api_response_db/api_response_function.dart';
import 'package:basic_structure/src/modules/home/model/home_poem_model.dart';
import 'package:basic_structure/src/modules/home/services/home_services.dart';
import 'package:basic_structure/src/services/api_services.dart';
import 'package:basic_structure/src/url/base_url.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:isar/isar.dart';

Future<PoemModel?> getPoemLines() async {
  bool result = await InternetConnectionChecker().hasConnection;
  const String url = '$poetryDbUrl/title/Ozymandias/lines.json';
  if (result == true) {
    try {
      Response test = await ApiClient().getData(
        url: '$poetryDbUrl/title/Ozymandias/lines.json',
      );

      if (test.statusCode == 200 || test.statusCode == 201) {
        // Parse the response as a List first
        final List<dynamic> jsonList = jsonDecode(test.body);
        // Take the first item from the list
        final Map<String, dynamic> poemJson = jsonList[0];

        /// add data into isar database
        await addOfflineResponse(title: url, isar: isar, content: test.body);

        return PoemModel.fromJson(poemJson);
      }
    } catch (e) {
      talker.error('the error is $e');
    }
  } else {
    /// get data from isar database
    String offlineResponse = await getFindOfflineResponse(url: url);

    final List<dynamic> jsonList = jsonDecode(offlineResponse);
    // Take the first item from the list
    final Map<String, dynamic> poemJson = jsonList[0];

    return PoemModel.fromJson(poemJson);
  }

  return null;
}
