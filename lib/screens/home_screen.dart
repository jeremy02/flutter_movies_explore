import 'package:flutter/material.dart';
import 'package:flutter_movies_explore/components/custom_app_bar.dart';
import 'package:flutter_movies_explore/components/hero_title.dart';
import 'package:flutter_movies_explore/components/movies_list_component.dart';
import 'package:flutter_movies_explore/components/play_button.dart';
import 'package:flutter_movies_explore/models/movie.dart';
import 'package:flutter_movies_explore/screens/detail_screen.dart';
import 'package:flutter_movies_explore/utils/constants.dart';
import 'package:flutter_movies_explore/utils/fade_page_route.dart';
import 'package:flutter_movies_explore/utils/view_state.dart';
import 'package:flutter_movies_explore/widgets/blurred_container.dart';
import 'dart:math';

class HomeScreen extends StatefulWidget{
	@override
	HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen>{
	
	Movie firstMovie;
	
	@override
	void initState() {
		super.initState();
		
		// Random 0 to length of moviesList:
		int minRange = 0;
		int maxRange = moviesList.length-1;
		
		// random number
//		int selection = minRange + (new Random().nextInt(maxRange-minRange));
		// or just get the first movie which is Joker
		int selection = 0;
		
		firstMovie = moviesList[selection];
	}
	
	@override
	void dispose() {
		super.dispose();
	}
	
	
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			backgroundColor: Colors.transparent,
			appBar: PreferredSize(
				preferredSize: Size(
					MediaQuery.of(context).size.width,
					56,
				),
				child: CustomAppBar(showLogo: true, movieTitle: Constants.appName),
			),
			body: Stack(
				fit: StackFit.expand,
				children: <Widget>[
					Hero(
						tag: firstMovie.posterImageUrl,
						child: Image.asset(
							firstMovie.posterImageUrl,
							fit: BoxFit.cover,
						),
					),
					BlurredContainer(alignment: Alignment.bottomCenter, height: MediaQuery.of(context).size.height*0.30, horizontalOffset: 0.0, verticalOffset: 0.0, color: Colors.black.withOpacity(0.75)),
					BlurredContainer(alignment: Alignment.bottomRight, height: MediaQuery.of(context).size.height*0.10, horizontalOffset: 120.0, verticalOffset: 0.0, color: Colors.black.withOpacity(0.75)),
					Positioned(
						bottom: 0.0,
						right: 0.0,
						left: 0.0,
						child: Container(
							width: double.infinity,
							height: MediaQuery.of(context).size.height*0.34,
							margin: EdgeInsets.only(left: 16.0,right: 8.0),
							child: Column(
								mainAxisAlignment: MainAxisAlignment.start,
								children: <Widget>[
									Row(
										crossAxisAlignment: CrossAxisAlignment.start,
										mainAxisAlignment: MainAxisAlignment.spaceBetween,
										children: <Widget>[
											Expanded(
												child: MovieInfoCaption(),
											),
											SizedBox(width: 4.0),
											Padding(
												padding: EdgeInsets.only(right: 8.0),
												child: Hero(
													tag: '${firstMovie.title}-btn',
													child: PlayButton(
														buttonSize: 60.0,
														iconSize: 40.0,
														buttonColor: Color.fromRGBO(231, 0, 0, 1),
														splashColor: Colors.white.withOpacity(0.2),
														movieObject: firstMovie,
														isDetail: false,
													),
												),
											),
										],
									),
									SizedBox(
										height: 12.0,
									),
									Flexible(
										flex: 1,
										child: MoviesList(),
									),
								],
							),
						),
					),
				],
			),
		);
	}
	
	Widget MovieInfoCaption() {
		return Column(
			crossAxisAlignment: CrossAxisAlignment.start,
			children: <Widget>[
				Hero(
					tag: firstMovie.title,
					flightShuttleBuilder: (
						BuildContext flightContext,
						Animation<double> animation,
						HeroFlightDirection flightDirection,
						BuildContext fromHeroContext,
						BuildContext toHeroContext,
						) {
						return HeroTitle(
							title: firstMovie.title,
							isOverflow: false,
							viewState: flightDirection == HeroFlightDirection.push
								? ViewState.enlarge
								: ViewState.shrink,
							smallFontSize: 30.0,
							largeFontSize: 32.0,
						);
					},
					child: HeroTitle(
						title: firstMovie.title,
						viewState: ViewState.shrunk,
						textColor: Colors.white,
						fontWeight: FontWeight.bold,
						smallFontSize: 30.0,
						largeFontSize: 32.0,
						maxLines: 1,
					),
				),
				SizedBox(
					height: 6.0,
				),
				Row(
					children: <Widget>[
						Text(
							firstMovie.language,
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
							firstMovie.genre,
							style: TextStyle(
								color: Colors.white,
								fontWeight: FontWeight.w500,
							),
						),
						Container(),
					],
				),
			],
		);
	}
}