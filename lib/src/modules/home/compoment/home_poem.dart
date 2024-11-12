import 'package:basic_structure/main.dart';
import 'package:basic_structure/src/modules/home/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:talker_flutter/talker_flutter.dart';

class HomePoem extends ConsumerWidget {
  const HomePoem({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncPoems = ref.watch(asyncPoemProvider);
    return switch (asyncPoems) {
      AsyncData(:final value) => Expanded(
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
        ),
      AsyncError(:final error) => Text('Error: $error'),
      _ => const Center(child: CircularProgressIndicator()),
    };
  }
}
