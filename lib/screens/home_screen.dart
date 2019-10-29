import 'package:flutter/material.dart';
import 'package:flutter_movies_explore/components/custom_app_bar.dart';
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
							height: MediaQuery.of(context).size.height*0.30,
							child: Column(
								children: <Widget>[
								
								],
							),
						),
					),
				],
			),
		);
	}
}