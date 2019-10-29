import 'package:flutter/material.dart';

class PlayButton extends StatelessWidget{
	@override
	Widget build(BuildContext context) {
		return RawMaterialButton(
		    onPressed: () {
			    print("Played");
		    },
		    child: Icon(
			    Icons.play_arrow,
			    color: Colors.white,
			    size: 28.0,
		    ),
		    shape: CircleBorder(),
		    elevation: 2.0,
		    fillColor: Colors.red,
		    padding:EdgeInsets.all(12.0),
		);
	}
}