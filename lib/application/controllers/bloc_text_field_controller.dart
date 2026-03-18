class BlocTextFieldController {
  void Function(String)? _updateValue;
  bool Function()? _validate;
  void Function()? _submit;

  void attach({
    required void Function(String) updateValue,
    required bool Function() validate,
    required void Function() submit,
  }) {
    _updateValue = updateValue;
    _validate = validate;
    _submit = submit;
  }

  void updateValue(String value) => _updateValue?.call(value);
  bool validate() => _validate?.call() ?? false;
  void submit() => _submit?.call();

  void dispose() {
    _updateValue = null;
    _validate = null;
    _submit = null;
  }
}