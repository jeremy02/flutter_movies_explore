import 'package:flutter/material.dart';

class TabBarViewComponent extends StatelessWidget{
	final String movieDetail;

    const TabBarViewComponent({Key key, this.movieDetail}) : super(key: key);
    
	@override
	Widget build(BuildContext context) {
		return Stack(
			children: <Widget>[
				playButton(),
				Positioned(
					bottom: 0.0,
					left: 0.0,
					child: Container(
						height: MediaQuery.of(context).size.height * 0.28,
						decoration: BoxDecoration(
							color: Colors.transparent,
						),
						child: SingleChildScrollView(
							child: _buildInfo(MediaQuery.of(context).size.width),
						),
					),
				),
			],
		);
	}
	
	Widget _buildInfo(double width) {
		return Padding(
			padding: const EdgeInsets.only(left: 16.0, right: 16.0,bottom: 16.0),
			child: Column(
				mainAxisAlignment: MainAxisAlignment.start,
				crossAxisAlignment: CrossAxisAlignment.start,
				children: <Widget>[
					Text(
						"Joker",
						style: TextStyle(
							color: Colors.white,
							fontWeight: FontWeight.bold,
							fontSize: 36.0,
						),
					),
					Text(
						"English | Crime,Fantasy.Thriller",
						style: TextStyle(
							color: Colors.white.withOpacity(0.85),
							fontWeight: FontWeight.w500,
						),
					),
					Container(
						width: width,
							child: Text(
								"Hello, everyone! 👋"+
									
									"What a great movie the JOKER is! I have seen recently. That is why I created this shot. I hope you will like it."+
									
									"What a great movie the JOKER is! I have seen recently. That is why I created this shot. I hope you will like it.",
								style: TextStyle(
									color: Colors.white.withOpacity(0.85),
									fontSize: 16
								),
								softWrap: true,
							),
					),
				],
			),
		);
	}
	
	Widget playButton(){
		return Align(
			alignment: Alignment.center,
			child:RawMaterialButton(
				onPressed: () {
					print("Added");
				},
				child: Icon(
					Icons.play_arrow,
					color: Colors.white,
					size: 28.0,
				),
				shape: CircleBorder(),
				elevation: 2.0,
				fillColor: Colors.red.shade600,
				padding:EdgeInsets.all(12.0),
			),
		);
	}
}