import 'package:flutter/material.dart';

class BlurredContainer extends StatelessWidget{
	
	final Alignment alignment;
	final double height;
	final double verticalOffset;
	final Color color;

    const BlurredContainer({Key key, this.alignment, this.height, this.verticalOffset, this.color}) : super(key: key);
	
	@override
	Widget build(BuildContext context) {
		return Align(
			alignment: alignment,
			child: Container(
				width: double.infinity,
				height: height,
				decoration: BoxDecoration(
					boxShadow: [
						BoxShadow(
							color: color,
							blurRadius: 40.0,// has the effect of softening the shadow
							spreadRadius: 5.0,// has the effect of extending the shadow
							offset: Offset(
								0.0, // horizontal, move right 10
								verticalOffset, // vertical, move down 10
							),
						),
					],
				),
			),
		);
	}
}