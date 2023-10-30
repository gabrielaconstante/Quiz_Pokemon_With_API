class PokemonData {
  final int id;
  final int height; // altura em dm
  final int weight; // peso em hg

  PokemonData({
    required this.id,
    required this.height,
    required this.weight,
  });

  get heightInMeters => height / 10;
  get weightInKg => weight / 10;

  factory PokemonData.fromJson(Map<String, dynamic> json) {
    return PokemonData(
      id: json['id'],
      height: json['height'],
      weight: json['weight'],
    );
  }
}
