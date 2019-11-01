import 'package:flutter/material.dart';
import 'package:flutter_movies_explore/components/custom_app_bar.dart';
import 'package:flutter_movies_explore/components/movies_list_component.dart';
import 'package:flutter_movies_explore/components/play_button.dart';
import 'package:flutter_movies_explore/utils/constants.dart';
import 'package:flutter_movies_explore/widgets/blurred_container.dart';

class HomeScreen extends StatefulWidget{
	@override
	HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen>{
	
	@override
	void initState() {
		super.initState();
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
					Image.asset(
						"assets/images/joker_poster.jpg",
						fit: BoxFit.cover,
					),
					BlurredContainer(alignment: Alignment.bottomLeft, height: MediaQuery.of(context).size.height*0.24, horizontalOffset: -120.0, verticalOffset: 0.0, color: Colors.black.withOpacity(0.5)),
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
								children: <Widget>[
									Row(
										children: <Widget>[
											Column(
												mainAxisAlignment: MainAxisAlignment.start,
												crossAxisAlignment: CrossAxisAlignment.start,
												children: <Widget>[
													MovieInfoCaption(),
												],
											),
											Spacer(),
											Padding(
												padding: EdgeInsets.only(right: 8.0),
												child: PlayButton(
													buttonSize: 48.0,
													iconSize: 28.0,
													buttonColor: Color.fromRGBO(231, 0, 0, 1),
													splashColor: Colors.white.withOpacity(0.2),
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
				Text(
					"Joker",
					style: TextStyle(
						color: Colors.white,
						fontWeight: FontWeight.bold,
						fontSize: 32.0,
					),
				),
				SizedBox(
					height: 6.0,
				),
				Row(
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
			],
		);
	}
}