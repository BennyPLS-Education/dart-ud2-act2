import 'package:flutter/material.dart';

import '../screens/alert.dart';
import '../screens/animated.dart';
import '../screens/avatar.dart';
import '../screens/card.dart';
import '../screens/home.dart';
import '../screens/inputs.dart';
import '../screens/list.dart';
import '../screens/slider.dart';

final _routes = {
  '/': (BuildContext context) => HomePage(),
  'alert': (BuildContext context) => AlertPage(),
  'avatar': (BuildContext context) => AvatarPage(),
  'card': (BuildContext context) => CardPage(),
  'animatedContainer': (BuildContext context) => AnimatedPage(),
  'inputs': (BuildContext context) => InputsPage(),
  'slider': (BuildContext context) => SliderPage(),
  'list' : (BuildContext context) => ListPage(),
};

Map<String, WidgetBuilder> getRoutes() => _routes;
