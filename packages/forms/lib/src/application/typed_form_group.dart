part of 'reactive_form_controller.dart';

typedef FormControls = List<TypedFormBase<Object?>>;

typedef SelectValue<T, R> = R Function(T value);
typedef CreateControl<T, R, C> = C Function(R value);
typedef OnControlValueChanged<T> = void Function(T value);

class _ControlWrapper<T, R> {
  _ControlWrapper({
    required this.control,
    required this.select,
    required OnControlValueChanged<R>? onControlValueChanged,
  }) : _valueChangesSubscription =
            onControlValueChanged?.let(control.valueChanges.listen);

  final TypedFormBase<R> control;
  final SelectValue<T, R> select;
  final StreamSubscription<R>? _valueChangesSubscription;

  void updateValue(T value) {
    control.updateValue(select(value));
  }

  void patchValue(T value) {
    control.patchValue(select(value));
  }

  void dispose() {
    _valueChangesSubscription?.cancel();
  }
}

class _ControlCreate<TDomain, TValue> {
  _ControlCreate(this.form, this.key, this.select);

  final TypedFormGroup<TDomain> form;
  final String key;
  final SelectValue<TDomain, TValue> select;

  C call<C extends TypedFormBase<TValue>>(
    C Function(TValue value) create, {
    OnControlValueChanged<TValue>? onControlValueChanged,
  }) {
    if (!form._controlWrapperByKey.containsKey(key)) {
      final control = create(select(form.initialValue));
      final wrapper = _ControlWrapper<TDomain, TValue>(
        control: control,
        select: select,
        onControlValueChanged: onControlValueChanged,
      );
      form._addAll({key: wrapper});
    }

    return form._controlWrapperByKey[key]!.control as C;
  }
}

abstract class TypedFormGroup<TDomain> extends AbstractControl<TDomain>
    with TypedFormBase {
  TypedFormGroup(
    TDomain value, {
    super.disabled,
    super.asyncValidatorsDebounceTime,
  })  : initialValue = value,
        _value = value;

  final Map<String, _ControlWrapper<dynamic, dynamic>> _controlWrapperByKey =
      {};
  final TDomain initialValue;
  TDomain _value;

  List<TypedFormBase<Object?>> get _controls =>
      _controlWrapperByKey.values.map((e) => e.control).toList(growable: false);

  _ControlCreate<TDomain, R> createControl<R>(
    String key,
    R Function(TDomain value) select,
  ) {
    return _ControlCreate<TDomain, R>(this, key, select);
  }

  final _collectionChanges =
      StreamController<List<AbstractControl<Object?>>>.broadcast();

  Stream<List<AbstractControl<Object?>>> get collectionChanges =>
      _collectionChanges.stream;

  /// Notify to listeners that the collection changed.
  ///
  /// This is for internal use only.
  @protected
  void emitsCollectionChanged(List<AbstractControl<Object?>> controls) {
    _collectionChanges.add(List.unmodifiable(controls));
  }

  /// Walks the [path] to find the matching control.
  ///
  /// Returns null if no match is found.
  AbstractControl<dynamic>? findControlInCollection(List<String> path) {
    if (path.isEmpty) {
      return null;
    }

    final result = path.fold<AbstractControl<dynamic>?>(this, (control, name) {
      if (control != null && control is FormControlCollection<dynamic>) {
        return control.contains(name) ? control.control(name) : null;
      } else {
        return null;
      }
    });

    return result;
  }

  /// Close stream that emit collection change events
  void closeCollectionEvents() {
    _collectionChanges.close();
  }

  @override
  @protected
  List<Validator<dynamic>> get validators => const [];

  @override
  @protected
  List<AsyncValidator<dynamic>> get asyncValidators => const [];

  @override
  TDomain get value => toDomain(_value);

  @override
  set value(covariant TDomain value) => updateValue(value);

  @protected
  TDomain toDomain(TDomain previousValue);

  @protected
  TDomain applyFormGroupsToDomain(
    List<TypedFormGroup<TDomain>> formGroups,
    TDomain previousValue,
  ) {
    return formGroups.fold(
      previousValue,
      (previousValue, formGroup) => formGroup.toDomain(previousValue),
    );
  }

  @override
  void updateValue(
    covariant TDomain value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    _value = value;
    for (final wrapper in _controlWrapperByKey.values) {
      wrapper.updateValue(value);
    }
  }

  @override
  void patchValue(
    covariant TDomain value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    _value = value;
    for (final wrapper in _controlWrapperByKey.values) {
      wrapper.patchValue(value);
    }
  }

  void _addAll(Map<String, _ControlWrapper<dynamic, dynamic>> controls) {
    _controlWrapperByKey.addAll(controls);

    for (final wrappers in controls.values) {
      wrappers.control.parent = this;
    }

    updateTouched();
    updatePristine();
    emitsCollectionChanged(_controls);
  }

  // @override
  // bool contains(String name) {
  //   return _controlWrapperByKey.containsKey(name);
  // }

  // @override
  // AbstractControl<dynamic> control(String name) {
  //   final namePath = name.split('.');
  //   if (namePath.length > 1) {
  //     final control = findControlInCollection(namePath);
  //     if (control != null) {
  //       return control;
  //     }
  //   } else if (contains(name)) {
  //     return _controlWrapperByKey[name]!.control;
  //   }

  //   throw FormControlNotFoundException(controlName: name);
  // }

  @override
  TDomain reduceValue() => toDomain(_value);

  @override
  void markAsDisabled({bool updateParent = true, bool emitEvent = true}) {
    for (final control in _controls) {
      control.markAsDisabled(emitEvent: emitEvent);
    }
    super.markAsDisabled(updateParent: updateParent, emitEvent: emitEvent);
  }

  @override
  void markAsEnabled({bool updateParent = true, bool emitEvent = true}) {
    for (final control in _controls) {
      control.markAsEnabled(emitEvent: emitEvent);
    }
    super.markAsEnabled(updateParent: updateParent, emitEvent: emitEvent);
  }

  @override
  bool allControlsDisabled() {
    if (_controls.isEmpty) return false;
    return _controls.every((control) => control.disabled);
  }

  @override
  bool anyControlsHaveStatus(ControlStatus status) {
    return _controls.any((control) => control.status == status);
  }

  @override
  Map<String, Object> get errors {
    final allErrors = Map<String, Object>.of(super.errors);
    _controlWrapperByKey.forEach((name, wrapper) {
      if (wrapper.control.enabled && wrapper.control.hasErrors) {
        allErrors.update(
          name,
          (_) => wrapper.control.errors,
          ifAbsent: () => wrapper.control.errors,
        );
      }
    });
    return allErrors;
  }

  @override
  void focus([String name = '']) {
    if (name.isNotEmpty) {
      final control = findControlInCollection(name.split('.'));
      if (control != null) {
        control.focus();
      }
    } else if (_controls.isNotEmpty) {
      _controls.firstOrNull?.focus();
    }
  }

  @override
  void forEachChild(void Function(AbstractControl<Object?>) callback) {
    _controlWrapperByKey.forEach((name, wrapper) => callback(wrapper.control));
  }

  @override
  bool anyControls(bool Function(AbstractControl<Object?>) condition) {
    return _controls.any((control) => control.enabled && condition(control));
  }

  @override
  AbstractControl<Object?>? findControl(String path) =>
      findControlInCollection(path.split('.'));

  @override
  void dispose() {
    for (final wrapper in _controlWrapperByKey.values) {
      wrapper.dispose();
    }
    super.dispose();
  }
}
