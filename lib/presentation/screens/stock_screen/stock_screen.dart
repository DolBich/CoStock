import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class StockScreen extends StatelessWidget {
  final String stockId;
  const StockScreen(this.stockId, {super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
