import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter/business_logic/cubit/character/character_cubit.dart';
import 'package:learn_flutter/constants/strings.dart';
import 'package:learn_flutter/data/models/characters.dart';
import 'package:learn_flutter/data/repository/characters_repository.dart';
import 'package:learn_flutter/data/web_services/characters_web_services.dart';
import 'package:learn_flutter/presentation/screens/characters_details.dart';
import 'package:learn_flutter/presentation/screens/characters_screen.dart';

class AppRouters {
  CharactersRepository _charactersRepository = CharactersRepository(
    CharactersWebServices(),
  );
  Route? onGenerateRoute(RouteSettings setting) {
    switch (setting.name) {
      case ConstantStrings.characterScreen:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => CharacterCubit(_charactersRepository),
                child: const CharactersScreen(),
              ),
        );

      case ConstantStrings.characterScreenDetails:
        final character = setting.arguments as Character;
        return MaterialPageRoute(
          builder: (_) => CharactersDetails(character: character),
        );
    }
  }
}
