import 'dart:ui';

import 'package:hive/hive.dart';

part 'note_model.g.dart';

@HiveType(typeId: 1)
class NoteModel extends HiveObject {
  int? id;
  @HiveField(0)
  String? title;
  @HiveField(1)
  String? content;
  @HiveField(2)
  String? category;
  @HiveField(3)
  DateTime? createdAt;
  DateTime? updatedAt;
  @HiveField(4)
  bool? isPinned;
  @HiveField(5)
  int? categoryColor;

  NoteModel({
    this.id,
    required this.title,
    required this.content,
    required this.createdAt,
    this.updatedAt,
    this.isPinned,
    required this.category,
    required this.categoryColor,
  });
}
