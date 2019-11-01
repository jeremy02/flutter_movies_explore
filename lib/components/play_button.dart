import 'package:flutter/material.dart';

class PlayButton extends StatelessWidget{
	
	final double buttonSize;
	final double iconSize;
	final Color buttonColor;
	final Color splashColor;

    const PlayButton({Key key, this.buttonSize, this.iconSize, this.buttonColor, this.splashColor}) : super(key: key);
	
	@override
	Widget build(BuildContext context) {
		return ClipOval(
			child: Material(
				color: buttonColor,
				child: InkWell(
					splashColor: splashColor,
					child: SizedBox(
						width: buttonSize,
						height: buttonSize,
						child: Icon(
							Icons.play_arrow,
							color: Colors.white,
							size: iconSize,
						),
					),
					onTap: () {},
				),
			),
		);
	}
}