import 'package:flutter/material.dart';

class MoviesList extends StatefulWidget{
	@override
	MoviesListState createState() => MoviesListState();
}

class MoviesListState extends State<MoviesList> {
	
	final _pageController = new PageController();
	
	@override
	void initState() {
		super.initState();
	}
	
	@override
	void dispose() {
		super.dispose();
		_pageController.dispose();
	}

	@override
	Widget build(BuildContext context) {
		return Container(
			height: double.infinity,
			decoration: BoxDecoration(
				color: Colors.white54,
			),
		);
	}
}