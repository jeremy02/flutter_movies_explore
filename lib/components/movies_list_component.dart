import 'package:flutter/material.dart';
import 'package:flutter_movies_explore/widgets/dots_indicator.dart';

class MoviesList extends StatefulWidget{
	@override
	MoviesListState createState() => MoviesListState();
}

class MoviesListState extends State<MoviesList> {
	
	var cardIndex = 0;
	ScrollController _moviesListController;
	
	List<String> listCategories = ["Synopsis", "Cast", "Crew","User Reviews", "Critics", "Ratings"];
	
	@override
	void initState() {
		super.initState();
		_moviesListController = new ScrollController();
	}
	
	@override
	void dispose() {
		super.dispose();
		_moviesListController.dispose();
	}

	@override
	Widget build(BuildContext context) {
		return Column(
			children: <Widget>[
				Expanded(
					child: Container(
						decoration: BoxDecoration(
							color: Colors.blue,
						),
					),
				),
				Container(
					color: Colors.grey[800].withOpacity(0.5),
					padding: EdgeInsets.all(10.0),
					child: Center(
						child: DotsIndicator(
							controller: _moviesListController,
							itemCount: listCategories.length,
						),
					),
				),
			],
		);
	}
}