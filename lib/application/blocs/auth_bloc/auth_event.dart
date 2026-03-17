part of 'auth_bloc.dart';

@freezed
sealed class AuthEvent with _$AuthEvent {
  const factory AuthEvent.init() = _Init;

  const factory AuthEvent.changeMode(AuthMode mode) = _ChangeMode;

  const factory AuthEvent.changeMethod(AuthMethod method) = _ChangeMethod;

  const factory AuthEvent.submitIdentifier() =
      _SubmitIdentifier;

  const factory AuthEvent.submitPassword() = _SubmitPassword;

  const factory AuthEvent.registerDetail({
    required AuthMethod method,
  }) = _RegisterDetail;

  const factory AuthEvent.toggleIdentifier() = _ToggleIdentifier;

  const factory AuthEvent.changeName() = _ChangeName;

  const factory AuthEvent.skipDetails() = _SkipDetails;

  const factory AuthEvent.updateField({
    required AuthField field,
    required FieldState value,
  }) = _UpdateField;

  const factory AuthEvent.checkDetail(AuthMethod method) = _CheckDetail;

  const factory AuthEvent.trySubmit() = _TrySubmit;

  const factory AuthEvent.registerAllDetails() = _RegisterAllDetails;
}
