import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:udepcontigo/config/config.dart';

final nameStreamProvider = StreamProvider.autoDispose<String>((ref) async* {
  await for (final name in RandomGenerator.randomNamesStream()) {
    yield name;
  }
});
// final nameStreamProvider = StreamProvider<List<String>>((ref) async* {
//   yield [];
//   await Future.delayed(const Duration(seconds: 2));
//   yield ['Christian'];
//   await Future.delayed(const Duration(seconds: 2));
//   yield ['Christian', 'Pikachu'];
//   await Future.delayed(const Duration(seconds: 2));
//   yield ['Christian', 'Pikachu', 'Bulbasaur'];
// });
