import 'package:flutter/material.dart';
import 'package:pokedex/Screens/poke_list.dart';

void main(){
  runApp(
    new MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: "Montserrat"),
      home: PokeList(),
    )
  );
}