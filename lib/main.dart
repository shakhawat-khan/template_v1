import 'package:basic_structure/src/app.dart';
import 'package:basic_structure/src/db/api_response_db/api_response_function.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:talker_riverpod_logger/talker_riverpod_logger_observer.dart';
import 'package:talker_riverpod_logger/talker_riverpod_logger_settings.dart';

final talker = Talker();
late Isar isar;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initIsar(); // Initialize Isar here
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
