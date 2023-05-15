//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'todo_creation.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TodoCreation {
  /// Returns a new [TodoCreation] instance.
  TodoCreation({
    required this.title,
    required this.completed,
    this.parentId,
    required this.description,
    required this.tags,
  });

  @JsonKey(name: r'title', required: true, includeIfNull: false)
  final String title;

  @JsonKey(name: r'completed', required: true, includeIfNull: false)
  final bool completed;

  @JsonKey(name: r'parentId', required: false, includeIfNull: false)
  final String? parentId;

  @JsonKey(name: r'description', required: true, includeIfNull: false)
  final String description;

  @JsonKey(name: r'tags', required: true, includeIfNull: false)
  final List<String> tags;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TodoCreation &&
          other.title == title &&
          other.completed == completed &&
          other.parentId == parentId &&
          other.description == description &&
          other.tags == tags;

  @override
  int get hashCode =>
      title.hashCode +
      completed.hashCode +
      parentId.hashCode +
      description.hashCode +
      tags.hashCode;

  factory TodoCreation.fromJson(Map<String, dynamic> json) =>
      _$TodoCreationFromJson(json);

  Map<String, dynamic> toJson() => _$TodoCreationToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
