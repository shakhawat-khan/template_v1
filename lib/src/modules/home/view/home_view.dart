import 'package:basic_structure/src/modules/home/api/home_api.dart';
import 'package:flutter/material.dart';

class Home extends  class  extends ConsumerWidget {
  const ({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container();
  }
}{
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return switch (asyncTodos) {
      AsyncData(:final value) => ListView(
          children: [
            for (final todo in value)
              CheckboxListTile(
                value: todo.completed,
                // When tapping on the todo, change its completed status
                onChanged: (value) {
                  ref.read(asyncTodosProvider.notifier).toggle(todo.id);
                },
                title: Text(todo.description),
              ),
          ],
        ),
      AsyncError(:final error) => Text('Error: $error'),
      _ => const Center(child: CircularProgressIndicator()),
    };
  }
  
}
