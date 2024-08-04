import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/note.dart';
import '../services/note_service.dart';
import 'note_list_item.dart';

class NoteSearchDelegate extends SearchDelegate<Note?> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return buildSearchResults(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return buildSearchResults(context);
  }

  Widget buildSearchResults(BuildContext context) {
    final noteService = Provider.of<NoteService>(context, listen: false);
    final searchResults = noteService.searchNotes(query);

    return ListView.builder(
      itemCount: searchResults.length,
      itemBuilder: (context, index) {
        return NoteListItem(note: searchResults[index]);
      },
    );
  }
}