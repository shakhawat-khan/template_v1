import 'package:basic_structure/main.dart';
import 'package:basic_structure/src/routes/app_routes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

/// The route configuration.
final goRouterProvider = Provider<GoRouter>((ref) {
  return router;
});

final themeProvider = StateProvider<bool>((ref) {
  if (prefs.getBool('theme') != null) {
    return prefs.getBool('theme')!;
  } else {
    return true;
  }
});
