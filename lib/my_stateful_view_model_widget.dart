// import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';
import 'main_view_model.dart';
import 'view_model_widget_mixin.dart';
import 'locator.dart';

class MyStatefulViewModelWidget extends StatefulWidget {

  final bool reactive = false;
  final String localStringTest = 'LOCAL';
  Globals globals = locator<Globals>();

  MyStatefulViewModelWidget({Key key, reactive = false}) : super(key: key);

  @override
  _MyStatefulViewModelWidgetState createState() => _MyStatefulViewModelWidgetState(reactive: reactive);
}

class _MyStatefulViewModelWidgetState extends State<MyStatefulViewModelWidget>
  with ViewModelWidgetMixin<MainViewModel> {

  _MyStatefulViewModelWidgetState({reactive = false}) {
    this.reactive = reactive;
  }

  Widget buildViewModelWidget(BuildContext context, MainViewModel model) {
    print('buildViewModelWidget');
    if (widget.globals.modelInstance != null) {
      if (identical(model, widget.globals.modelInstance)) {
        print('Same model');
      }  else {
        print('Different model');
      }
    }
    widget.globals.modelInstance = model;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(model.test),
        Text(widget.localStringTest),
        Text(model.counter.toString())
      ],
    );
  }
}