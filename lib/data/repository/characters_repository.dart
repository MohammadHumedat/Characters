import 'package:learn_flutter/data/models/characters.dart';
import 'package:learn_flutter/data/web_services/characters_web_services.dart';
// This Repository is responsible for taking data from web service and preparing these data for UI 
class CharactersRepository {
  final CharactersWebServices charactersWebServices;

  CharactersRepository(this.charactersWebServices);
  
  Future<List<Character>> getAllCharacters() async {

    final characters = await charactersWebServices.getAllCharacters();
    return characters.map((character) =>  Character.fromJson(character)).toList();

    
  }


}

