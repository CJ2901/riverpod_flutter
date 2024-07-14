import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:udepcontigo/config/config.dart';

final randomNameProvider = StateProvider.autoDispose<String>((ref) {
  print('randomName Provider');
  return RandomGenerator.getRandomName();
});
