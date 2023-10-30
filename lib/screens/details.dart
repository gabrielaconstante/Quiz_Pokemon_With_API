import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/widgets/detail_back_button.dart';
import 'package:pokedex/widgets/detail_data.dart';
import 'package:pokedex/widgets/detail_image.dart';
import 'package:pokedex/widgets/detail_title.dart';

// Pagina quando clica no pokemon
class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final pokemon = ModalRoute.of(context)!.settings.arguments as Pokemon;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
        ),
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            DetailImage(pokemon: pokemon),
            DetailTitle(pokemon: pokemon),
            DetailData(pokemon: pokemon),
          ],
        ),
      ),
      floatingActionButton: const DetailBackButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}
