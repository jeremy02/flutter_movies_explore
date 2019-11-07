import 'package:flutter/material.dart';

class FadeInPageTransition extends StatelessWidget {
	FadeInPageTransition({
		Key key,
		@required Animation<double> routeAnimation,
		@required this.child,
	})  : _opacityAnimation = routeAnimation.drive(_easeInTween),
			super(key: key);
	
	static final Animatable<double> _easeInTween =
	CurveTween(curve: Curves.easeIn);
	final Animation<double> _opacityAnimation;
	final Widget child;
	
	@override
	Widget build(BuildContext context) {
		return FadeTransition(
			opacity: _opacityAnimation,
			child: child,
		);
	}
}