import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/character.dart';
import '../blocs/character_bloc.dart';
import '../blocs/character_state.dart';
import '../screens/character_detail_screen.dart';
import 'character_list_item.dart';

class CharacterList extends StatefulWidget {
  final List<CharacterEntity> characters;
  CharacterList({required this.characters});

  @override
  _CharacterListState createState() => _CharacterListState();
}

class _CharacterListState extends State<CharacterList> {
  bool isTablet = false;
  int selectedIndex = 0;

  void _navigateToDetailPage(
      BuildContext context, CharacterEntity selectedCharacter) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CharacterDetailScreen(
          character: selectedCharacter,
        ),
      ),
    );
  }

  void _handleOnSelectedItem(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isPortrait = mediaQuery.orientation == Orientation.portrait;
    final isTablet =
        isPortrait ? mediaQuery.size.width > 600 : mediaQuery.size.height > 600;

    final characters = widget.characters;

    if (characters.isEmpty) {
      return const Center(
        child: Text("No characters available."),
      );
    }

    return BlocBuilder<CharacterBloc, CharacterState>(
      builder: (context, state) {
        if (state is CharacterLoaded) {
          if (isTablet) {
            return Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    child: ListView.builder(
                      itemCount: characters.length,
                      itemBuilder: (context, index) {
                        final character = characters[index];
                        return CharacterListItem(
                          isSelected: index == selectedIndex,
                          character: character,
                          onCharacterSelected: () {
                            _handleOnSelectedItem(index);
                          },
                        );
                      },
                    ),
                  ),
                ),
                const VerticalDivider(width: 1, color: Colors.grey),
                Expanded(
                  flex: 3,
                  child: CharacterDetailScreen(
                    character: characters[selectedIndex],
                  ),
                ),
              ],
            );
          }

          return ListView.builder(
            itemCount: characters.length,
            itemBuilder: (context, index) {
              final character = characters[index];
              return CharacterListItem(
                isSelected: index == selectedIndex,
                character: character,
                onCharacterSelected: () {
                  _navigateToDetailPage(context, character);
                  _handleOnSelectedItem(index);
                },
              );
            },
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
