import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon.dart';

// Traz a imagem do pokemon quando você clica nele (dentro do circulo{container})
class DetailImage extends StatelessWidget {
  const DetailImage({required this.pokemon, super.key});

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        maxHeight: 500,
      ),
      color: Colors.black,
      child: Center(
        child: Stack(
          children: [
            Container(
              height: 500,
              width: 500,
              decoration: const BoxDecoration(
                color: Colors.white10,
                shape: BoxShape.circle,
              ),
            ),
            Image.network(
              pokemon.image,
              fit: BoxFit.contain,
              alignment: Alignment.center,
            ),
          ],
        ),
      ),
    );
  }
}
