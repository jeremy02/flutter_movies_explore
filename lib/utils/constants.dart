import 'package:flutter/material.dart';
class Constants{
	static String appName = "book my show";
	
	//Colors for theme
	static Color lightPrimary = Color(0xfffcfcff);
	static Color darkPrimary = Colors.black;
	static Color lightAccent = Colors.white54;
	static Color darkAccent = Colors.black87;
	static Color lightBG = Color(0xfffcfcff);
	static Color darkBG = Colors.black;
	
	static ThemeData darkTheme = ThemeData(
		brightness: Brightness.dark,
		backgroundColor: darkBG,
		primaryColor: darkPrimary,
		accentColor: darkAccent,
		fontFamily: 'Miso',
		scaffoldBackgroundColor: darkBG,
		cursorColor: darkAccent,
		appBarTheme: AppBarTheme(
			textTheme: TextTheme(
				title: TextStyle(
					color: lightBG,
					fontSize: 18.0,
					fontWeight: FontWeight.w800,
				),
			),
//      iconTheme: IconThemeData(
//        color: darkAccent,
//      ),
		),
	);
}