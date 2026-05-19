import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:co_stock/application/blocs/groups_bloc/groups_bloc.dart';
import 'package:co_stock/application/handlers/stock/stock_entity_searcher.dart';
import 'package:co_stock/application/services/session_service.dart';
import 'package:co_stock/application/services/stock_tree_service.dart';
import 'package:co_stock/data/local_storage/local_storage_impl/local_storage_service.dart';
import 'package:co_stock/data/repositories/repos/stock_repo/dto/stock_dtos.dart';
import 'package:co_stock/domain/extensions/color_ext.dart';
import 'package:co_stock/domain/screens_entities/groups_screen/sort_filter/sort_filter.dart';
import 'package:co_stock/domain/screens_entities/groups_screen/stock.dart';
import 'package:co_stock/domain/screens_entities/groups_screen/stock_entity.dart';
import 'package:co_stock/presentation/navigation/app_router.dart';
import 'package:co_stock/presentation/screens/groups_screen/widgets/stock_type_ui_ext.dart';
import 'package:co_stock/presentation/widgets/app_segmented_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reorderable_grid/reorderable_grid.dart';

part 'groups_form.dart';
part 'widgets/groups_sort_filter_sheet.dart';
part 'widgets/groups_grid.dart';
part 'widgets/entity_sheet.dart';
part 'widgets/groups_app_bar.dart';
part 'widgets/breadcrumbs.dart';
part 'widgets/stock_card.dart';
part 'widgets/sorted_groups_grid.dart';

@RoutePage()
class GroupsScreen extends StatelessWidget {
  const GroupsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GroupsBloc>(
      create: (_) => GroupsBloc(),
      child: const _GroupsForm(),
    );
  }
}
