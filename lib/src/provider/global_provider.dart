import 'package:basic_structure/src/routes/app_routes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// The route configuration.
final goRouterProvider = Provider<GoRouter>((ref) {
  return router;
});
