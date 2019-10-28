import 'package:flutter/material.dart';

class TabBarViewComponent extends StatelessWidget{
	
	final String movieDetail;

    const TabBarViewComponent({Key key, this.movieDetail}) : super(key: key);
    
	@override
	Widget build(BuildContext context) {
		return Stack(
			children: <Widget>[
				playButton(context),
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
					Padding(
						padding: EdgeInsets.fromLTRB(0.0, 10.0, 0, 16.0),
						child: Row(
							children: <Widget>[
								Text(
									"English",
									style: TextStyle(
										color: Colors.white,
										fontWeight: FontWeight.w500,
									),
								),
								Padding(
									padding: EdgeInsets.symmetric(horizontal: 2.0),
									child: Text(
										"|",
										style: TextStyle(
											color: Colors.white,
											fontWeight: FontWeight.w500,
										),
									),
								),
								Text(
									"Crime,Fantasy & Thriller",
									style: TextStyle(
										color: Colors.white,
										fontWeight: FontWeight.w500,
									),
								),
								Container(),
							],
						),
					),
					Container(
						width: width,
						child: Text(
							"Hello, everyone! 👋"+
								"What a great movie the JOKER is! I have seen recently. That is why I created this shot. I hope you will like it."+
								"What a great movie the JOKER is! I have seen recently. That is why I created this shot. I hope you will like it.",
							style: TextStyle(
								color: Colors.white,
								fontSize: 14,
								height: 1.5,
							),
							softWrap: true,
						),
					),
				],
			),
		);
	}
	
	Widget playButton(BuildContext context){
		return Positioned(
			bottom: MediaQuery.of(context).size.height/2.5,
			right: MediaQuery.of(context).size.width/2.65,
			child: RawMaterialButton(
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
			),
		);
	}
}