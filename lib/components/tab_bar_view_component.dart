import 'package:flutter/material.dart';
import 'package:flutter_movies_explore/components/hero_title.dart';
import 'package:flutter_movies_explore/components/play_button.dart';
import 'package:flutter_movies_explore/models/movie.dart';
import 'package:flutter_movies_explore/utils/view_state.dart';

class TabBarViewComponent extends StatelessWidget{
	
	final Movie movieDetail;

    const TabBarViewComponent({Key key, this.movieDetail}) : super(key: key);
    
	@override
	Widget build(BuildContext context) {
		return Stack(
			children: <Widget>[
				Positioned(
					bottom: MediaQuery.of(context).size.height/2.5,
					right: MediaQuery.of(context).size.width/2.25,
					child: PlayButton(
						buttonSize: 60.0,
						iconSize: 40.0,
						buttonColor: Color.fromRGBO(231, 0, 0, 1),
						splashColor: Colors.white.withOpacity(0.2),
					),
				),
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
					Hero(
						tag: movieDetail.title,
						child: HeroTitle(
							title: movieDetail.title,
							viewState: ViewState.enlarged,
							textColor: Colors.white,
							fontWeight: FontWeight.bold,
							maxLines: 1,
						),
					),
					Padding(
						padding: EdgeInsets.fromLTRB(0.0, 10.0, 0, 16.0),
						child: Row(
							children: <Widget>[
								Text(
									movieDetail.language,
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
									movieDetail.genre,
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
							"${movieDetail.overview}",
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
}