// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_todos_sync_response_content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetTodosSyncResponseContent _$GetTodosSyncResponseContentFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'GetTodosSyncResponseContent',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['entities', 'deleted'],
        );
        final val = GetTodosSyncResponseContent(
          entities: $checkedConvert(
              'entities',
              (v) => (v as List<dynamic>)
                  .map((e) => TodoResponse.fromJson(e as Map<String, dynamic>))
                  .toList()),
          deleted: $checkedConvert('deleted',
              (v) => (v as List<dynamic>).map((e) => e as String).toList()),
        );
        return val;
      },
    );

Map<String, dynamic> _$GetTodosSyncResponseContentToJson(
        GetTodosSyncResponseContent instance) =>
    <String, dynamic>{
      'entities': instance.entities.map((e) => e.toJson()).toList(),
      'deleted': instance.deleted,
    };
