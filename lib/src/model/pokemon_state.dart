import 'package:poke_app/src/model/pokemon_model.dart';

class PokemonHubModel {
  List<PokemonModel> pokemon;

  PokemonHubModel({this.pokemon});

  PokemonHubModel.fromJson(Map<String, dynamic> json) {
    if (json['cards'] != null) {
      pokemon = [];
      json['cards'].forEach((v) {
        pokemon.add(new PokemonModel.fromJson(v));
      });
    }
  }
}
