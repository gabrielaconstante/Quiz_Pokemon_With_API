import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/models/pokemon_data.dart';
import 'package:pokedex/services/api.dart';
import 'package:pokedex/utils/constants.dart';

class PokeAPI {
  static Future<PokemonData> getPokemonData(String pokemonUrl) async {
    final jsonData = await Api.getData(pokemonUrl);

    return PokemonData.fromJson(jsonData);
  }

  static Future<List<Pokemon>> getPokemonList({int? limit, int? offset}) async {
    //Limita a quantidade de pokemons que irão retornar, no caso, 150
    limit ??= 150;
    offset ??= 0;

    final jsonData =
        await Api.getData('$pokeApiUrl?limit=$limit&offset=$offset');

    final List<Pokemon> pokemonList = [];

    for (var item in jsonData['results']) {
      final pokemon = Pokemon.fromJson(item);
      pokemonList.add(pokemon);
    }

    return pokemonList;
  }
}
