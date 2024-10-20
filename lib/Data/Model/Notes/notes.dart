import 'dart:convert';

class Note {
  String id;
  String note;
  String date;

  //
  //
  Note({
    required this.id,
    required this.note,
    required this.date
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'note': note,
      'date': date,
    };
  }

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      id: map['id'] as String,
      note: map['note'],
      date: map['date'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Note.fromJson(String source) =>
      Note.fromMap(json.decode(source) as Map<String, dynamic>);
}
