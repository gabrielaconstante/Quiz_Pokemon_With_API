import 'package:flutter/material.dart';

// Constroi o card do pokemon na pagina da pikedex
class PokemonCardBackground extends StatelessWidget {
  const PokemonCardBackground({required this.id, super.key});
  final int id;

  @override
  Widget build(BuildContext context) {
    var fontSize = id > 99 ? 90.0 : 101.0;

    return Text(
      id.toString(),
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        color: Colors.grey.shade200,
      ),
    );
  }
}
