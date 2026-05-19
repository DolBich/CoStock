part of '../auth_screen.dart';

class _AuthModeSwitcher extends StatelessWidget {
  const _AuthModeSwitcher();

  String mainText(AuthMode mode) =>
      mode == .login ? 'Create account' : 'Already have an account?';

  AuthMode modeChanger(AuthMode mode) {
    switch (mode) {
      case .login:
        return .register;
      case .register:
        return .login;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      buildWhen: (p, c) =>
          p.mode != c.mode || p.step != c.step || p.isLoading != c.isLoading,
      builder: (context, state) {
        if (state.step == .registerDetails || state.step == .authenticated) {
          return const SizedBox.shrink();
        }
        final bloc = context.read<AuthBloc>();

        return Row(
          mainAxisAlignment: .center,
          children: [
            TextButton(
              onPressed: () {
                bloc.add(.changeMode(modeChanger(state.mode)));
              },
              child: Text(mainText(state.mode)),
            ),
            if (state.mode == .login) ...[
              const Padding(
                padding: .symmetric(horizontal: 8),
                child: Text('|'),
              ),
              if (state.mode == .login)
                TextButton(
                  onPressed: state.isLoading
                      ? null
                      : () {
                          // TODO: восстановление пароля
                        },
                  child: const Text('Forgot password?'),
                ),
            ],
          ],
        );
      },
    );
  }
}
