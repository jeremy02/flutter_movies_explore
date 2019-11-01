import 'package:flutter/material.dart';

class PlayButton extends StatelessWidget{
	
	final double buttonSize;
	final Color buttonBg;
	final double buttonPadding;

    const PlayButton({Key key, this.buttonSize, this.buttonBg, this.buttonPadding}) : super(key: key);
	
	@override
	Widget build(BuildContext context) {
		return RawMaterialButton(
		    onPressed: () {
			    print("Played");
		    },
		    child: Icon(
			    Icons.play_arrow,
			    color: Colors.white,
			    size: buttonSize,
		    ),
		    shape: CircleBorder(),
		    elevation: 2.0,
		    fillColor: buttonBg,
		    padding:EdgeInsets.all(buttonPadding),
		);
	}
}