import 'package:api_example_app/SensorScreen/home/home_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class CustomCardRoom extends StatefulWidget {
  const CustomCardRoom(
      {Key key,
        @required this.size,
        this.icon,
        this.des,
        this.title,})
      : super(key: key);

  final Size size;
  final Widget icon;
  final String title;
  final String des;

  @override
  _CustomCardStateRoom createState() => _CustomCardStateRoom();
}

class _CustomCardStateRoom extends State<CustomCardRoom>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<Alignment> _animation;
  bool isChecked = true;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 350),
    );

    _animation = Tween<Alignment>(
        begin: Alignment.bottomCenter, end: Alignment.topCenter)
        .animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.linear,
        reverseCurve: Curves.easeInBack,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(child: Container(
      height: 140,
      width: widget.size.width * 0.35,
      decoration: BoxDecoration(
        color: kBgColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(3, 3),
          ),
          BoxShadow(
            color: Colors.white,
            blurRadius: 0,
            offset: Offset(-3, -3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                widget.icon,
              ],
            ),
            SizedBox(height: 10),
            Text(
              widget.title ?? '',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: kBlueColor,
              ),
            ),
            Text(
              widget.des,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: kBlueColor,
                  fontSize: 10
              ),
            ),
          ],
        ),
      ),
    ), onTap: (){
      Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (context) => HomeDetailScreen(),
        ),
      );
    },);
  }
}