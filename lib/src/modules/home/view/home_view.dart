import 'package:basic_structure/main.dart';
import 'package:basic_structure/src/modules/home/compoment/home_poem.dart';
import 'package:basic_structure/src/modules/home/provider/home_provider.dart';
import 'package:basic_structure/src/provider/global_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:talker_flutter/talker_flutter.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(themeProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Demo API'),
        actions: [
          IconButton(
            icon: Icon(
              ref.read(themeProvider) == false
                  ? Icons.dark_mode
                  : Icons.light_mode,
            ),
            onPressed: () async {
              ref.read(themeProvider.notifier).state = !isDarkMode;

              await prefs.setBool('theme', ref.read(themeProvider));
            },
          ),
        ],
      ),
      body: const Column(
        children: [HomePoem()],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => TalkerScreen(talker: talker),
            ),
          );
        },
        child: const Icon(Icons.bug_report),
      ),
    );
  }
}
