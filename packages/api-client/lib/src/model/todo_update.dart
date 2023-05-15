//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'todo_update.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TodoUpdate {
  /// Returns a new [TodoUpdate] instance.
  TodoUpdate({
    required this.title,
    required this.description,
    required this.tags,
    required this.completed,
    this.parentId,
  });

  @JsonKey(name: r'title', required: true, includeIfNull: false)
  final String title;

  @JsonKey(name: r'description', required: true, includeIfNull: false)
  final String description;

  @JsonKey(name: r'tags', required: true, includeIfNull: false)
  final List<String> tags;

  @JsonKey(name: r'completed', required: true, includeIfNull: false)
  final bool completed;

  @JsonKey(name: r'parentId', required: false, includeIfNull: false)
  final String? parentId;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TodoUpdate &&
          other.title == title &&
          other.description == description &&
          other.tags == tags &&
          other.completed == completed &&
          other.parentId == parentId;

  @override
  int get hashCode =>
      title.hashCode +
      description.hashCode +
      tags.hashCode +
      completed.hashCode +
      parentId.hashCode;

  factory TodoUpdate.fromJson(Map<String, dynamic> json) =>
      _$TodoUpdateFromJson(json);

  Map<String, dynamic> toJson() => _$TodoUpdateToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
