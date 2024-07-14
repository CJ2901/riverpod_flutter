import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:udepcontigo/presentation/screens/providers/providers.dart';

class PokemonScreen extends ConsumerWidget {
  const PokemonScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pokemonId = ref.watch(pokemonIdProvider);
    final pokemonAsync = ref.watch(pokemonNameProvider);
    final pokemonSpriteAsync = ref.watch(pokemonSpriteProvider);
    // final pokemonAsync = ref.watch(pokemonNameProvider(pokemonId));
    // final pokemonSpriteAsync = ref.watch(pokemonSpriteProvider(pokemonId));

    return Scaffold(
        appBar: AppBar(title: Text('Pokemon id: $pokemonId')),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: pokemonSpriteAsync.when(
                    data: (value) => Image.network(value,scale: 1),
                    error: (error, stackTrace) => Text('Error: $error'),
                    loading: () => const CircularProgressIndicator()
              ),
            ),
            Center(
              child: pokemonAsync.when(
                  data: (value) => Text(value),
                  error: (error, stackTrace) => Text('Error: $error'),
                  loading: () => const CircularProgressIndicator()),
            ),
          ],
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
                heroTag: "increment",
                child: const Icon(Icons.plus_one),
                onPressed: () {
                  ref.read(pokemonIdProvider.notifier).update((state) => state + 1);
                }),
            const SizedBox(height: 10),
            FloatingActionButton(
                heroTag: "decrement",
                child: const Icon(Icons.exposure_minus_1_outlined),
                onPressed: () {
                  ref.read(pokemonIdProvider.notifier).update((state) => state - 1);
                })
          ],
        ));
  }
}
