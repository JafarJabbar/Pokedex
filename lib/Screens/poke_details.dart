import 'package:flutter/material.dart';
import 'package:pokedex/models/Pokedex.dart';
import 'dart:math';

class PokeDetails extends StatelessWidget {
  Pokemon pokemon;
  PokeDetails({this.pokemon});

  @override
  Widget build(BuildContext context) {
    var rnd = new Random();
    var number=rnd.nextInt(255);
    var numberTwo=rnd.nextInt(255);
    var numberThree=rnd.nextInt(255);
    return Scaffold(
      backgroundColor:  Color.fromRGBO(number, numberTwo, numberThree, 1),
      appBar: AppBar(
        title: Center(
          child: Text(pokemon.name),
        ),
      ),
      body: OrientationBuilder(builder: (context,orientation){
        if(orientation==Orientation.portrait){
          return  Stack(
            children: <Widget>[
              Positioned(
                height: MediaQuery.of(context).size.height * (2 / 3),
                width: MediaQuery.of(context).size.width - 10,
                left: 6,
                top: 60,
                child: Card(
                    elevation: 10,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        SizedBox(
                          height: 70,
                        ),
                        Text(
                          pokemon.name,
                          style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
                        ),
                        Text(
                          "Height : " +
                              pokemon.height +
                              "   Weight : " +
                              pokemon.weight,
                          style: TextStyle(fontWeight: FontWeight.w800),
                        ),
                        Text(
                          "Types : ",
                          style: TextStyle(fontWeight: FontWeight.w800),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: pokemon.type != null ?
                          pokemon.type.map((type)=>Chip(label: Text(type),backgroundColor:  Color.fromRGBO(number, numberTwo, numberThree, .7),)).toList()
                              :[Text(pokemon.name +" has no type. ")],
                        ),
                        Text(
                          "Next pokemon : ",
                          style: TextStyle(fontWeight: FontWeight.w800),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: pokemon.nextEvolution != null?
                          pokemon.nextEvolution.map((next)=>Chip(label: Text(next.name),backgroundColor:  Color.fromRGBO(number, numberTwo, numberThree, .7),)).toList()
                              :[Text(pokemon.name +" at maximum level. ")],
                        ),
                        Text(
                          "Previous pokemon : ",
                          style: TextStyle(fontWeight: FontWeight.w800),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: pokemon.prevEvolution != null?
                          pokemon.prevEvolution.map((prev)=>Chip(label: Text(prev.name),backgroundColor:  Color.fromRGBO(number, numberTwo, numberThree, .7),)).toList()
                              :[Text(pokemon.name +" at minimum level. ")],
                        )
                      ],
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Hero(
                  tag: pokemon.img,
                  child: Container(
                    width: 150,
                    height: 150,
                    child: Image.network(
                      pokemon.img,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              )
            ],
          );
        }else{
          return Stack(
            children: <Widget>[
              Positioned(
                height: MediaQuery.of(context).size.height * 0.75,
                width: MediaQuery.of(context).size.width - 50,
                left: 25,
                top: 6,
                child: Card(
                    elevation: 10,
                    child: Container(
                      padding: EdgeInsets.only(left: 200),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                            "Types : ",
                            style: TextStyle(fontWeight: FontWeight.w800),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: pokemon.type != null ?
                            pokemon.type.map((type)=>Chip(label: Text(type),backgroundColor:  Color.fromRGBO(number, numberTwo, numberThree, .7),)).toList()
                                :[Text(pokemon.name +" has no type. ")],
                          ),
                          Text(
                            "Next pokemon : ",
                            style: TextStyle(fontWeight: FontWeight.w800),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: pokemon.nextEvolution != null?
                            pokemon.nextEvolution.map((next)=>Chip(label: Text(next.name),backgroundColor:  Color.fromRGBO(number, numberTwo, numberThree, .7),)).toList()
                                :[Text(pokemon.name +" at maximum level. ")],
                          ),
                          Text(
                            "Previous pokemon : ",
                            style: TextStyle(fontWeight: FontWeight.w800),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: pokemon.prevEvolution != null?
                            pokemon.prevEvolution.map((prev)=>Chip(label: Text(prev.name),backgroundColor:  Color.fromRGBO(number, numberTwo, numberThree, .7),)).toList()
                                :[Text(pokemon.name +" at minimum level. ")],
                          ),
                          Text(
                            "Weakness : ",
                            style: TextStyle(fontWeight: FontWeight.w800),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: pokemon.weaknesses != null?
                            pokemon.weaknesses.map((weak)=>Chip(label: Text(weak),backgroundColor:  Color.fromRGBO(number, numberTwo, numberThree, .7),)).toList()
                                :[Text(pokemon.name +" has not  weakness. ")],
                          )
                        ],
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Hero(
                  tag: pokemon.img,
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: 200,
                        height: 200,
                        margin: EdgeInsets.symmetric(horizontal: 30),
                        child: Image.network(
                          pokemon.img,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Text(
                        pokemon.name,
                        style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
                      ),
                      Text(
                        "Height : " +
                            pokemon.height ,
                        style: TextStyle(fontWeight: FontWeight.w800),
                      ),
                      Text(
                        "Weight : " +
                            pokemon.weight,
                        style: TextStyle(fontWeight: FontWeight.w800),
                      ),

                    ],
                  ),
                ),
              ),

            ],
          );
        }
      },
      )
    );
  }
}
