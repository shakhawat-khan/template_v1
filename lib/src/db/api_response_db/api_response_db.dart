import 'package:basic_structure/main.dart';
import 'package:isar/isar.dart';

part 'api_response_db.g.dart';

@collection
class ApiResponseDb {
  Id id = Isar.autoIncrement; // Primary key
  late String title;
  late String content;
  // Add any other fields from your API response
}

final apiResponse = isar.collection<ApiResponseDb>();
