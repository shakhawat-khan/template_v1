import 'package:basic_structure/src/modules/home/api/home_api.dart';
import 'package:basic_structure/src/modules/home/model/home_poem_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AsyncPoemNotifier extends AsyncNotifier<PoemModel?> {
  Future<PoemModel?> fetchPoem() async {
    final json = await getPoemLines();
    return json;
  }

  @override
  Future<PoemModel?> build() async {
    // Load initial todo list from the remote repository
    return fetchPoem();
  }
}

// Finally, we are using NotifierProvider to allow the UI to interact with
// our TodosNotifier class.
final asyncTodosProvider =
    AsyncNotifierProvider<AsyncPoemNotifier, PoemModel?>(() {
  return AsyncPoemNotifier();
});
