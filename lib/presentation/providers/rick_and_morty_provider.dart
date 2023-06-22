

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:page_view_1/infraestructure/models/rick_morty_model.dart';
import 'package:page_view_1/infraestructure/models/rick_morty_model2.dart';

class RickAndMortyProvider extends ChangeNotifier {

  final List<Result> _listRickMorty = [];
  final List<Imagenes> _listRickMorty2 = [];

  RickAndMortyProvider(){
    getApiRickMorty();
    getApiRickMorty2();
  }

  Future<void> getApiRickMorty() async {
    const url = 'https://rickandmortyapi.com/api/character?page=1';
    final getUrl = await http.get(Uri.parse(url));

    if(getUrl.statusCode == 200){
      final response = RickMortyModel.fromJson(getUrl.body);
      _listRickMorty.addAll(response.results);
      notifyListeners();
    }
  }
  Future<void> getApiRickMorty2() async {
    const url = 'https://rickandmortyapi.com/api/character?page=2';
    final getUrl = await http.get(Uri.parse(url));

    if(getUrl.statusCode == 200){
      final response = RickMortyModel2.fromJson(getUrl.body);
      _listRickMorty2.addAll(response.results);
      notifyListeners();
    }
  }

  List<Result> get getListRickMorty => _listRickMorty;
  List<Imagenes> get getListRickMorty2 => _listRickMorty2;

}