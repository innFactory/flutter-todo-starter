part of 'reactive_form_controller.dart';

class TypedFormArray<TDomain, TControl extends TypedFormBase<TDomain>>
    extends AbstractControl<List<TControl>>
    with FormControlCollection<TControl>, TypedFormBase {
  TypedFormArray(
    List<TControl> forms, {
    super.asyncValidators,
    super.validators,
    super.asyncValidatorsDebounceTime,
    super.disabled,
    super.touched,
  }) {
    addAll(forms);

    if (disabled) {
      markAsDisabled(emitEvent: false);
    }
  }

  final List<TControl> _forms = [];

  @override
  List<TControl> get value => _forms;

  List<TDomain> get domainValue =>
      value.map((e) => e.value).whereType<TDomain>().toList();

  int get length => _forms.length;

  @override
  set value(covariant List<TControl> value) {
    _forms.clear();
    addAll(value);
    updateValueAndValidity();
    emitsCollectionChanged(_forms);
  }

  @override
  void markAsDisabled({bool updateParent = true, bool emitEvent = true}) {
    for (final form in _forms) {
      form.markAsDisabled(emitEvent: emitEvent);
    }
    super.markAsDisabled(updateParent: updateParent, emitEvent: emitEvent);
  }

  @override
  void markAsEnabled({bool updateParent = true, bool emitEvent = true}) {
    forEachChild((control) {
      control.markAsEnabled(emitEvent: emitEvent);
    });
    super.markAsEnabled(updateParent: updateParent, emitEvent: emitEvent);
  }

  void insert(
    int index,
    TControl form, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    form.parent = this;
    _forms.insert(index, form);

    updateValueAndValidity(
      emitEvent: emitEvent,
      updateParent: updateParent,
    );

    if (emitEvent) {
      emitsCollectionChanged(_forms);
    }
  }

  void add(TControl form, {bool updateParent = true, bool emitEvent = true}) {
    addAll([form], emitEvent: emitEvent, updateParent: updateParent);
  }

  void addAll(
    List<TControl> forms, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    _forms.addAll(forms);
    for (final form in _forms) {
      form.parent = this;
    }

    updateValueAndValidity(updateParent: updateParent, emitEvent: emitEvent);
    emitsCollectionChanged(_forms);
  }

  void insertAll(
    int index,
    List<TControl> forms, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    _forms.insertAll(index, forms);
    for (final form in _forms) {
      form.parent = this;
    }

    updateValueAndValidity(
      updateParent: updateParent,
      emitEvent: emitEvent,
    );
    emitsCollectionChanged(_forms);
  }

  void removeAt(int index, {bool emitEvent = true, bool updateParent = true}) {
    _forms.removeAt(index);
    updateValueAndValidity(emitEvent: emitEvent, updateParent: updateParent);
    if (emitEvent) {
      emitsCollectionChanged(_forms);
    }
  }

  @override
  bool contains(String name) {
    final index = int.tryParse(name);
    if (index != null && index < _forms.length) {
      return true;
    }

    return false;
  }

  @override
  AbstractControl<dynamic> control(String name) {
    final namePath = name.split('.');
    if (namePath.length > 1) {
      final control = findControlInCollection(namePath);
      if (control != null) {
        return control;
      }
    } else {
      final index = int.tryParse(name);
      if (index == null) {
        throw FormArrayInvalidIndexException(name);
      } else if (index < _forms.length) {
        return _forms[index];
      }
    }

    throw FormControlNotFoundException(controlName: name);
  }

  @override
  void dispose() {
    forEachChild((control) {
      control.parent = null;
      control.dispose();
    });
    closeCollectionEvents();
    super.dispose();
  }

  void forEachForm(ValueChanged<TControl> callback) => _forms.forEach(callback);

  @override
  bool allControlsDisabled() {
    if (_forms.isEmpty) {
      return false;
    }
    return _forms.every((control) => control.disabled);
  }

  @override
  bool anyControlsHaveStatus(ControlStatus status) {
    return _forms.any((control) => control.status == status);
  }

  @override
  Map<String, Object> get errors {
    final allErrors = Map<String, Object>.of(super.errors);
    _forms.asMap().forEach((name, control) {
      if (control.enabled && control.hasErrors) {
        allErrors.update(
          name.toString(),
          (_) => control.errors,
          ifAbsent: () => control.errors,
        );
      }
    });
    return allErrors;
  }

  @override
  void updateValue(
    covariant List<TControl> value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    _forms.mapIndexed((index, element) {
      element.updateValue(value[index].value, emitEvent: emitEvent);
    });
    emitsCollectionChanged(_forms);
  }

  @override
  void patchValue(
    covariant List<TControl> value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    _forms.clear();
    addAll(value);
  }

  @override
  List<TControl>? reduceValue() {
    return _forms.where((form) => form.enabled || disabled).toList();
  }

  @override
  void focus([String name = '']) {
    if (name.isNotEmpty) {
      final control = findControlInCollection(name.split('.'));
      if (control != null) {
        control.focus();
      }
    } else if (_forms.isNotEmpty) {
      _forms.first.focus();
    }
  }

  @override
  void forEachChild(void Function(TControl form) callback) {
    for (final form in _forms) {
      callback(form);
    }
  }

  @override
  bool anyControls(bool Function(TControl form) condition) {
    return _forms.any((control) => control.enabled && condition(control));
  }

  @override
  AbstractControl<dynamic>? findControl(String path) =>
      findControlInCollection(path.split('.'));
}
