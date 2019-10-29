import 'package:flutter/material.dart';
import 'package:flutter_movies_explore/components/custom_app_bar.dart';
import 'package:flutter_movies_explore/components/tab_bar_view_component.dart';
import 'package:flutter_movies_explore/widgets/blurred_container.dart';

class DetailScreen extends StatefulWidget{
	
	final String title;

    const DetailScreen({Key key, this.title}) : super(key: key);
	
	@override
	DetailScreenState createState() => DetailScreenState();
}

class DetailScreenState extends State<DetailScreen> with TickerProviderStateMixin{
	
	List<String> listCategories = ["Synopsis", "Cast", "Crew","User Reviews", "Critics", "Ratings"];
	
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
				child: CustomAppBar(showLogo: false, movieTitle: widget.title),
			),
			body: Stack(
				fit: StackFit.expand,
				children: <Widget>[
					Image.asset(
						"assets/images/joker_detail_poster.jpg",
						fit: BoxFit.cover,
					),
					BlurredContainer(alignment: Alignment.topCenter, height: MediaQuery.of(context).size.height*0.08, verticalOffset: 10.0, color: Colors.black.withOpacity(1.0)),
					Column(
						mainAxisSize: MainAxisSize.max,
						crossAxisAlignment: CrossAxisAlignment.start,
						children: <Widget>[
							tabBarContainer(),
							Flexible(
								flex: 1,
								child: TabBarView(
									controller: _tabController,
									children: createTabBarViews(),
								),
							),
						],
					),
					BlurredContainer(alignment: Alignment.bottomCenter, height: MediaQuery.of(context).size.height*0.08, verticalOffset: 0.0, color: Colors.black.withOpacity(0.8)),
				],
			),
		);
	}
	
	Widget tabBarContainer() {
		return Padding(
			padding: EdgeInsets.symmetric(horizontal: 4.0),
			child: Column(
				crossAxisAlignment: CrossAxisAlignment.start,
				children: <Widget>[
					Container(
						color: Colors.white.withOpacity(0.6),
						height: 0.5,
					),
					Container(
						margin: EdgeInsets.symmetric(horizontal: 12.0,vertical: 8.0),
						child: TabBar(
							controller: _tabController,
							indicatorSize: TabBarIndicatorSize.label,
							isScrollable: true,
							indicatorColor: Colors.transparent,
							labelPadding: EdgeInsets.only(right: 26),
							indicatorPadding: EdgeInsets.all(0),
							tabs: createTabs(),
						),
					),
					Container(
						color: Colors.white.withOpacity(0.6),
						height: 0.5,
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
					fontWeight: FontWeight.normal,
					fontSize: 14.0,
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