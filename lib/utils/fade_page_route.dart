import 'package:flutter/material.dart';
import 'package:flutter_movies_explore/utils/fade_in_page_transition.dart';

class FadePageRoute<T> extends PageRoute<T> {
    final Builder builder;

	FadePageRoute({
		@required this.builder,
		RouteSettings settings,
		bool fullscreenDialog = false,
	})  : assert(builder != null),
			assert(fullscreenDialog != null),
			assert(opaque),
			super(settings: settings, fullscreenDialog: fullscreenDialog);
	
	@override
	Duration get transitionDuration => const Duration(milliseconds: 400);
	
	@override
	Widget buildTransitions(BuildContext context, Animation<double> animation,
		Animation<double> secondaryAnimation, Widget child) {
		return FadeInPageTransition(routeAnimation: animation, child: child);
	}

  @override
  // TODO: implement barrierColor
  Color get barrierColor => null;

  @override
  // TODO: implement barrierLabel
  String get barrierLabel => null;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    // TODO: implement buildPage
    return null;
  }

  @override
  // TODO: implement maintainState
  bool get maintainState => true;
}