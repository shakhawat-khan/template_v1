import 'package:basic_structure/main.dart';
import 'package:basic_structure/src/db/api_response_db/api_response_db.dart';
import 'package:basic_structure/src/widget/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

Future<String> getFindOfflineResponse({required String url}) async {
  final List<ApiResponseDb> findResponse =
      await isar.apiResponseDbs.filter().titleEqualTo(url).findAll();

  if (findResponse.isEmpty) {
    // SnackBarService.showErrorSnackBar(content: 'no data found');
    return '';
  } else {
    talker.debug(
      findResponse[0].content,
    );
    return findResponse[0].content;
  }
}
