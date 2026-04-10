import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:co_stock/application/blocs/auth_bloc/auth_bloc.dart';
import 'package:co_stock/application/controllers/bloc_text_field_controller.dart';
import 'package:co_stock/domain/errors/validation/validators.dart';
import 'package:co_stock/domain/screens_entities/auth_screen/auth_method.dart';
import 'package:co_stock/domain/screens_entities/auth_screen/auth_mode.dart';
import 'package:co_stock/domain/widget_entities/field_state.dart';
import 'package:co_stock/presentation/navigation/app_router.dart';
import 'package:co_stock/presentation/widgets/app_segmented_button.dart';
import 'package:co_stock/presentation/widgets/text_field/auth_method_bloc_text_field_builder.dart';
import 'package:co_stock/presentation/widgets/text_field/bloc_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart' show FpdartOnIterable;

part 'auth_form.dart';

part 'widgets/enter_details_view.dart';

part 'widgets/enter_identifier_view.dart';

part 'widgets/enter_name_view.dart';

part 'widgets/auth_mode_switcher.dart';

@RoutePage()
class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create: (_) => AuthBloc(),
      child: const AuthForm(),
    );
  }
}
