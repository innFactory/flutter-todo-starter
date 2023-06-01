// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_todo_response_content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateTodoResponseContent _$CreateTodoResponseContentFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'CreateTodoResponseContent',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const [
            'todoId',
            'title',
            'description',
            'tags',
            'completed',
            'createdAt',
            'updatedAt'
          ],
        );
        final val = CreateTodoResponseContent(
          todoId: $checkedConvert('todoId', (v) => v as String),
          title: $checkedConvert('title', (v) => v as String),
          description: $checkedConvert('description', (v) => v as String),
          tags: $checkedConvert('tags',
              (v) => (v as List<dynamic>).map((e) => e as String).toList()),
          completed: $checkedConvert('completed', (v) => v as bool),
          createdAt: $checkedConvert('createdAt', (v) => v as String),
          updatedAt: $checkedConvert('updatedAt', (v) => v as String),
          parentId: $checkedConvert('parentId', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$CreateTodoResponseContentToJson(
    CreateTodoResponseContent instance) {
  final val = <String, dynamic>{
    'todoId': instance.todoId,
    'title': instance.title,
    'description': instance.description,
    'tags': instance.tags,
    'completed': instance.completed,
    'createdAt': instance.createdAt,
    'updatedAt': instance.updatedAt,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('parentId', instance.parentId);
  return val;
}
