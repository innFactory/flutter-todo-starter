//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'todo_response.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TodoResponse {
  /// Returns a new [TodoResponse] instance.
  TodoResponse({
    required this.todoId,
    required this.title,
    required this.description,
    required this.tags,
    required this.completed,
    required this.createdAt,
    required this.updatedAt,
    this.parentId,
  });

  @JsonKey(name: r'todoId', required: true, includeIfNull: false)
  final String todoId;

  @JsonKey(name: r'title', required: true, includeIfNull: false)
  final String title;

  @JsonKey(name: r'description', required: true, includeIfNull: false)
  final String description;

  @JsonKey(name: r'tags', required: true, includeIfNull: false)
  final List<String> tags;

  @JsonKey(name: r'completed', required: true, includeIfNull: false)
  final bool completed;

  /// ISO Date With Time
  @JsonKey(name: r'createdAt', required: true, includeIfNull: false)
  final String createdAt;

  /// ISO Date With Time
  @JsonKey(name: r'updatedAt', required: true, includeIfNull: false)
  final String updatedAt;

  @JsonKey(name: r'parentId', required: false, includeIfNull: false)
  final String? parentId;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TodoResponse &&
          other.todoId == todoId &&
          other.title == title &&
          other.description == description &&
          other.tags == tags &&
          other.completed == completed &&
          other.createdAt == createdAt &&
          other.updatedAt == updatedAt &&
          other.parentId == parentId;

  @override
  int get hashCode =>
      todoId.hashCode +
      title.hashCode +
      description.hashCode +
      tags.hashCode +
      completed.hashCode +
      createdAt.hashCode +
      updatedAt.hashCode +
      parentId.hashCode;

  factory TodoResponse.fromJson(Map<String, dynamic> json) =>
      _$TodoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TodoResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
