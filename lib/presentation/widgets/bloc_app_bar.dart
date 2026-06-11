import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Используется для создания своего [AppBar] с системой Bloc
class BlocAppBar<B extends BlocBase<S>, S> extends StatelessWidget
    implements PreferredSizeWidget {
  final bool Function(S p, S c)? buildWhen;
  final Widget Function(BuildContext context, S state) builder;

  const BlocAppBar({super.key, this.buildWhen, required this.builder});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<B, S>(
      buildWhen: buildWhen,
      builder: builder,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
