import 'package:flutter/widgets.dart';
import 'package:flutter101/animation/animation_page.dart';
import 'package:flutter101/animation/hero_animation_page.dart';
import 'package:flutter101/animation/progress_animation_page.dart';
import 'package:flutter101/animation/scale_animatedbuilder_page.dart';
import 'package:flutter101/animation/scale_animatedbuilder_refactor_page.dart';
import 'package:flutter101/animation/scale_animatedwidget_page.dart';
import 'package:flutter101/animation/scale_animation_page.dart';
import 'package:flutter101/http/http_page.dart';
import 'package:flutter101/json_parse/automatic_parse/automatic_parse_page.dart';
import 'package:flutter101/json_parse/manual_parse/manual_parse_page.dart';
import 'package:flutter101/json_parse/json_parse_page.dart';
import 'package:flutter101/main.dart';
import 'package:flutter101/mvvm/mvvm_page.dart';
import 'package:flutter101/route/common_route_page.dart';
import 'package:flutter101/route/named_route_page.dart';

class RouteNames {
  static const String homePage = '/';
  static const String commonRoutePage = 'commonRoutePage';
  static const String namedRoutePage = 'namedRoutePage';
  static const String namedRouteTestPage = 'namedRouteTestPage';
  static const String mvvmPage = 'mvvmPage';
  static const String jsonParsePage = 'jsonParsePage';
  static const String jsonManualParsePage = 'jsonManualParsePage';
  static const String jsonAutomaticParsePage = 'jsonAutomaticParsePage';
  static const String httpPage = 'httpPage';
  static const String animationPage = 'animationPage';
  static const String progressAnimationPage = 'progressAnimationPage';
  static const String scaleAnimationPage = 'scaleAnimationPage';
  static const String scaleAnimatedWidgetPage = 'scaleAnimatedWidgetPage';
  static const String scaleAnimatedBuilderPage = 'scaleAnimatedBuilderPage';
  static const String scaleAnimatedBuilderRefactorPage = 'scaleAnimatedBuilderRefactorPage';
  static const String heroAnimationPage = 'heroAnimationPage';
}

class RouteConfig {
  static final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
    RouteNames.homePage: (BuildContext context) => HomePage(),
    RouteNames.commonRoutePage : (BuildContext context) => CommonRoutePage(),
    RouteNames.namedRoutePage : (BuildContext context) => NamedRoutePage(),
    RouteNames.namedRouteTestPage : (BuildContext context) => NamedRouteTestPage(),
    RouteNames.mvvmPage : (BuildContext context) => MVVMPage(),
    RouteNames.jsonParsePage: (context) => JsonParsePage(),
    RouteNames.jsonManualParsePage: (context) => ManualParsePage(),
    RouteNames.jsonAutomaticParsePage: (context) => AutomaticParsePage(),
    RouteNames.httpPage: (context) => HttpPage(),
    RouteNames.animationPage: (context) => AnimationPage(),
    RouteNames.progressAnimationPage: (context) => ProgressAnimationPage(),
    RouteNames.scaleAnimationPage: (context) => ScaleAnimationPage(),
    RouteNames.scaleAnimatedWidgetPage: (context) => ScaleAnimatedWidgetPage(),
    RouteNames.scaleAnimatedBuilderPage: (context) => ScaleAnimatedBuilderPage(),
    RouteNames.scaleAnimatedBuilderRefactorPage: (context) => ScaleAnimatedBuilderRefactorPage(),
    RouteNames.heroAnimationPage: (context) => HeroAnimationPage(),
  };
}