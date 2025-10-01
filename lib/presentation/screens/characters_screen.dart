import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter/business_logic/cubit/character/character_cubit.dart';
import 'package:learn_flutter/constants/colors.dart';
import 'package:learn_flutter/data/models/characters.dart';
import 'package:learn_flutter/presentation/widgets/character_item.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   
        BlocProvider.of<CharacterCubit>(
          context,
        ).getAllCharacters(); // This to set data for a variable
  }

  List<Character>? allCharacters;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Characters',
          style: TextTheme.of(
            context,
          ).titleMedium!.copyWith(color: AppColors.grey),
        ),
        backgroundColor: AppColors.yalow,
      ),
      body: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: BlocProvider.of<CharacterCubit>(context),
      builder: (context, state) {
        if (state is CharacterLoaded) {
          return SingleChildScrollView(
            child: Container(
              color: AppColors.grey,
              child: Column(
                children: [
                  GridView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    itemCount: state.character.length,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 2 / 3,
                        ),
                    itemBuilder: (context, index) {
                      return CharacterItem(character: state.character[index]);
                    },
                  ),
                ],
              ),
            ),
          );
        } else if (state is CharacterLoading) {
          return const CircularProgressIndicator();
        } else {
          return Center(
            child: Card(
              color: Colors.red.shade50,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 4,
              margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.error_outline,
                      color: Colors.red.shade400,
                      size: 48,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      "حدث خطأ",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.red.shade700,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "لم نتمكن من تحميل البيانات، الرجاء المحاولة لاحقًا.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade700,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton.icon(
                      onPressed: () {
                        context.read<CharacterCubit>().getAllCharacters();
                      },
                      icon: const Icon(Icons.refresh),
                      label: const Text("إعادة المحاولة"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red.shade400,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
