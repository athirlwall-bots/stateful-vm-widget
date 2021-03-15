# stateful-view-model-widget

Attempt at a Stateful View Model Widget

## Introduction

Widget is called MyStatefulViewModelWidget and is rendered as part of _MyHomePageState in main.dart

This version implements optional reactivity as a parameter to the main widget, but if it is known in advance that the widget will always be either reactive or non-reactive, the State constructor could be:

_MyStatefulViewModelWidgetState() {
    this.reactive = true; // or false


The mixin allows the widget to resemble a "normal" stateful widget complete with lifecycle methods (initState, setState etc).

The ViewModel is the same instance each time it is updated, In the test app, when the counter is increased, the ViewModel parameter is compared to the previous ViewModel parameter to see if it is the same ('identical') instance. It can be seen when debugging that it is.

## Possible improvements

Use an abstract class instead of a mixin. But this proved to be troublesome due to the dual nature of stateful widgets (a main widget plus a state widget). I ended up needed two abstract classes (one for each), and it got confusing quickly. I encourage the reader to have a go!
