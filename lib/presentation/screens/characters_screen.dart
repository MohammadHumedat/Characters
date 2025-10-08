import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter/business_logic/cubit/character/character_cubit.dart';
import 'package:learn_flutter/constants/colors.dart';
import 'package:learn_flutter/constants/strings.dart';
import 'package:learn_flutter/data/models/characters.dart';
import 'package:learn_flutter/presentation/widgets/character_item.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  List<Character>? allCharacters;
  List<Character> searchedForCharacters = [];
  bool isSearching = false;
  final _searchTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CharacterCubit>(context).getAllCharacters();
  }

  void addToSearchedList(String searchedCharacter) {
    final query = searchedCharacter.toLowerCase();
    final startsWithMatches =
        allCharacters!
            .where((c) => c.name.toLowerCase().startsWith(query))
            .toList();

    final containsMatches =
        allCharacters!
            .where(
              (c) =>
                  !c.name.toLowerCase().startsWith(query) &&
                  c.name.toLowerCase().contains(query),
            )
            .toList();

    searchedForCharacters = [...startsWithMatches, ...containsMatches];
    setState(() {});
  }

  Widget buildSearchField() {
    return TextField(
      controller: _searchTextController,
      cursorHeight: 18,
      style: const TextStyle(
        fontSize: 18,
        color: AppColors.grey,
        fontWeight: FontWeight.w500,
      ),
      decoration: const InputDecoration(
        hintText: 'Find a character',
        border: InputBorder.none,
      ),
      cursorColor: AppColors.black,
      autofocus: true,
      onChanged: addToSearchedList,
    );
  }

  List<Widget> buildAppBarActions() {
    return [
      if (isSearching)
        IconButton(
          onPressed: () {
            _searchTextController.clear();
            setState(() {
              isSearching = false;
              searchedForCharacters.clear();
            });
          },
          icon: const Icon(Icons.clear, color: AppColors.grey),
        )
      else
        IconButton(
          onPressed: () {
            ModalRoute.of(context)!.addLocalHistoryEntry(
              LocalHistoryEntry(
                onRemove: () {
                  setState(() {
                    isSearching = false;
                    searchedForCharacters.clear();
                  });
                },
              ),
            );
            setState(() => isSearching = true);
          },
          icon: const Icon(Icons.search, color: AppColors.grey),
        ),
    ];
  }

  Widget buildAppBarTitle() => Text(
    'Characters',
    style: Theme.of(
      context,
    ).textTheme.titleMedium!.copyWith(color: AppColors.grey),
  );

  Widget buildCharactersGrid(List<Character> characters) {
    return GridView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemCount: characters.length,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
      ),
      itemBuilder: (context, index) {
        return CharacterItem(
          character: characters[index],
          onTap: () {
            Navigator.pushNamed(
              context,
              ConstantStrings.characterScreenDetails,
              arguments: characters[index],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        backgroundColor: Colors.white,
        centerTitle: true,
        title:
            isSearching
                ? buildSearchField()
                : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.person, color: AppColors.grey, size: 28),
                    const SizedBox(width: 8),
                    buildAppBarTitle(),
                  ],
                ),
        leading:
            isSearching
                ? const BackButton(color: AppColors.grey)
                : Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: CircleAvatar(
                    backgroundColor: AppColors.grey.withAlpha(1),
                    child: const Icon(Icons.menu, color: AppColors.grey),
                  ),
                ),
        actions: buildAppBarActions(),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
        ),
        shadowColor: AppColors.grey.withAlpha(2),
      ),
      body: BlocBuilder<CharacterCubit, CharacterState>(
        builder: (context, state) {
          if (state is CharacterLoaded) {
            allCharacters = state.character;
            final charactersToShow = // if searching, show searched list; else show all
                isSearching ? searchedForCharacters : allCharacters ?? [];

            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.only(top: 10, bottom: 16),
              child: Container(
                color: AppColors.grey,
                child: Column(
                  children: [buildCharactersGrid(charactersToShow)],
                ),
              ),
            );
          } else if (state is CharacterLoading) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return const Center(child: Text('Error loading data'));
          }
        },
      ),
    );
  }
}
