import 'package:flutter/material.dart';
import 'package:learn_flutter/data/models/characters.dart';

class CharactersDetails extends StatelessWidget {
  final Character character;
  const CharactersDetails({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(character.name)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(character.image),
            const SizedBox(height: 20),
            Text(
              character.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'Status: ${character.status}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 5),
            Text(
              'Species: ${character.species}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}
