import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/utils/string_extension.dart';

//  Pega imagem e nome do pokemon
class PokemonCardData extends StatelessWidget {
  const PokemonCardData({required this.pokemon, super.key});

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Image.network(
              pokemon.image,
              fit: BoxFit.contain,
              alignment: Alignment.bottomRight,
            ),
          ),
        ),
        const Divider(),
        Text(
          pokemon.name.capitalize(),
          style: const TextStyle(
            fontSize: 21,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}
