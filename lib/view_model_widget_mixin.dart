import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

mixin ViewModelWidgetMixin<T> {

  bool reactive = true;

  Widget build(BuildContext context) =>
      buildViewModelWidget(context, Provider.of<T>(context, listen: reactive));

  Widget buildViewModelWidget(BuildContext context, T model);
}