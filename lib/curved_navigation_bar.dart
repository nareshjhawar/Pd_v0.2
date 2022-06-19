import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_todo/glass.dart';
import 'package:meta/meta.dart';
import 'data/thems.dart';

import 'src/nav_button.dart';
import 'src/nav_custom_painter.dart';

typedef _LetIndexPage = bool Function(int value);

class CurvedNavigationBar extends StatefulWidget {
  final List<Widget> items;
  final int index;
  final Color color;
  final Color? buttonBackgroundColor;
  final Color backgroundColor;
  final ValueChanged<int>? onTap;
  final _LetIndexPage letIndexChange;
  final Curve animationCurve;
  final Duration animationDuration;
  final double height;
  final Gradient gradient;
  // final Gradient backgroundGradient;
  final Gradient buttonBackgroundGradient;

  CurvedNavigationBar({
    Key? key,
    required this.items,
    this.index = 0,
    this.color = Colors.white,
    this.buttonBackgroundColor,
    this.backgroundColor = Colors.blueAccent,
    this.onTap,
    _LetIndexPage? letIndexChange,
    this.animationCurve = Curves.easeOut,
    this.animationDuration = const Duration(milliseconds: 600),
    this.height = 75.0,
    required this.gradient,
    // required this.backgroundGradient,
    required this.buttonBackgroundGradient

  })  : letIndexChange = letIndexChange ?? ((_) => true),
        assert(items != null),
        assert(items.length >= 1),
        assert(0 <= index && index < items.length),
        assert(0 <= height && height <= 75.0),
        super(key: key);

  @override
  CurvedNavigationBarState createState() => CurvedNavigationBarState();
}

class CurvedNavigationBarState extends State<CurvedNavigationBar>
    with SingleTickerProviderStateMixin {
  late double _startingPos;
  int _endingIndex = 0;
  late double _pos;
  double _buttonHide = 0;
  late Widget _icon;
  late AnimationController _animationController;
  late int _length;

  @override
  void initState() {
    super.initState();
    _icon = widget.items[widget.index];
    _length = widget.items.length;
    _pos = widget.index / _length;
    _startingPos = widget.index / _length;
    _animationController = AnimationController(vsync: this, value: _pos);
    _animationController.addListener(() {
      setState(() {
        _pos = _animationController.value;
        final endingPos = _endingIndex / widget.items.length;
        final middle = (endingPos + _startingPos) / 2;
        if ((endingPos - _pos).abs() < (_startingPos - _pos).abs()) {
          _icon = widget.items[_endingIndex];
        }
        _buttonHide =
            (1 - ((middle - _pos) / (_startingPos - middle)).abs()).abs();
      });
    });
  }

  @override
  void didUpdateWidget(CurvedNavigationBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.index != widget.index) {
      final newPosition = widget.index / _length;
      _startingPos = _pos;
      _endingIndex = widget.index;
      _animationController.animateTo(newPosition,
          duration: widget.animationDuration, curve: widget.animationCurve);
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          color: widget.backgroundColor,
          // borderRadius: BorderRadius.all(Radius.circular(30)),
          // boxShadow: [
          //   BoxShadow(
          //     color: Mytheme.prime_color2.withOpacity(0.35),
          //     offset: const Offset(-10,20),
          //     spreadRadius: 1.5,
          //     blurRadius: 30,
          //   ),
          // ],
          // gradient: widget.backgroundGradient
      ),
      height: widget.height,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.bottomCenter,
        children: <Widget>[

          Positioned(
            left: 0,
            right: 0,
            bottom: 0 - (75.0 - widget.height),
            child: Container(
              // color: Colors.transparent,

              child: ClipRRect(
                borderRadius: BorderRadius.vertical(
                  top: Radius.elliptical(200,70),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 4,sigmaY: 4),
                  child: CustomPaint(
                    painter: NavCustomPainter(
                        _pos, _length, widget.color, Directionality.of(context),
                        widget.gradient ),
                    child: ClipRRect(

                      child: Container(
                        // bottom nav shadow light

                        // color: Color(0xFF7A69DB),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Mytheme.nav_shadow, //0xFF483D76
                              offset: Offset(0, 58),
                              blurRadius: 20,
                              spreadRadius: 5,
                            ),
                          ],
                        ),
                        height: 80,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -43 - (70.0 - widget.height),
            left: Directionality.of(context) == TextDirection.rtl
                ? null
                : _pos * size.width,
            right: Directionality.of(context) == TextDirection.rtl
                ? _pos * size.width
                : null,
            width: size.width / _length,
            child: Center(
              child: Transform.translate(
                offset: Offset(
                  0,
                  -(1 - _buttonHide) * 80,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5,sigmaY: 5),
                    child: Material(
                      color: Colors.transparent,
                      type: MaterialType.circle,

                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color : Mytheme.nav_button_color.withOpacity(0.5),
                              offset: const Offset(-5, 5),
                              spreadRadius: 7,
                              blurRadius: 20,
                            ),
                          ],
                          shape: BoxShape.circle,
                          color: widget.buttonBackgroundColor ?? widget.color,
                          gradient: widget.buttonBackgroundGradient ,

                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: _icon,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0 - (75.0 - widget.height),
            child: SizedBox(
                height: 80.0,
                child: Row(
                    children: widget.items.map((item) {
                  return NavButton(
                    onTap: _buttonTap,
                    position: _pos,
                    length: _length,
                    index: widget.items.indexOf(item),
                    child: Center(
                        child: item),
                  );
                }).toList())),
          ),
        ],
      ),
    );
  }

  void setPage(int index) {
    _buttonTap(index);
  }

  void _buttonTap(int index) {
    if (!widget.letIndexChange(index)) {
      return;
    }
    if (widget.onTap != null) {
      widget.onTap!(index);
    }
    final newPosition = index / _length;
    setState(() {
      _startingPos = _pos;
      _endingIndex = index;
      _animationController.animateTo(newPosition,
          duration: widget.animationDuration, curve: widget.animationCurve);
    });
  }
}
