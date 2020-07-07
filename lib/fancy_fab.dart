import 'package:flutter/material.dart';

class FancyFab extends StatefulWidget {
  final Function() onPressed;
  final String tooltip;
  final IconData icon;

  FancyFab({this.onPressed, this.tooltip, this.icon});

  @override
  _FancyFabState createState() => _FancyFabState();
}

class _FancyFabState extends State<FancyFab> with TickerProviderStateMixin {
   double _height = 80.0;
  double _width = 80.0;
  var _color = Colors.blue;
  bool _resized = false;


  AnimationController _animationController;

  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(vsync: this,
      child: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {
            _animationController
                .forward()
                .then((_) => _animationController.reverse());
          });
          this.widget.onPressed();
        },
        tooltip: this.widget.tooltip,
      ),
    );
  }
}
