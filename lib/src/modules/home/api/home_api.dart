import 'dart:convert';

import 'package:basic_structure/src/modules/home/model/home_poem_model.dart';
import 'package:basic_structure/src/services/request_services.dart';
import 'package:basic_structure/src/url/base_url.dart';
import 'package:basic_structure/src/utils/log_message.dart';

Future<PoemModel?> getPoemLines() async {
  try {
    var test = await ApiClient().getData(
      url: '$poetryDbUrl/title/Ozymandias/lines.json',
    );

    if (test.statusCode == 200 || test.statusCode == 201) {
      return PoemModel.fromJson(jsonDecode(test.body));
    }

    PoemModel.fromJson(jsonDecode(test.body));
  } catch (e) {
    logSmall(message: 'the error is $e');
  }
  return null;
}
