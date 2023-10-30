import 'package:flutter/material.dart';
import 'package:pokedex/api/pokeapi.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/widgets/pokemon_card_background.dart';
import 'package:pokedex/widgets/pokemon_card_data.dart';

// Constroi card e decoraÇoes
// Vamos usar esse para fazer a imagem
class PokemonCard extends StatelessWidget {
  const PokemonCard({required this.pokemon, super.key});
  final Pokemon pokemon;

  BoxDecoration getContainerDecoration() => BoxDecoration(
        color: Color.fromARGB(128, 22, 115, 110),
        borderRadius: BorderRadius.circular(7),
        border: Border.all(
          color: Color.fromARGB(255, 121, 170, 80).withOpacity(0.24),
          width: 1,
        ),
      );

  Future<void> getPokemonData() async {
    pokemon.pokemonData = await PokeAPI.getPokemonData(
      pokemon.url,
    );
  }

  void navigateToDetails(BuildContext context) {
    Navigator.pushNamed(
      context,
      '/details',
      arguments: pokemon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(7),
      enableFeedback: true,
      splashColor: Colors.red.shade50,
      onTap: () {
        getPokemonData().then((value) => navigateToDetails(context));
      },
      child: Container(
        padding: const EdgeInsets.all(7),
        decoration: getContainerDecoration(),
        child: Stack(
          children: [
            PokemonCardBackground(id: pokemon.id),
            PokemonCardData(pokemon: pokemon),
          ],
        ),
      ),
    );
  }
}
