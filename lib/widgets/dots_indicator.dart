import 'dart:math';

import 'package:flutter/material.dart';

/// An indicator showing the currently selected page of a PageController
class DotsIndicator extends AnimatedWidget {
	DotsIndicator({
		this.controller,
		this.itemCount,
		this.color: Colors.white,
		this.currentIndex,
	}) : super(listenable: controller);
	
	/// The ScrollController that this DotsIndicator is representing.
	final ScrollController controller;
	
	/// The number of items managed by the PageController
	final int itemCount;
	
	/// The color of the dots Defaults to `Colors.white`.
	final Color color;
	
	// the position that the scroll controller is at
	final int currentIndex;
	
	// The base size of the dots
	static const double _kDotSize = 6.0;
	
	// The increase in the size of the selected dot
	static const double _kMaxZoom = 2.0;
	
	// The distance between the center of each dot
	static const double _kDotSpacing = 16.0;
	
	Widget _buildDot(int index) {
		double selectedness = Curves.easeOut.transform(
			max(
				0.0,
				1.0 - ((currentIndex ?? currentIndex-1) - index).abs(),
			),
		);
		
		double zoom = (1.0 + (_kMaxZoom - 1.0) * selectedness) * 1.2;
		
		return Container(
			width: _kDotSpacing,
			child: Center(
				child: Material(
					color: color,
					type: MaterialType.circle,
					child: Container(
						width: _kDotSize/(index*0.6) * zoom,
						height: _kDotSize * zoom,
						decoration: BoxDecoration(
							color: index == currentIndex ? Colors.white : Colors.grey.shade500,
							shape: BoxShape.circle,
						),
					),
				),
			),
		);
	}
	
	Widget build(BuildContext context) {
		return Row(
			mainAxisAlignment: MainAxisAlignment.center,
			children: List<Widget>.generate(itemCount, _buildDot),
		);
	}
}