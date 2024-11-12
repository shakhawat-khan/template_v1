import 'package:basic_structure/main.dart';
import 'package:basic_structure/src/modules/home/compoment/home_poem.dart';
import 'package:basic_structure/src/modules/home/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:talker_flutter/talker_flutter.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Demo API'),
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
