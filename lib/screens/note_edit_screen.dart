import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/note.dart';
import '../services/note_service.dart';

class NoteEditScreen extends StatefulWidget {
  final Note? note;

  NoteEditScreen({this.note});

  @override
  _NoteEditScreenState createState() => _NoteEditScreenState();
}

class _NoteEditScreenState extends State<NoteEditScreen> {
  late TextEditingController _titleController;
  late TextEditingController _contentController;
  late NoteService _noteService;
  String? _noteId;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.note?.title ?? '');
    _contentController = TextEditingController(text: widget.note?.content ?? '');
    _noteService = Provider.of<NoteService>(context, listen: false);
    _noteId = widget.note?.id;

    _titleController.addListener(_saveChanges);
    _contentController.addListener(_saveChanges);

    // If it's a new note, create it immediately
    if (_noteId == null) {
      _createNewNote();
    }
  }

  @override
  void dispose() {
    _titleController.removeListener(_saveChanges);
    _contentController.removeListener(_saveChanges);
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  Future<void> _createNewNote() async {
    _noteId = await _noteService.addNote('', '');
  }

  void _saveChanges() {
    final title = _titleController.text;
    final content = _contentController.text;

    if (_noteId != null) {
      _noteService.updateNote(_noteId!, title, content);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.note == null ? 'New Note' : 'Edit Note'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                hintText: 'Title',
                border: InputBorder.none,
              ),
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: TextField(
                controller: _contentController,
                decoration: InputDecoration(
                  hintText: 'Note',
                  border: InputBorder.none,
                ),
                maxLines: null,
                keyboardType: TextInputType.multiline,
              ),
            ),
          ],
        ),
      ),
    );
  }
}