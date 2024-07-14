import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:udepcontigo/presentation/screens/providers/providers.dart';

class StreamScreen extends ConsumerWidget {
  const StreamScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final randomName$ = ref.watch(nameStreamProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream Screen'),
      ),
      body:  randomName$.when(
        data: (data) => Center(
          child: Text(data)
        ), 
        error: (error, stackTrace) => Text('Error: $error'), 
        loading: () => const Center(child: CircularProgressIndicator())
      ),
    );
  }
}
