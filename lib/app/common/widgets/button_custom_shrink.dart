import 'package:flutter/material.dart';

class ButtonCustomShrink extends StatefulWidget {
  final Widget child;
  final Function onPressed;
  final double shrinkScale;
  final bool disabled;

  const ButtonCustomShrink({super.key,
    required this.child,
    required this.onPressed,
    this.shrinkScale = 0.9,
    this.disabled = false,
  });

  @override
  ButtonCustomShrinkState createState() => ButtonCustomShrinkState();
}

class ButtonCustomShrinkState extends State<ButtonCustomShrink>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if(widget.disabled == false){
          widget.onPressed();
        }
      },
      onTapDown: (d) {
        if(widget.disabled == false) {
          _controller.forward();
        }
      },
      onTapUp: (d){
        Future.delayed(const Duration(milliseconds: 100), () {
          if(widget.disabled == false) {
            _controller.reverse();
          }
        });
      },
      onTapCancel: (){
        Future.delayed(const Duration(milliseconds: 100), () {
          if(widget.disabled == false) {
            _controller.reverse();
          }
        });
      },
      child: ScaleTransition(
        scale: Tween<double>(
          begin: 1.0,
          end: widget.shrinkScale,
        ).animate(_controller),
        child: widget.child,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}