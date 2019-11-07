import 'package:flutter/material.dart';
import 'package:flutter_movies_explore/components/hero_title.dart';
import 'package:flutter_movies_explore/components/play_button.dart';
import 'package:flutter_movies_explore/models/movie.dart';
import 'package:flutter_movies_explore/screens/detail_screen.dart';
import 'package:flutter_movies_explore/utils/fade_page_route.dart';
import 'package:flutter_movies_explore/utils/view_state.dart';

class MoviesListItem extends StatelessWidget{
	
	final Movie movieObject;

    const MoviesListItem({Key key, this.movieObject}) : super(key: key);
	
	@override
	Widget build(BuildContext context) {
		return Padding(
			padding: EdgeInsets.only(right: 10.0),
			child: ClipRRect(
				borderRadius: BorderRadius.all(Radius.circular(12.0)),
				child: Stack(
					children: <Widget>[
						Hero(
							tag: movieObject.posterImageUrl,
							child: Image.asset(
								movieObject.posterImageUrl,
								fit: BoxFit.cover,
								width: MediaQuery.of(context).size.width/2,
							),
						),
						materialRippleBackGround(context),
						trailerTimeContainer(),
						bottomContainer(),
					],
				),
			),
		);
	}

    Widget materialRippleBackGround(BuildContext context) {
		return Positioned.fill(
			child: Container(
				decoration: BoxDecoration(
					gradient:LinearGradient(
						begin: Alignment.topLeft,
						end: Alignment.bottomRight,
						colors: [Colors.black.withOpacity(0.20), Colors.black.withOpacity(0.20)],
					)
				),
				child: Material(
					elevation: 2.0,
					color: Colors.transparent,
					child: InkWell(
						splashColor: Colors.black.withOpacity(0.2),
						onTap: () {
							Navigator.of(context).push(
								FadePageRoute(
									fullscreenDialog: true,
									builder: (context) {
										return DetailScreen(
											movieDetail: movieObject,
										);
									}),
							);
						}
					),
				),
			),
		);
    }

    Widget trailerTimeContainer() {
		return Positioned(
			top: 0,
			right: 0,
			child: Container(
				margin: EdgeInsets.only(top: 10.0, right: 10.0),
				padding: EdgeInsets.symmetric(
					vertical: 6.0,
					horizontal: 8.0,
				),
				decoration: BoxDecoration(
					color: Colors.grey.shade900,
					borderRadius: BorderRadius.all(
						Radius.circular(6.0),
					)
				),
				child: Text(
					movieObject.trailerTime,
					style: TextStyle(
						fontSize: 12.0,
						color: Colors.white,
					),
				),
			),
		);
    }

    Widget bottomContainer() {
		return Positioned(
			left: 0.0,
			right: 0.0,
			bottom: 0.0,
			child: Container(
				margin: EdgeInsets.only(bottom: 10.0,left: 10.0,right: 10.0),
				child: Row(
					mainAxisAlignment: MainAxisAlignment.spaceBetween,
					children: <Widget>[
						Flexible(
							flex: 1,
							child: Hero(
								tag: '${movieObject.title}-title',
								flightShuttleBuilder: (
									BuildContext flightContext,
									Animation<double> animation,
									HeroFlightDirection flightDirection,
									BuildContext fromHeroContext,
									BuildContext toHeroContext,
									) {
									return HeroTitle(
										title: movieObject.title,
										isOverflow: false,
										viewState: flightDirection == HeroFlightDirection.push
											? ViewState.enlarge
											: ViewState.shrink,
										smallFontSize: 14.0,
										largeFontSize: 32.0,
									);
								},
								child: HeroTitle(
									title: movieObject.title,
									viewState: ViewState.shrunk,
									textColor: Colors.white,
									fontWeight: FontWeight.bold,
									maxLines: 1,
								),
							),
						),
						InkWell(
							onTap: (){
							
							},
							child: PlayButton(
								buttonSize: 24.0,
								iconSize: 18.0,
								buttonColor: Colors.white.withOpacity(0.3),
								splashColor: Color.fromRGBO(231, 0, 0, 1),
							),
						),
					],
				),
			),
		);
    }
}