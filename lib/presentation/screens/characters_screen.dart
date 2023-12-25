import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_character_viewer/presentation/blocs/character_bloc.dart';
import 'package:the_character_viewer/presentation/blocs/character_event.dart';
import 'package:the_character_viewer/presentation/blocs/character_state.dart';
import 'package:the_character_viewer/presentation/screens/search_screen.dart';
import 'package:the_character_viewer/presentation/widgets/character_list_widget.dart';
import '../../domain/entities/character.dart';

class CharactersScreen extends StatefulWidget {
  final String title;

  const CharactersScreen({Key? key, required this.title}) : super(key: key);

  @override
  _CharactersScreenState createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CharacterBloc>(context).add(FetchCharactersEvent());
  }

  void _updateFilteredCharacters(List<CharacterEntity> filtered) {
    setState(() {
      // filteredCharacters = filtered;
    });
  }

  void _navigateSearchScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SearchScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => _navigateSearchScreen(context),
          ),
        ],
      ),
      body: BlocBuilder<CharacterBloc, CharacterState>(
        builder: (context, state) {
          if (state is CharacterLoaded) {
            return CharacterList(characters: state.result);
          } else if (state is CharacterLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CharacterFailure) {
            return Center(child: Text(state.message));
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
