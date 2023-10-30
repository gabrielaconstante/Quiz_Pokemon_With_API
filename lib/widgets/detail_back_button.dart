import 'package:flutter/material.dart';

// Botão de voltar (Não irei usar no quiz)
// Mas posso usar para reiniciar o quiz talvez

class DetailBackButton extends StatelessWidget {
  const DetailBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () => Navigator.pop(context),
      label: const Text('Voltar'),
      icon: const Icon(Icons.arrow_back_ios_new_rounded),
    );
  }
}
