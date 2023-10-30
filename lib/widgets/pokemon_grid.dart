// import 'package:flutter/material.dart';
// import 'package:pokedex/models/pokemon.dart';
// import 'package:pokedex/widgets/pokemon_card.dart';

// // Constroi tabela
// class PokemonGrid extends StatefulWidget {
//   const PokemonGrid({required this.pokemonList, super.key});

//   final List<Pokemon> pokemonList;

//   @override
//   State<PokemonGrid> createState() => _PokemonGridState();
// }

// class _PokemonGridState extends State<PokemonGrid> {
//   int _getCrossAxisCount(double width) {
//     if (width > 1000) {
//       return 5;
//     }
//     if (width > 700) {
//       return 4;
//     }
//     if (width > 450) {
//       return 3;
//     }
//     return 2;
//   }

//   @override
//   Widget build(BuildContext context) {
//     var pokemonList = widget.pokemonList;
//     var width = MediaQuery.of(context).size.width;

//     return GridView.count(
//       padding: const EdgeInsets.all(7),
//       crossAxisCount: _getCrossAxisCount(width),
//       crossAxisSpacing: 4,
//       mainAxisSpacing: 4,
//       semanticChildCount: pokemonList.length,
//       childAspectRatio: 200 / 244,
//       physics: const BouncingScrollPhysics(),
//       children: pokemonList
//           .map(
//             (pokemon) => PokemonCard(pokemon: pokemon),
//           )
//           .toList(),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:pokedex/models/pokemon.dart';
// import 'package:pokedex/widgets/pokemon_card.dart';

// // Constroi tabela
// class PokemonGrid extends StatefulWidget {
//   const PokemonGrid({required this.pokemonList, super.key});

//   final List<Pokemon> pokemonList;

//   @override
//   State<PokemonGrid> createState() => _PokemonGridState();
// }

// class _PokemonGridState extends State<PokemonGrid> {
//   int _getCrossAxisCount(double width) {
//     return 1;
//   }

//   @override
//   Widget build(BuildContext context) {
//     var pokemonList = widget.pokemonList;
//     var width = MediaQuery.of(context).size.width;

//     return GridView.count(
//       padding: const EdgeInsets.all(7),
//       crossAxisCount: _getCrossAxisCount(width),
//       crossAxisSpacing: 4,
//       mainAxisSpacing: 4,
//       semanticChildCount: pokemonList.length,
//       childAspectRatio: 200 / 244,
//       physics: const BouncingScrollPhysics(),
//       children: pokemonList
//           .map(
//             (pokemon) => PokemonCard(pokemon: pokemon),
//           )
//           .toList(),
//     );
//   }
// }

// import 'dart:math'; // Importe a biblioteca de matemática para gerar números aleatórios
// import 'package:flutter/material.dart';
// import 'package:pokedex/models/pokemon.dart';
// import 'package:pokedex/widgets/pokemon_card.dart';

// // Constroi tabela
// class PokemonGrid extends StatefulWidget {
//   const PokemonGrid({required this.pokemonList, super.key});

//   final List<Pokemon> pokemonList;

//   @override
//   State<PokemonGrid> createState() => _PokemonGridState();
// }

// class _PokemonGridState extends State<PokemonGrid> {
//   late Pokemon _selectedPokemon; // Pokémon selecionado
//   late List<Pokemon> _randomPokemons; // Lista de Pokémon aleatórios
//   late List<int> _selectedPokemonIds; // Lista de IDs dos Pokémon selecionados

//   @override
//   void initState() {
//     super.initState();
//     _selectedPokemonIds = [];
//     _getRandomPokemons();
//   }

//   // Método para selecionar quatro Pokémon aleatórios da lista fornecida
//   void _getRandomPokemons() {

//     final random = Random();
//     final randomIndex = random.nextInt(widget.pokemonList.length);
//     final randomPokemon = widget.pokemonList[randomIndex];

//     _selectedPokemon = widget.pokemonList[random
//         .nextInt(widget.pokemonList.length)]; // Seleciona um Pokémon aleatório
//     _randomPokemons = [];

//     _selectedPokemonIds.add(randomPokemon.id);
//     _selectedPokemonIds
//         .add(_selectedPokemon.id); // Adiciona o ID do Pokémon selecionado

//     while (_randomPokemons.length < 3) {
//       if (randomPokemon.id != _selectedPokemon.id &&
//           !_randomPokemons.contains(randomPokemon)) {
//         _randomPokemons.add(randomPokemon);
//         _selectedPokemonIds
//             .add(randomPokemon.id); // Adiciona o ID dos outros três Pokémon
//       }
//     }

//     print(
//         "Lista de IDs dos Pokémon: $_selectedPokemonIds"); // Imprime a lista de IDs no terminal
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GridView.count(
//       padding: const EdgeInsets.all(7),
//       crossAxisCount: 1, // Ainda será exibido apenas um Pokémon por linha
//       crossAxisSpacing: 4,
//       mainAxisSpacing: 4,
//       semanticChildCount: 4, // Quatro Pokémon
//       childAspectRatio: 200 / 244,
//       physics: const BouncingScrollPhysics(),
//       children: [
//         Column(
//           children: [
//             // ElevatedButton(
//             //   onPressed: () {
//             //     // Coloque aqui a lógica que você quer executar ao pressionar o botão
//             //   },
//             //   child: Text(_selectedPokemon
//             //       .name), // Exibe o nome do Pokémon selecionado em um botão
//             // ),
//             Image.network(_selectedPokemon
//                 .image), // Exibe a imagem do Pokémon selecionado
//           ],
//         ),
//         for (var pokemon in _randomPokemons)
//           ElevatedButton(
//             onPressed: () {
//               // Coloque aqui a lógica que você quer executar ao pressionar o botão
//             },
//             child: Text(
//                 pokemon.name), // Exibe o nome dos outros três Pokémon em botões
//           ),
//       ],
//     );
//   }
// }

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/widgets/pokemon_card.dart';

class PokemonGrid extends StatefulWidget {
  const PokemonGrid({Key? key, required this.pokemonList}) : super(key: key);

  final List<Pokemon> pokemonList;

  @override
  _PokemonGridState createState() => _PokemonGridState();
}

class _PokemonGridState extends State<PokemonGrid> {
  late Pokemon _selectedPokemon;
  late List<Pokemon> _randomPokemons;

  @override
  void initState() {
    super.initState();
    _getRandomPokemons();
  }

  void _getRandomPokemons() {
    final random = Random();
    final selectedIndexes = <int>{};
    while (selectedIndexes.length < 4) {
      selectedIndexes.add(random.nextInt(widget.pokemonList.length));
    }

    final selectedPokemonIndex = selectedIndexes.first;
    _selectedPokemon = widget.pokemonList[selectedPokemonIndex];
    _randomPokemons = selectedIndexes.skip(1).map((index) {
      return widget.pokemonList[index];
    }).toList();

    _randomPokemons.add(widget.pokemonList[
        selectedPokemonIndex]); // Adiciona o _selectedPokemon aos _randomPokemons

    print("Pokemon IDs: ${[..._randomPokemons.map((pokemon) => pokemon.id)]}");
  }

  @override
  Widget build(BuildContext context) {
    double buttonWidth = MediaQuery.of(context).size.width / 1.1 - 1;
    double buttonheight = MediaQuery.of(context).size.height / 13 -
        1; // Ajuste do tamanho do botão

    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height /
              2, // Tamanho da imagem (metade da tela)
          child: Image.network(_selectedPokemon.image),
        ),
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: Column(
            children: _randomPokemons.map((pokemon) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 7.0),
                child: SizedBox(
                  width: buttonWidth,
                  height: buttonheight,
                  child: ElevatedButton(
                    onPressed: () {
                      // Adicione a lógica aqui para o pressionamento do botão do Pokémon
                    },
                    child: Text(
                      pokemon.name,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}

























































































































































//   // Método para selecionar quatro Pokémon aleatórios da lista fornecida
//   void _getRandomPokemons() {
//     final random = Random();
//     _selectedPokemon = widget.pokemonList[random
//         .nextInt(widget.pokemonList.length)]; // Seleciona um Pokémon aleatório
//     _randomPokemons = [];

//     _selectedPokemonIds
//         .add(_selectedPokemon.id); // Adiciona o ID do Pokémon selecionado
//     while (_randomPokemons.length < 3) {
//       final randomIndex = random.nextInt(widget.pokemonList.length);
//       final randomPokemon = widget.pokemonList[randomIndex];
//       if (randomPokemon.id != _selectedPokemon.id &&
//           !_randomPokemons.contains(randomPokemon)) {
//         _randomPokemons.add(randomPokemon);
//         _selectedPokemonIds
//             .add(randomPokemon.id); // Adiciona o ID dos outros três Pokémon
//       }
//     }

//     print(
//         "Lista de IDs dos Pokémon: $_selectedPokemonIds"); // Imprime a lista de IDs no terminal
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GridView.count(
//       padding: const EdgeInsets.all(7),
//       crossAxisCount: 1, // Ainda será exibido apenas um Pokémon por linha
//       crossAxisSpacing: 4,
//       mainAxisSpacing: 4,
//       semanticChildCount: 4, // Quatro Pokémon
//       childAspectRatio: 200 / 244,
//       physics: const BouncingScrollPhysics(),
//       children: [
//         Column(
//           children: [
//             Image.network(_selectedPokemon
//                 .image), // Exibe a imagem do Pokémon selecionado
//             Text(_selectedPokemon.name), // Exibe o nome do Pokémon selecionado
//             SizedBox(height: 20), // Espaçamento entre a imagem/nome e os botões
//             for (var pokemon in _randomPokemons)
//               SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   onPressed: () {
//                     // Coloque aqui a lógica que você quer executar ao pressionar o botão
//                   },
//                   child: Text(pokemon
//                       .name), // Exibe o nome dos outros três Pokémon em botões
//                 ),
//               ),
//           ],
//         ),
//       ],
//     );
//   }
// }







