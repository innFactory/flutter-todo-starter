// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_creation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodoCreation _$TodoCreationFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'TodoCreation',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['title', 'completed', 'description', 'tags'],
        );
        final val = TodoCreation(
          title: $checkedConvert('title', (v) => v as String),
          completed: $checkedConvert('completed', (v) => v as bool),
          parentId: $checkedConvert('parentId', (v) => v as String?),
          description: $checkedConvert('description', (v) => v as String),
          tags: $checkedConvert('tags',
              (v) => (v as List<dynamic>).map((e) => e as String).toList()),
        );
        return val;
      },
    );

Map<String, dynamic> _$TodoCreationToJson(TodoCreation instance) {
  final val = <String, dynamic>{
    'title': instance.title,
    'completed': instance.completed,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('parentId', instance.parentId);
  val['description'] = instance.description;
  val['tags'] = instance.tags;
  return val;
}
