//
export 'package:flutter/material.dart';

export 'package:ui_widgets_utils/ui_widgets_utils.dart';

export 'package:state_set/state_set.dart';

export 'package:example/main.dart';

import 'package:flutter/material.dart' show State, StatefulWidget;

import 'package:state_set/state_set.dart' show StateSet;

/// A State class that takes in the mixin StateSet
abstract class StateX<T extends StatefulWidget> extends State<T>
    with StateSet<T> {}
