import 'package:flutter/material.dart';
import 'package:flutter_movies_explore/utils/view_state.dart';

class HeroTitle extends StatefulWidget {
	final String title;
	final ViewState viewState;
	final double smallFontSize;
	final double largeFontSize;
	final int maxLines;
	final TextOverflow textOverflow;
	final bool isOverflow;
	final Color textColor;
	final FontWeight fontWeight;
	
	const HeroTitle({
		Key key,
		@required this.title,
		@required this.viewState,
		this.smallFontSize,
		this.largeFontSize = 32.0,
		this.maxLines = 1,
		this.textOverflow = TextOverflow.ellipsis,
		this.isOverflow = false,
		this.textColor,
		this.fontWeight,
	}) : super(key: key);
	
	@override
	_HeroTitleState createState() => _HeroTitleState();
}

class _HeroTitleState extends State<HeroTitle>
	with SingleTickerProviderStateMixin {
	AnimationController _animationController;
	Animation<double> _fontSizeTween;
	
	double fontSize;
	
	@override
	void initState() {
		super.initState();
		_animationController = AnimationController(
			vsync: this,
			duration: Duration(milliseconds: 330),
		)..addListener(() {
			setState(() {
				fontSize = _fontSizeTween.value;
			});
		});
		
		switch (widget.viewState) {
			case ViewState.enlarge:
				_fontSizeTween = Tween<double>(
					begin: widget.smallFontSize,
					end: widget.largeFontSize,
				).animate(
					CurvedAnimation(
						parent: _animationController,
						curve: Curves.easeInOut,
					),
				);
				
				_animationController.forward(from: 0.0);
				break;
			
			case ViewState.enlarged:
				fontSize = widget.largeFontSize;
				break;
			
			case ViewState.shrink:
				_fontSizeTween = Tween<double>(
					begin: widget.largeFontSize,
					end: widget.smallFontSize,
				).animate(
					CurvedAnimation(
						parent: _animationController,
						curve: Curves.easeInOut,
					),
				);
				
				_animationController.forward(from: 0.0);
				break;
			
			case ViewState.shrunk:
				fontSize = widget.smallFontSize;
				break;
		}
	}
	
	@override
	void dispose() {
		_animationController.dispose();
		super.dispose();
	}
	
	@override
	Widget build(BuildContext context) {
		return HeroTitleContent(
			text: widget.title,
			fontSize: fontSize,
			maxLines: widget.maxLines,
			overflow: widget.textOverflow,
			isOverflow: widget.isOverflow,
			textColor: widget.textColor,
			fontWeight: widget.fontWeight,
		);
	}
}

class HeroTitleContent extends StatelessWidget {
	final String text;
	final double fontSize;
	final int maxLines;
	final TextOverflow overflow;
	final bool isOverflow;
	final Color textColor;
	final FontWeight fontWeight;
	
	const HeroTitleContent({
		Key key,
		this.text,
		this.fontSize,
		this.maxLines,
		this.overflow,
		this.isOverflow,
		this.textColor,
		this.fontWeight,
	}) : super(key: key);
	
	Widget _buildTitleText() => Text(
		text,
		maxLines: maxLines,
		overflow: overflow,
		style: TextStyle(
			color: textColor,
			fontWeight: fontWeight,
			fontSize: fontSize,
		),
	);
	
	@override
	Widget build(BuildContext context) {
		return Material(
			color: Colors.transparent,
			child: isOverflow
				? OverflowBox(
				alignment: Alignment.topLeft,
				maxWidth: double.infinity,
				maxHeight: double.infinity,
				child: _buildTitleText(),
			)
				: _buildTitleText(),
		);
	}
}