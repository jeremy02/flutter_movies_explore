import 'package:flutter/material.dart';
import 'package:flutter_movies_explore/components/play_button.dart';

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
						Positioned(
							top: 0,
							right: 0,
							child: Container(
								margin: EdgeInsets.only(top: 6.0, right: 6.0),
								padding: EdgeInsets.symmetric(
									vertical: 4.0,
									horizontal: 6.0,
								),
								decoration: BoxDecoration(
									color: Colors.grey.shade900,
									borderRadius: BorderRadius.all(
										Radius.circular(6.0),
									)
								),
								child: Text(
									"02:25",
									style: TextStyle(
										fontSize: 12.0,
										color: Colors.white,
									),
								),
							),
						),
						Positioned(
							left: 0.0,
							right: 0.0,
							bottom: 0.0,
							child: Container(
								margin: EdgeInsets.only(bottom: 8.0,left: 8.0,right: 8.0),
								child: Row(
									mainAxisAlignment: MainAxisAlignment.spaceBetween,
									children: <Widget>[
										Flexible(
											flex: 1,
											child: Padding(
												padding: EdgeInsets.only(right: 4.0),
												child: Text(
													"Jumanji: The Next Level",
													style: TextStyle(
														fontSize: 12.0,
														color: Colors.white,
														fontWeight: FontWeight.bold,
													),
													maxLines: 1,
												),
											),
										),
										ClipOval(
											child: Material(
												color: Colors.white.withOpacity(0.4),
												child: InkWell(
													splashColor: Colors.red,
													child: SizedBox(
														width: 24,
														height: 24,
														child: Icon(
															Icons.play_arrow,
															color: Colors.white,
															size: 16.0,
														),
													),
													onTap: () {},
												),
											),
										)
									],
								),
							),
						),
					],
				),
			),
		);
	}
}