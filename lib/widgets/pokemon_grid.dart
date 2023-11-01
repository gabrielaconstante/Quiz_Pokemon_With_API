import 'dart:math';
import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon.dart';

class PokemonGrid extends StatefulWidget {
  const PokemonGrid({Key? key, required this.pokemonList}) : super(key: key);

  final List<Pokemon> pokemonList;

  @override
  _PokemonGridState createState() => _PokemonGridState();
}

class _PokemonGridState extends State<PokemonGrid> {
  late Pokemon _selectedPokemon;
  List<Pokemon> _randomPokemons = [];
  int _correctAnswers = 0;
  int _wrongAnswers = 0;
  int _totalAnswers = 0;

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
    _randomPokemons = selectedIndexes.map((index) {
      return widget.pokemonList[index];
    }).toList();
    _randomPokemons.shuffle(); // Embaralha a lista de Pokémon

    setState(() {});

    print("Pokemon IDs: ${[..._randomPokemons.map((pokemon) => pokemon.id)]}");
  }

  void onPokemonButtonPressed(Pokemon pokemon) {
    if (_totalAnswers < 10) {
      _totalAnswers++;

      if (pokemon == _selectedPokemon) {
        _correctAnswers++;
        _showResultDialogOnetoOne(true);
      } else {
        _wrongAnswers++;
        _showResultDialogOnetoOne(false);
      }

      if (_totalAnswers == 10) {
        _showResultDialog();
      } else {
        _getRandomPokemons();
      }
    }
  }

  void _showResultDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Resultado do Quiz'),
          content: Text(
              'Você acertou $_correctAnswers de 10.\nRespostas corretas: $_correctAnswers\nRespostas erradas: $_wrongAnswers'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                _restartQuiz();
                Navigator.of(context).pop();
              },
              child: Text('Reiniciar Quiz'),
            ),
          ],
        );
      },
    );
  }

  void _showResultDialogOnetoOne(bool isCorrect) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(isCorrect ? 'Resposta Correta!' : 'Resposta Incorreta!'),
          content: Text(
              isCorrect ? 'Você acertou!' : 'Você errou. Tente novamente.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Fechar'),
            ),
          ],
        );
      },
    );
  }

  void _restartQuiz() {
    _correctAnswers = 0;
    _wrongAnswers = 0;
    _totalAnswers = 0;
    _getRandomPokemons();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Acertos: $_correctAnswers",
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 18.0,
                    ),
                  ),
                  SizedBox(width: 80),
                  Text(
                    "Erros: $_wrongAnswers",
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 18.0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ), // Exibe o número de erros
        Container(
          height: MediaQuery.of(context).size.height / 2.1,
          child: Image.network(_selectedPokemon.image),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          child: Column(
            children: _randomPokemons.map((pokemon) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 2.0),
                child: SizedBox(
                  width: 350,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      onPokemonButtonPressed(pokemon);
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.blue),
                    ),
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
