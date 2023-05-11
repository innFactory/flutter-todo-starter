import 'dart:async';

import 'package:app/form/application/reactive_form_controller.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:reactive_forms/reactive_forms.dart';

typedef ReactiveFormStateLoadedBuilder<Domain,
        Form extends TypedFormGroup<Domain>>
    = Widget Function(ReactiveFormStateLoaded<Domain, Form> formState);

typedef ReactiveFormFailureBuilder = Widget Function(Failure failure);

typedef ReactiveFormWillPopCallback<Domain, Form extends TypedFormGroup<Domain>>
    = FutureOr<bool> Function()? Function(
  ReactiveFormStateLoaded<Domain, Form> formState,
);

typedef ReactiveFormDirtyWillPopCallback = FutureOr<bool> Function();

typedef ReactiveFormWrapperBuilder<Domain, Form extends TypedFormGroup<Domain>>
    = Widget Function(BuildContext context,
        ReactiveFormState<Domain, Form> formState, Widget child);

typedef ReactiveFormFocusBuilder<Form> = List<FormControl<dynamic>> Function(
  Form form,
);

class ReactiveFormView<Domain, Form extends TypedFormGroup<Domain>>
    extends ConsumerWidget {
  const ReactiveFormView({
    super.key,
    required this.provider,
    required this.builder,
    this.wrapperBuilder,
    this.onSubmitFailure,
    this.onSubmitSuccess,
    this.errorBuilder,
    this.loadingBuilder,
    this.onWillPop,
    this.onDirtyWillPop,
    this.focusBuilder,
  });

  final ProviderListenable<ReactiveFormState<Domain, Form>> provider;

  /// The widget to show when the form is loaded.
  ///
  /// Will already be wrapped in a [ReactiveForm] widget.
  final ReactiveFormStateLoadedBuilder<Domain, Form> builder;

  /// Builder that wraps the entire form. Helpful if you want to e.g. add
  /// a [Scaffold] around the form which depends on the form state.
  final ReactiveFormWrapperBuilder<Domain, Form>? wrapperBuilder;

  /// The widget to show when the form is in an error state.
  /// If not provided, the default is a [Text] widget with the error message.
  final ReactiveFormFailureBuilder? errorBuilder;

  /// The widget to show when the form is loading.
  /// If not provided, the default is a [ProProgressIndicator].
  final WidgetBuilder? loadingBuilder;

  /// Can be used to return a custom will pop handler based on the current
  /// form state.
  ///
  /// Takes precedence over [onDirtyWillPop].
  final ReactiveFormWillPopCallback<Domain, Form>? onWillPop;

  /// Called when the form state is dirty and the user tries to pop the page.
  ///
  /// May be overridden by [onWillPop].
  final ReactiveFormDirtyWillPopCallback? onDirtyWillPop;

  /// Executed when the form was submitted successfully.
  final ValueChanged<Domain>? onSubmitSuccess;

  /// Executed when the form was submitted unsuccessfully.
  final ValueChanged<Failure>? onSubmitFailure;

  /// The [FocusNode]s in the order they appear in the form.
  final ReactiveFormFocusBuilder<Form>? focusBuilder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<ReactiveFormState<Domain, Form>>(provider, (previous, next) {
      final previousValue = previous?.mapOrNull(
        (value) => value.submitFailureOrSuccess,
      );
      final nextValue = next.mapOrNull(
        (value) => value.submitFailureOrSuccess,
      );

      if (previousValue != nextValue) {
        nextValue?.fold(
          (failure) {
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              onSubmitFailure?.call(failure);
            });
          },
          (value) {
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              onSubmitSuccess?.call(value);
            });
          },
        );
      }
    });

    final formState = ref.watch(provider);

    return formState.map(
      (value) {
        return HookBuilder(
          builder: (context) {
            final nodes = useState<List<FocusNode>?>(null);

            void updateNodes() {
              nodes.value = focusBuilder
                  ?.call(value.form)
                  .map((e) => e.focusController?.focusNode)
                  .whereNotNull()
                  .toList();
            }

            useEffect(() {
              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                updateNodes();
              });

              final sub = value.form.valueChanges.listen((event) {
                updateNodes();
              });

              return sub.cancel;
            }, []);

            return LayoutBuilder(builder: (context, constraints) {
              return _FormControlInheritedStreamer(
                control: value.form as AbstractControl<Object>,
                stream: value.form.statusChanged,
                child: WillPopScope(
                  onWillPop: value.isSubmitting
                      ? () async => false
                      : onWillPop?.call(value)?.let((cb) => () async => cb()) ??
                          (onDirtyWillPop != null && !value.isPristine
                              ? () async => onDirtyWillPop!()
                              : null),
                  child: KeyboardActions(
                    tapOutsideBehavior: TapOutsideBehavior.translucentDismiss,
                    keepFocusOnTappingNode: true,
                    config: KeyboardActionsConfig(
                      keyboardBarColor: Theme.of(context).colorScheme.surface,
                      actions: [
                        ...?nodes.value
                            ?.map(
                                (node) => KeyboardActionsItem(focusNode: node))
                            .toList(),
                      ],
                      defaultDoneWidget: Text(
                        context.translate('actions.done'),
                      ),
                    ),
                    child: ConstrainedBox(
                      constraints: constraints,
                      child: builder(value),
                    ),
                  ),
                ),
              );
            });
          },
        );
      },
      loading: (_) {
        if (loadingBuilder != null) {
          return loadingBuilder!(context);
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
      error: (value) {
        if (errorBuilder != null) {
          return errorBuilder!(value.failure);
        }

        return Center(
          child: Text(
            value.toString(),
            textAlign: TextAlign.center,
          ),
        );
      },
    );
  }
}

class _FormControlInheritedStreamer extends InheritedStreamer<dynamic> {
  const _FormControlInheritedStreamer({
    Key? key,
    required this.control,
    required Stream<dynamic> stream,
    required Widget child,
  }) : super(stream, child, key: key);

  /// The control that this widget will be listening to.
  final AbstractControl<Object> control;
}
