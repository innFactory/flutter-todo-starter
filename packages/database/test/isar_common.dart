import 'package:core/core.dart';
import 'package:database/database.dart';
import 'package:isar/isar.dart';

part 'isar_common.g.dart';

@Collection()
class TestLocalEntity extends LocalBase {
  @internal
  TestLocalEntity();

  String name = '';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TestLocalEntity &&
          runtimeType == other.runtimeType &&
          localId == other.localId &&
          name == other.name;

  @override
  int get hashCode => localId.hashCode ^ name.hashCode;
}
