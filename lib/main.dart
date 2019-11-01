import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_movies_explore/screens/detail_screen.dart';
import 'package:flutter_movies_explore/screens/home_screen.dart';
import 'package:flutter_movies_explore/utils/constants.dart';

void main() async{
	SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {
		runApp(MyApp());
	});
}

class MyApp extends StatelessWidget {
	// This widget is the root of your application.
	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			debugShowCheckedModeBanner: false,
			title: Constants.appName,
			theme: Constants.darkTheme,
			home: DetailScreen(title: Constants.appName,),
		);
	}
}