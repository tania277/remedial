class PokemonModel {
  String id;
  String name;
  String imageUrl;
  String hp;
  String rarity;
  List<String> types;

  PokemonModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imageUrl = json['imageUrl'];
    hp = json['hp'];
    rarity = json['rarity'];
    if (json['types'] != null)
      types = new List<String>.from(json['types']);
    else
      types = ["none"];
  }

  @override
  String toString() {
    return 'PokemonModel{id: $id, name: $name, imageUrl: $imageUrl}';
  }
}
