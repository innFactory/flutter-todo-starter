// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_update.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodoUpdate _$TodoUpdateFromJson(Map<String, dynamic> json) => $checkedCreate(
      'TodoUpdate',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['title', 'description', 'tags', 'completed'],
        );
        final val = TodoUpdate(
          title: $checkedConvert('title', (v) => v as String),
          description: $checkedConvert('description', (v) => v as String),
          tags: $checkedConvert('tags',
              (v) => (v as List<dynamic>).map((e) => e as String).toList()),
          completed: $checkedConvert('completed', (v) => v as bool),
          parentId: $checkedConvert('parentId', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$TodoUpdateToJson(TodoUpdate instance) {
  final val = <String, dynamic>{
    'title': instance.title,
    'description': instance.description,
    'tags': instance.tags,
    'completed': instance.completed,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('parentId', instance.parentId);
  return val;
}
