import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_character_viewer/domain/entities/character.dart';
import 'package:the_character_viewer/presentation/blocs/character_state.dart';

import '../blocs/character_bloc.dart';
import '../widgets/character_list_widget.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late List<CharacterEntity> filteredCharacters;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredCharacters = [];
  }

  void _performSearch(String query) {
    final characterBloc = BlocProvider.of<CharacterBloc>(context);
    final characterState = characterBloc.state;
    if (characterState is CharacterLoaded) {
      setState(() {
        if (query.isEmpty) {
          filteredCharacters = [];
        } else {
          filteredCharacters = characterState.result
              .where((character) =>
                  character.name.toLowerCase().contains(query.toLowerCase()) ||
                  character.description
                      .toLowerCase()
                      .contains(query.toLowerCase()))
              .toList();
        }
      });
    }
  }

  Widget _buildBody() {
    if (_searchController.text.isEmpty) {
      return const Center(
        child: Text(
          'Type something in the search box to find characters!',
          style: TextStyle(color: Colors.grey),
        ),
      );
    } else {
      return CharacterList(
        characters: filteredCharacters,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: const BackButton(color: Colors.white),
        title: TextField(
          autofocus: true,
          controller: _searchController,
          onChanged: _performSearch,
          style: const TextStyle(color: Colors.white),
          cursorColor: Colors.white,
          decoration: const InputDecoration(
            hintText: 'Search Characters',
            hintStyle: TextStyle(color: Colors.white54),
            suffixIcon: Icon(Icons.search, color: Colors.white),
          ),
        ),
      ),
      body: _buildBody(),
    );
  }
}
