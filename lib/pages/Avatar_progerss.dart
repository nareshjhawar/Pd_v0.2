import 'package:flutter/material.dart';
import 'package:flutter_todo/data/thems.dart';

class Progerss_Avater extends StatefulWidget {
  @override
  State<Progerss_Avater> createState() => _Progerss_AvaterState();
}

class _Progerss_AvaterState extends State<Progerss_Avater>
    with SingleTickerProviderStateMixin {
  Animation<double>? _animation;
  AnimationController? _controller;

  @override
  void initState() {
    // TODO: implement initState  auto play animation
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animation = Tween(begin: 0.0, end: 0.4).animate(_controller!)
      ..addListener(() {
        setState(() {});
      });

    _controller!.forward();

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller!.reverse();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 210),
      width: 110,
      height: 110,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(30)),

        boxShadow: [
          BoxShadow(
            color: Mytheme.prime_color2.withOpacity(0.4),
            offset: const Offset(-5,5),
            spreadRadius: 3.5,
            blurRadius: 30,
          ),
        ],
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          CircularProgressIndicator(
            value: _animation!.value,
            strokeWidth: 3,
            valueColor:  AlwaysStoppedAnimation(Mytheme.prime_color2),
            backgroundColor: Mytheme.prime_color1,
          ),
          const Center(
              child: CircleAvatar(
                  radius: 45.0,
                  backgroundImage: AssetImage("assets/Avatar.png"))),
        ],
      ),
    );
  }
}
