import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/note_service.dart';
import '../widgets/note_list_item.dart';
import '../widgets/note_search_delegate.dart';
import 'note_edit_screen.dart';

class NoteListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: NoteSearchDelegate(),
              );
            },
          ),
        ],
      ),
      body: Consumer<NoteService>(
        builder: (context, noteService, child) {
          final notes = noteService.notes;
          return ListView.builder(
            itemCount: notes.length,
            itemBuilder: (context, index) {
              return NoteListItem(note: notes[index]);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NoteEditScreen(),
            ),
          );
        },
      ),
    );
  }
}