import 'package:components/src/pages/animated_container.dart';
import 'package:components/src/pages/card_page.dart';
import 'package:components/src/pages/input_page.dart';
import 'package:components/src/pages/listview_page.dart';
import 'package:components/src/pages/slider_page.dart';
import 'package:flutter/material.dart';
import 'package:components/src/pages/alertas_page.dart';
import 'package:components/src/pages/avatar_page.dart';
import 'package:components/src/pages/home_page.dart';

Map<String, WidgetBuilder> getAplicationRoutes() {
  return <String, WidgetBuilder>{
    'home': (context) => const HomePage(),
    'alert': (context) => const AlertaPage(),
    'avatar': (context) => const AvatarPage(),
    'card': (context) => const CardPage(),
    'animatedContainer': (context) => const AnimePage(),
    'input': (context) => const InputPage(),
    'slider': (context) => const SliderPage(),
    'list': (context) => const ListPage(),
  };
}
