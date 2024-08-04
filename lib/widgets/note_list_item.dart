import 'package:flutter/material.dart';
import '../models/note.dart';
import '../screens/note_edit_screen.dart';

class NoteListItem extends StatelessWidget {
  final Note note;

  NoteListItem({required this.note});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        note.title.isEmpty ? 'Untitled' : note.title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        note.content,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NoteEditScreen(note: note),
          ),
        );
      },
    );
  }
}