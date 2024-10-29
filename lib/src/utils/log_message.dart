import 'dart:developer';

import 'package:flutter/foundation.dart';

logMessage({required String? title, required Object? message}) {
  if (kDebugMode) {
    log('');
    log("-------------------- $title");
    log(message.toString());
    log("xxxxxxxxxxxxxxxxxxxx end");
    log('');
  }
}

logSmall({required Object? message}) {
  if (kDebugMode) {
    log('');
    log("-------------------- start");
    log(message.toString());
    log("xxxxxxxxxxxxxxxxxxxx end");
    log('');
  }
}
