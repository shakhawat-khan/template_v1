import 'package:basic_structure/src/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:talker_http_logger/talker_http_logger.dart';
import 'package:talker_riverpod_logger/talker_riverpod_logger_observer.dart';
import 'package:talker_riverpod_logger/talker_riverpod_logger_settings.dart';

final talker = Talker();
void main() {
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
