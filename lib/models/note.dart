import 'package:flutter/foundation.dart';

class Note {
  final String id;
  String title;
  String content;
  DateTime lastModified;

  Note({
    required this.id,
    required this.title,
    required this.content,
    required this.lastModified,
  });

  Note copyWith({
    String? title,
    String? content,
    DateTime? lastModified,
  }) {
    return Note(
      id: this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      lastModified: lastModified ?? this.lastModified,
    );
  }

  factory Note.fromJson(Map<String, dynamic> json) {
    return Note(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      lastModified: DateTime.parse(json['lastModified']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'lastModified': lastModified.toIso8601String(),
    };
  }
}