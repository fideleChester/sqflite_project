const String tableNotes = 'notes';

class NoteFields {
  static final List<String> values = [
    /// Add all fields
    id, title, time, isImportant, description, number
  ];

  static const String id = '_id';
  static const String title = 'title';
  static const String time = 'time';
  static const String isImportant = 'isImportant';
  static const String description = 'description';
  static const String number = 'number';
}

class Note {
  final int? id;
  final String title;
  final bool isImportant;
  final String description;
  final int number;
  final DateTime createdTime;

  const Note(
      {this.id,
      required this.title,
      required this.isImportant,
      required this.description,
      required this.number,
      required this.createdTime});

  Note copy({
    int? id,
    String? title,
    bool? isImportant,
    String? description,
    int? number,
    DateTime? createdTime,
  }) =>
      Note(
        id: id ?? this.id,
        isImportant: isImportant ?? this.isImportant,
        number: number ?? this.number,
        title: title ?? this.title,
        createdTime: createdTime ?? this.createdTime,
        description: description ?? this.description,
      );

  static Note fromJson(Map<String, Object?> json) => Note(
        id: json[NoteFields.id] as int?,
        isImportant: json[NoteFields.isImportant] == 1,
        number: json[NoteFields.number] as int,
        createdTime: DateTime.parse(json[NoteFields.time] as String),
        description: json[NoteFields.description] as String,
        title: json[NoteFields.title] as String,
      );

  Map<String, Object?> toJson() => {
        NoteFields.id: id,
        NoteFields.title: title,
        NoteFields.isImportant: isImportant ? 1 : 0,
        NoteFields.number: number,
        NoteFields.time: createdTime.toIso8601String(),
        NoteFields.description: description,
      };
}
