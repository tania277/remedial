// ignore: import_of_legacy_library_into_null_safe
import 'package:cached_network_image/cached_network_image.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:poke_app/src/model/pokemon_model.dart';

// ignore: must_be_immutable
class PokemonDetailPage extends StatelessWidget {
  PokemonModel _pokemonModel;

  PokemonDetailPage(this._pokemonModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_pokemonModel.name),
        ),
        body: Container(
          color: Colors.blueGrey,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Stack(
              children: [
                Positioned(
                    height: MediaQuery.of(context).size.height / 2,
                    width: MediaQuery.of(context).size.width - 30,
                    top: MediaQuery.of(context).size.height * 0.2,
                    child: Card(
                        shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ))),
                Column(
                  children: [
                    FlipCard(
                      front: Expanded(
                        child: Center(
                          child: CachedNetworkImage(
                            height: 300,
                            width: 300,
                            imageUrl: _pokemonModel.imageUrl,
                          ),
                        ),
                      ),
                      back: Expanded(
                        child: Center(
                            child: Image(
                                height: 300,
                                width: 300,
                                image: AssetImage('assets/images/back.png'))),
                      ),
                    ),
                    Container(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _pokemonModel.name,
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          _pokemonModel.types
                              .toString()
                              .replaceAll('[', '')
                              .replaceAll(']', ''),
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _pokemonModel.hp,
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          _pokemonModel.rarity,
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.normal),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
