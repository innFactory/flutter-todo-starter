import 'package:api_client/src/model/create_todo_response_content.dart';
import 'package:api_client/src/model/get_todo_by_id_response_content.dart';
import 'package:api_client/src/model/get_todos_sync_response_content.dart';
import 'package:api_client/src/model/todo_creation.dart';
import 'package:api_client/src/model/todo_response.dart';
import 'package:api_client/src/model/todo_update.dart';
import 'package:api_client/src/model/update_todo_response_content.dart';

final _regList = RegExp(r'^List<(.*)>$');
final _regSet = RegExp(r'^Set<(.*)>$');
final _regMap = RegExp(r'^Map<String,(.*)>$');

ReturnType deserialize<ReturnType, BaseType>(dynamic value, String targetType,
    {bool growable = true}) {
  switch (targetType) {
    case 'String':
      return '$value' as ReturnType;
    case 'int':
      return (value is int ? value : int.parse('$value')) as ReturnType;
    case 'bool':
      if (value is bool) {
        return value as ReturnType;
      }
      final valueString = '$value'.toLowerCase();
      return (valueString == 'true' || valueString == '1') as ReturnType;
    case 'double':
      return (value is double ? value : double.parse('$value')) as ReturnType;
    case 'CreateTodoResponseContent':
      return CreateTodoResponseContent.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'GetTodoByIdResponseContent':
      return GetTodoByIdResponseContent.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'GetTodosSyncResponseContent':
      return GetTodosSyncResponseContent.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'TodoCreation':
      return TodoCreation.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'TodoResponse':
      return TodoResponse.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'TodoUpdate':
      return TodoUpdate.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'UpdateTodoResponseContent':
      return UpdateTodoResponseContent.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    default:
      RegExpMatch? match;

      if (value is List && (match = _regList.firstMatch(targetType)) != null) {
        targetType = match![1]!; // ignore: parameter_assignments
        return value
            .map<BaseType>((dynamic v) => deserialize<BaseType, BaseType>(
                v, targetType,
                growable: growable))
            .toList(growable: growable) as ReturnType;
      }
      if (value is Set && (match = _regSet.firstMatch(targetType)) != null) {
        targetType = match![1]!; // ignore: parameter_assignments
        return value
            .map<BaseType>((dynamic v) => deserialize<BaseType, BaseType>(
                v, targetType,
                growable: growable))
            .toSet() as ReturnType;
      }
      if (value is Map && (match = _regMap.firstMatch(targetType)) != null) {
        targetType = match![1]!; // ignore: parameter_assignments
        return Map<dynamic, BaseType>.fromIterables(
          value.keys,
          value.values.map((dynamic v) => deserialize<BaseType, BaseType>(
              v, targetType,
              growable: growable)),
        ) as ReturnType;
      }
      break;
  }
  throw Exception('Cannot deserialize');
}
