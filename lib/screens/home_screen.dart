import 'package:flutter/material.dart';
import 'package:flutter_movies_explore/components/custom_app_bar.dart';
import 'package:flutter_movies_explore/components/play_button.dart';
import 'package:flutter_movies_explore/utils/constants.dart';

class HomeScreen extends StatefulWidget{
	@override
	HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen>{
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
											PlayButton(),
										],
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
			mainAxisAlignment: MainAxisAlignment.start,
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