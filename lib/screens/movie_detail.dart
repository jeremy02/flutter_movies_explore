import 'package:flutter/material.dart';

class MovieDetailScreen extends StatelessWidget{
	
	final String title;

    const MovieDetailScreen({Key key, this.title}) : super(key: key);
	
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			backgroundColor: Colors.black,
			appBar: AppBar(
				elevation: 0.0,
				leading: Icon(
					Icons.menu,
				),
				automaticallyImplyLeading: false,
				centerTitle: true,
				title: Text(
					title,
					style: TextStyle(
						fontSize: 18.0,
						fontWeight: FontWeight.w800,
					),
				),
				actions: <Widget>[
					InkWell(
						onTap: (){},
						child: Padding(
							padding: EdgeInsets.symmetric(horizontal: 8.0),
							child: Icon(
								Icons.search,
							),
						),
					),
				],
			),
			body: Container(
				width: double.infinity,
				height: double.infinity,
				decoration: BoxDecoration(
					color: Colors.blueAccent.shade100,
				),
			),
		);
	}
}