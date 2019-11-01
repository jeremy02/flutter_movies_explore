import 'package:flutter/material.dart';
import 'package:flutter_movies_explore/widgets/dots_indicator.dart';
import 'package:flutter_movies_explore/widgets/movies_list_item.dart';

class MoviesList extends StatefulWidget{
	@override
	MoviesListState createState() => MoviesListState();
}

class MoviesListState extends State<MoviesList> {
	
	var cardIndex = 0;
	ScrollController _moviesListController;
	
	List<String> listCategories = ["Synopsis", "Cast", "Crew","User Reviews", "Critics"];
	
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
					child: ListView.builder(
						physics: NeverScrollableScrollPhysics(),
						scrollDirection: Axis.horizontal,
						controller: _moviesListController,
						itemCount: listCategories.length,
						shrinkWrap: true,
						itemBuilder: (BuildContext context, int index) {
							return GestureDetector(
								child: MoviesListItem(),
								onHorizontalDragEnd: (details) {
									// check if the swipe was a left swipe or right swipe and update the index accordingly.
									// We then animate the list to scroll to that index in 500ms.
									if(details.velocity.pixelsPerSecond.dx > 0) {
										if(cardIndex>0) {
											cardIndex--;
										}
									}
									else {
										if(cardIndex < listCategories.length-1){
											cardIndex ++;
										}
									}
									// animate or scroll to this index
									setState(() {
										_moviesListController.animateTo((cardIndex)*210.0, duration: Duration(milliseconds: 500), curve: Curves.fastOutSlowIn);
									});
								},
							);
						},
					),
				),
				Padding(
					padding: EdgeInsets.only(top: 6.0,bottom: 6.0),
					child: Center(
						child: DotsIndicator(
							controller: _moviesListController,
							itemCount: listCategories.length,
							currentIndex: cardIndex,
						),
					),
				),
			],
		);
	}
}