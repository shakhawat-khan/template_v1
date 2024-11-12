import 'package:basic_structure/src/app.dart';
import 'package:basic_structure/src/db/api_response_db/api_response_function.dart';
import 'package:basic_structure/src/db/share_pref/share_pref_db.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:talker_riverpod_logger/talker_riverpod_logger_observer.dart';
import 'package:talker_riverpod_logger/talker_riverpod_logger_settings.dart';

final talker = Talker();
late Isar isar;
late SharedPreferences prefs;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initIsar(); // Initialize Isar here
  await initSharePref();
  runApp(
    ProviderScope(
      observers: [
        TalkerRiverpodObserver(
          talker: talker,
          settings: const TalkerRiverpodLoggerSettings(
            enabled: true,
            printStateFullData: false,
            printProviderAdded: true,
            printProviderUpdated: true,
            printProviderDisposed: true,
            printProviderFailed: true,
          ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}
