import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:udepcontigo/config/helpers/pokemon_service.dart';

final pokemonIdProvider = StateProvider<int>((ref) {
  return 1;
});

final pokemonNameProvider = FutureProvider<String>((ref) async {
  final id = ref.watch(pokemonIdProvider);
  final name = await PokemonService.getPokemonName(id);
  return name;
});

// final pokemonNameProvider = FutureProvider.family<String, int>((ref,id) async {
//   final name = await PokemonService.getPokemonName( id );
//   return name;
// });

final pokemonSpriteProvider = FutureProvider<String>((ref) async {
  final id = ref.watch(pokemonIdProvider);
  final sprite = await PokemonService.getPokemonSprite(id);
  return sprite;
});

// final pokemonSpriteProvider =
//     FutureProvider.family<String, int>((ref, id) async {
//   final sprite = await PokemonService.getPokemonSprite(id);
//   return sprite;
// });
