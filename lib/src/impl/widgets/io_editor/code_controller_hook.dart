import 'package:code_text_field/code_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:highlight/highlight_core.dart';

class _CodeControllerHookCreator {
  const _CodeControllerHookCreator();

  /// Creates a [CodeController] that will be disposed automatically.
  ///
  /// The [text] parameter can be used to set the initial value of the
  /// controller.
  CodeController call({String? text, Mode? language, List<Object?>? keys}) {
    return use(_CodeControllerHook(text, language, keys));
  }
}

/// Creates a [CodeController], with an optional initial text.
///
/// To use a [CodeController] with an optional initial text, use:
/// ```dart
/// final controller = useCodeController(text: 'initial text');
/// ```
///
/// Changing the text or initial value after the widget has been built has no
/// effect whatsoever. To update the value in a callback, for instance after a
/// button was pressed, use the [CodeController.text] or
/// [CodeController.value] setters. To have the [CodeController]
/// reflect changing values, you can use [useEffect]. This example will update
/// the [CodeController.text] whenever a provided [ValueListenable]
/// changes:
/// ```dart
/// final controller = useCodeController();
/// final update = useValueListenable(myTextControllerUpdates);
///
/// useEffect(() {
///   controller.text = update;
/// }, [update]);
/// ```
///
/// See also:
/// - [CodeController], which this hook creates.
const useCodeController = _CodeControllerHookCreator();

class _CodeControllerHook extends Hook<CodeController> {
  const _CodeControllerHook(
    this.initialText,
    this.language, [
    List<Object?>? keys,
  ]) : super(keys: keys);

  final String? initialText;
  final Mode? language;

  @override
  _CodeControllerHookState createState() {
    return _CodeControllerHookState();
  }
}

class _CodeControllerHookState
    extends HookState<CodeController, _CodeControllerHook> {
  late final _controller =
      CodeController(text: hook.initialText, language: hook.language);

  @override
  CodeController build(BuildContext context) => _controller;

  @override
  void dispose() => _controller.dispose();

  @override
  String get debugLabel => 'useCodeController';
}
