import 'package:core/core.dart';

/// {@template value_id}
/// Value object that represents an identifier. Useful to avoid using
/// primitive types as identifiers which could result in misusing them.
///
/// Example:
/// ```dart
/// class TodoId extends ValueId<String> {
///  const TodoId(super.value);
/// }
/// ```
/// {@endtemplate}
abstract class ValueId<T> extends Equatable {
  /// {@macro value_id}
  const ValueId(this.value);

  /// The actual value of the identifier.
  final T value;

  @override
  List<Object?> get props => [value];

  @override
  String toString() => '$runtimeType($value)';
}
