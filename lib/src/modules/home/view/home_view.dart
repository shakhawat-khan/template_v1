import 'package:basic_structure/main.dart';
import 'package:basic_structure/src/modules/home/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:talker_flutter/talker_flutter.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncPoems = ref.watch(asyncPoemProvider);
    return switch (asyncPoems) {
      AsyncData(:final value) => Scaffold(
          appBar: AppBar(
            title: const Text(
              'Demo Api call',
            ),
          ),
          body: Column(
            children: [
              Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return Text(
                        value.lines[index],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const Divider(
                        color: Colors.grey,
                      );
                    },
                    itemCount: value!.lines.length),
              )
            ],
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
        ),
      AsyncError(:final error) => Text('Error: $error'),
      _ => const Center(child: CircularProgressIndicator()),
    };
  }
}
