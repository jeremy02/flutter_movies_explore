import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget{
	
	final bool showLogo;
	final String movieTitle;
	
    const CustomAppBar({Key key, this.showLogo, this.movieTitle}) : super(key: key);
	
	@override
	Widget build(BuildContext context) {
		
		return AppBar(
			elevation: 0.0,
			leading: Icon(
				Icons.menu,
			),
			automaticallyImplyLeading: false,
			centerTitle: true,
			title: showLogo ?
			Stack(
				children: <Widget>[
					Align(
						alignment: Alignment.center,
						child: Image.asset(
							"assets/images/icon_movie_ticket.png",
							height: 40,
						),
					),
					Align(
						alignment: Alignment.center,
						child: Text(
							movieTitle,
							style: TextStyle(
								fontSize: 20.0,
								fontWeight: FontWeight.w700,
							),
						),
					),
				],
			)
			:
			Container(),
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
		);
	}
}