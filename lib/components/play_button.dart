import 'package:flutter/material.dart';
import 'package:flutter_movies_explore/models/movie.dart';
import 'package:flutter_movies_explore/screens/detail_screen.dart';
import 'package:flutter_movies_explore/utils/fade_page_route.dart';

class PlayButton extends StatelessWidget{
	
	final double buttonSize;
	final double iconSize;
	final Color buttonColor;
	final Color splashColor;
	final Movie movieObject;
	final bool isDetail;

    const PlayButton({Key key, this.buttonSize, this.iconSize, this.buttonColor, this.splashColor, this.movieObject, this.isDetail}) : super(key: key);
	
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
					onTap: () {
						isDetail ?
							// should play the movie
							null
						:
							// show the detail screen
							Navigator.of(context).push(
								FadePageRoute(
									fullscreenDialog: true,
									builder: (context) {
										return DetailScreen(
											movieDetail: movieObject,
										);
									}),
							);
					},
				),
			),
		);
	}
}