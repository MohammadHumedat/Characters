import 'package:flutter/material.dart';
import 'package:learn_flutter/data/models/characters.dart';

class CharactersDetails extends StatelessWidget {
  final Character character;

  const CharactersDetails({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            centerTitle: true,
            expandedHeight: 400,
            pinned: true,
            backgroundColor: Colors.black,
            elevation: 0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                character.name,
                style: const TextStyle(
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      color: Colors.black54,
                      blurRadius: 8,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
              ),
              background: Hero(
                tag: character.id,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.network(
                      character.image,
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.high,
                      errorBuilder:
                          (context, error, stackTrace) => Container(
                            color: Colors.grey[300],
                            child: const Icon(Icons.broken_image, size: 60),
                          ),
                    ),

                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.transparent,
                            Colors.black.withAlpha(100),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Basic info
                  // Row for status + life indicator
                  Row(
                    children: [
                      Expanded(child: _infoRow('Status', character.status)),
                      _lifeIndicator(character.status),
                    ],
                  ),
                  _customDivider(),
                  const SizedBox(height: 10),
                  _infoRow('Species', character.species),
                  _customDivider(),
                  const SizedBox(height: 10),
                  _infoRow('Gender', character.gender),
                  _customDivider(),
                  const SizedBox(height: 10),
                  _infoRow('Origin', character.origin.name),
                  _customDivider(),
                  const SizedBox(height: 10),
                  _infoRow('Location', character.location.name),
                  _customDivider(),
                  const SizedBox(height: 30),

                  // Episodes count
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Episodes appeared in:",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "${character.episode.length}",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurple,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _infoRow(String title, String value) {
    return Row(
      children: [
        Text(
          "$title: ",
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        Expanded(
          child: Text(
            value.isEmpty ? "Unknown" : value,
            style: const TextStyle(fontSize: 18, color: Colors.black87),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _lifeIndicator(String status) {
    return Chip(
      avatar: CircleAvatar(
        backgroundColor: status == 'Alive' ? Colors.green : Colors.red,
        radius: 6,
      ),
      label: Text(status, style: const TextStyle(fontSize: 16)),
      backgroundColor: Colors.grey[200],
    );
  }
}

Widget _customDivider() {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 10),
    height: 1,
    decoration: const BoxDecoration(
      gradient: LinearGradient(
        colors: [Colors.transparent, Colors.blueGrey, Colors.transparent],
      ),
    ),
  );
}
