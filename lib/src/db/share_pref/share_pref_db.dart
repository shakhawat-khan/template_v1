import 'package:basic_structure/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> initSharePref() async {
  // Obtain shared preferences.
  prefs = await SharedPreferences.getInstance();
}
