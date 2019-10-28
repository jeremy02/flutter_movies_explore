import 'package:flutter/material.dart';
import 'package:flutter_movies_explore/components/tab_bar_view_component.dart';
import 'package:flutter_movies_explore/widgets/blurred_container.dart';

class MovieDetailScreen extends StatefulWidget{
	
	final String title;

    const MovieDetailScreen({Key key, this.title}) : super(key: key);
	
	@override
	MovieDetailScreenState createState() => MovieDetailScreenState();
}

class MovieDetailScreenState extends State<MovieDetailScreen> with TickerProviderStateMixin{
	
	List<String> listCategories = ["Bags", "Shoes", "Jackets","Bags", "Shoes", "Jackets","Bags", "Shoes", "Jackets"];
	
	TabController _tabController;
	int _activeTabIndex = 0;
	
	@override
	void initState() {
		super.initState();
		_tabController = TabController(
			vsync: this,
			length: listCategories.length,
		);
		
		// within your initState() method
		_tabController.addListener(_setActiveTabIndex);
	}
	
	@override
	void dispose() {
		super.dispose();
		_tabController.dispose();
	}
	
	void _setActiveTabIndex() {
		setState(() {
			_activeTabIndex = _tabController.index;
		});
	}
	
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			backgroundColor: Colors.black,
			appBar: PreferredSize(
				preferredSize: Size(
					MediaQuery.of(context).size.width,
					56,
				),
				child: AppBar(
					elevation: 0.0,
					leading: Icon(
						Icons.menu,
					),
					automaticallyImplyLeading: false,
					centerTitle: true,
					title: Stack(
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
									widget.title,
									style: TextStyle(
										fontSize: 20.0,
										fontWeight: FontWeight.w700,
									),
								),
							),
						],
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
			),
			body: Stack(
				fit: StackFit.expand,
				children: <Widget>[
					Image.asset(
						"assets/images/joker_detail_poster.jpg",
						fit: BoxFit.cover,
					),
					BlurredContainer(alignment: Alignment.topCenter, height: MediaQuery.of(context).size.height*0.08, verticalOffset: 10.0, color: Colors.black.withOpacity(1.0)),
					BlurredContainer(alignment: Alignment.bottomCenter, height: MediaQuery.of(context).size.height*0.24, verticalOffset: 0.0, color: Colors.black.withOpacity(0.7)),
					Positioned(
						top: 0.0,
						left: 0.0,
						child: topContainer(),
					),
					Column(
						mainAxisSize: MainAxisSize.max,
						crossAxisAlignment: CrossAxisAlignment.start,
						children: <Widget>[
							Flexible(
								flex: 1,
								child: TabBarView(
									controller: _tabController,
									children: createTabBarViews(),
								),
							),
						],
					),
				],
			)
		);
	}
	
	Widget topContainer() {
		return Padding(
			padding: EdgeInsets.symmetric(horizontal: 4.0),
			child: Column(
				crossAxisAlignment: CrossAxisAlignment.start,
				children: <Widget>[
					Container(
						color: Colors.white.withOpacity(0.85),
						height: 1.0,
					),
					Container(
						margin: EdgeInsets.fromLTRB(12.0, 0.0, 10.0, 4.0),
						child: TabBar(
							controller: _tabController,
							indicatorSize: TabBarIndicatorSize.label,
							isScrollable: true,
							indicatorColor: Colors.transparent,
							labelPadding: EdgeInsets.only(right: 20),
							indicatorPadding: EdgeInsets.all(0),
							tabs: createTabs(),
						),
					),
					Container(
						color: Colors.white.withOpacity(0.85),
						height: 1.0,
					),
				],
			),
		);
	}
	
	// the tabs to show
	List<Widget> createTabs() {
		return List<Widget>.generate(listCategories.length, (int index){
			return Text(
				listCategories[index].toUpperCase(),
				style: TextStyle(
					fontWeight: FontWeight.bold,
					fontSize: 16.0,
					color: _activeTabIndex == index ? Colors.blue.shade400 : Colors.white,
				),
			);
		});
	}
	
	// the tabs to show
	List<Widget> createTabBarViews() {
		return List<Widget>.generate(listCategories.length, (int index){
			return TabBarViewComponent(movieDetail: listCategories[index]);
		});
	}
}