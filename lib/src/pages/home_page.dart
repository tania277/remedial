import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:poke_app/src/model/pokemon_model.dart';
import 'package:poke_app/src/pages/pokemon_detail_page.dart';
import 'package:poke_app/src/provider/pokemon_provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<PokemonModel> _pokemonModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokepedia'),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () async {
                List<PokemonModel> pokemonModel = await getPokemon();
                setState(() {
                  _pokemonModel = pokemonModel;
                });
              })
        ],
      ),
      body: SafeArea(
        child: Container(
          child: _buildContent(),
        ),
      ),
      floatingActionButton: new Visibility(
        visible: _pokemonModel != null,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PokemonDetailPage(_pokemonModel[
                      new Random().nextInt(_pokemonModel.length)]),
                ));
          },
          child: const Icon(Icons.call_to_action_rounded),
          backgroundColor: Colors.blueAccent,
        ),
      ),
    );
  }

  Widget _buildContent() {
    if (_pokemonModel == null) {
      return Center(
        child: Text('No hay pokemones recarga por favor'),
      );
    } else {
      return ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: _pokemonModel.length,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          PokemonDetailPage(_pokemonModel[index]),
                    ));
              },
              child: Container(
                height: 121,
                child: Row(
                  children: [
                    CachedNetworkImage(
                      imageUrl: _pokemonModel[index].imageUrl,
                      height: 80,
                    ),
                    Container(width: 10),
                    Text(
                      _pokemonModel[index].name,
                      style: TextStyle(fontSize: 20),
                    ),
                    Container(width: 20),
                  ],
                ),
              ),
            );
          });
    }
  }
}
