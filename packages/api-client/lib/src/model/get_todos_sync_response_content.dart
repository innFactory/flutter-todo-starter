//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:api_client/src/model/todo_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_todos_sync_response_content.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GetTodosSyncResponseContent {
  /// Returns a new [GetTodosSyncResponseContent] instance.
  GetTodosSyncResponseContent({
    required this.entities,
    required this.deleted,
  });

  @JsonKey(name: r'entities', required: true, includeIfNull: false)
  final List<TodoResponse> entities;

  @JsonKey(name: r'deleted', required: true, includeIfNull: false)
  final List<String> deleted;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GetTodosSyncResponseContent &&
          other.entities == entities &&
          other.deleted == deleted;

  @override
  int get hashCode => entities.hashCode + deleted.hashCode;

  factory GetTodosSyncResponseContent.fromJson(Map<String, dynamic> json) =>
      _$GetTodosSyncResponseContentFromJson(json);

  Map<String, dynamic> toJson() => _$GetTodosSyncResponseContentToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
