import 'package:flutter/material.dart';

class MoviesListItem extends StatelessWidget{
	@override
	Widget build(BuildContext context) {
		return Padding(
			padding: EdgeInsets.only(right: 10.0),
			child: ClipRRect(
				borderRadius: BorderRadius.all(Radius.circular(12.0)),
				child: Stack(
					children: <Widget>[
						Image.asset(
							"assets/images/jumanji_poster.jpg",
							fit: BoxFit.cover,
							width: MediaQuery.of(context).size.width/2,
						),
						Positioned.fill(
							child: Material(
								elevation: 2.0,
								color: Colors.transparent,
								child: InkWell(
									splashColor: Colors.black.withOpacity(0.2),
									onTap: () => {
									
									},
								),
							),
						),
					],
				),
			),
		);
	}
}