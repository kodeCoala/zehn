import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/note.dart';

class NoteService extends ChangeNotifier {
  List<Note> _notes = [];
  SharedPreferences? _prefs;

  List<Note> get notes => _notes;

  NoteService() {
    _loadNotes();
  }

  Future<void> _loadNotes() async {
    _prefs = await SharedPreferences.getInstance();
    final notesJson = _prefs!.getStringList('notes') ?? [];
    _notes = notesJson.map((noteJson) => Note.fromJson(jsonDecode(noteJson))).toList();
    notifyListeners();
  }

  Future<void> _saveNotes() async {
    final notesJson = _notes.map((note) => jsonEncode(note.toJson())).toList();
    await _prefs!.setStringList('notes', notesJson);
  }

  Future<String> addNote(String title, String content) async {
    final newNote = Note(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
      content: content,
      lastModified: DateTime.now(),
    );
    _notes.add(newNote);
    await _saveNotes();
    notifyListeners();
    return newNote.id;
  }

  Future<void> updateNote(String id, String title, String content) async {
    final index = _notes.indexWhere((note) => note.id == id);
    if (index != -1) {
      _notes[index] = _notes[index].copyWith(
        title: title,
        content: content,
        lastModified: DateTime.now(),
      );
      await _saveNotes();
      notifyListeners();
    }
  }

  Future<void> deleteNote(String id) async {
    _notes.removeWhere((note) => note.id == id);
    await _saveNotes();
    notifyListeners();
  }

  List<Note> searchNotes(String query) {
    return _notes.where((note) {
      return note.title.toLowerCase().contains(query.toLowerCase()) ||
          note.content.toLowerCase().contains(query.toLowerCase());
    }).toList();
  }
}