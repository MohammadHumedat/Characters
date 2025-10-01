part of 'character_cubit.dart';

sealed class CharacterState extends Equatable {
  const CharacterState();

  @override
  List<Object> get props => [];
}

final class CharacterInitial extends CharacterState {}

final class CharacterLoaded extends CharacterState {
  List<Character> character;
  CharacterLoaded(this.character);
}

final class CharacterLoading extends CharacterState {}

final class CharacterError extends CharacterState {
  String massage;
  CharacterError(this.massage);
}
