import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:learn_flutter/data/models/characters.dart';
import 'package:learn_flutter/data/repository/characters_repository.dart';
part 'character_state.dart';

// Data coming from => server API => Web services => Repository => cubit.
class CharacterCubit extends Cubit<CharacterState> {
  final CharactersRepository characterRepository;
  List<Character>? characters;
  CharacterCubit(this.characterRepository) : super(CharacterInitial());

  List<Character> getAllCharacters() {
    characterRepository.getAllCharacters().then((characters) {
      emit(CharacterLoaded(characters));
      this.characters = characters;
    });
    return characters ?? [];
  }
}
