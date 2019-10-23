import 'package:flutter/material.dart';

class MovieDetailScreen extends StatelessWidget{
	
	final String title;

    const MovieDetailScreen({Key key, this.title}) : super(key: key);
	
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			backgroundColor: Colors.black,
			appBar: AppBar(
				title: Text(
					title
				),
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