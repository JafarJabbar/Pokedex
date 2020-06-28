import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pokedex/Screens/poke_details.dart';
import 'package:pokedex/models/Pokedex.dart';

class PokeList extends StatefulWidget {
  @override
  _PokeListState createState() => _PokeListState();
}

class _PokeListState extends State<PokeList> {

  String url='https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json';
  Pokedex pokedex;
  Future<Pokedex> initVal;
  Future<Pokedex> getPokemon() async{
    var getPoke= await http.get(url);
    var decodedJSON=jsonDecode(getPoke.body);
    var lastResult=Pokedex.fromJson(decodedJSON);
    return lastResult;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initVal=getPokemon();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Pokedex")),
        backgroundColor: Colors.deepOrange,
      ),
      body: OrientationBuilder(builder: (context,orientation){
        if(orientation==Orientation.portrait){
          return FutureBuilder(future: initVal,builder: (context,AsyncSnapshot<Pokedex> result){
            if(result.connectionState==ConnectionState.waiting){
              return Center(
                child: CircularProgressIndicator(),
              );
            }else if(result.connectionState==ConnectionState.done){
              return GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), itemBuilder: (context,index){
                return InkWell(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder:(context)=>PokeDetails(pokemon: result.data.pokemon[index])));
                  },
                  child: Card(
                    elevation: 10,
                    child: Hero(
                      tag: result.data.pokemon[index].img,
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 150,
                              child: FadeInImage.assetNetwork(placeholder: 'assets/images/loading.gif', image: result.data.pokemon[index].img),
                            ),
                            Container(
                              height: 15,
                              child: Text(result.data.pokemon[index].name),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              });
            }else{
              return Center(
                child: Text("Bir problem oldu. Daha sonra yeniden cehd edin."),
              );
            }
          },);

        }else{
          return FutureBuilder(future: initVal,builder: (context,AsyncSnapshot<Pokedex> result){
            if(result.connectionState==ConnectionState.waiting){
              return Center(
                child: CircularProgressIndicator(),
              );
            }else if(result.connectionState==ConnectionState.done){
              return GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3), itemBuilder: (context,index){
                return InkWell(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder:(context)=>PokeDetails(pokemon: result.data.pokemon[index])));
                  },
                  child: Card(
                    elevation: 10,
                    child: Hero(
                      tag: result.data.pokemon[index].img,
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 150,
                              child: FadeInImage.assetNetwork(placeholder: 'assets/images/loading.gif', image: result.data.pokemon[index].img),
                            ),
                            Container(
                              height: 15,
                              child: Text(result.data.pokemon[index].name),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              });
            }else{
              return Center(
                child: Text("Bir problem oldu. Daha sonra yeniden cehd edin."),
              );
            }
          },);

        }
      },)
    );
  }
}
