import 'package:basic_structure/main.dart';
import 'package:basic_structure/src/db/api_response_db/api_response_db.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

Future<void> initIsar() async {
  final dir = await getApplicationDocumentsDirectory();
  isar = await Isar.open(
    [ApiResponseDbSchema],
    directory: dir.path,
  );
}

Future<void> addOfflineResponse(
    {required Isar isar,
    required String title,
    required String content}) async {
  final exists =
      await isar.apiResponseDbs.filter().titleEqualTo(title).count() > 0;
  if (!exists) {
    await isar.writeTxn(() async {
      await isar.apiResponseDbs.put(ApiResponseDb()
        ..title = title
        ..content = content); // Initialize the 'content' field here
    });

    talker.debug(
      'URL - $title add response successfully for offline database ',
    );
  }
}
