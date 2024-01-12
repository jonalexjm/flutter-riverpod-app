import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_app/config/config.dart';

part 'future_providers.g.dart';

@Riverpod(keepAlive: true)
Future<String> pokemonName(PokemonNameRef ref) async {
  final pokemonId = ref.watch(pokemonIdProvider);
  final pokemonName = await PokemonInformation.getPokemonName(1);

  ref.onDispose(() {
    //solo funcionaria si no se mantiene vivo con el keepALive
    print('Estamos a punto de eliminar este provider');
  });
  return pokemonName;
}

@Riverpod(keepAlive: true)
class PokemonId extends _$PokemonId {
  @override
  build() => 1;

  void nextPokemon() {
    state = state ?? 1 + 1;
  }
}

//anteriormente llamados family
@Riverpod(keepAlive: true)
Future<String> pokemon(PokemonRef ref, int pokemonId) async {
  final pokemonName = await PokemonInformation.getPokemonName(pokemonId);

  return pokemonName;
}
