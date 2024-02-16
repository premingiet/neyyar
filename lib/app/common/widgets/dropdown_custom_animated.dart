import 'package:flutter/material.dart';
import 'dart:math' as math;

class DropdownCustomAnimated extends StatefulWidget {
  final List<String> options;
  final Function(String) onSelected;

  const DropdownCustomAnimated({
    Key? key,
    required this.options,
    required this.onSelected,
  }) : super(key: key);

  @override
  _DropdownCustomAnimatedState createState() =>
      _DropdownCustomAnimatedState();
}

class _DropdownCustomAnimatedState extends State<DropdownCustomAnimated>
    with SingleTickerProviderStateMixin {
  String? _selectedValue;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
      value: 0, // start at 0 (arrow down)
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Center(
        child: DropdownButton<String>(
          value: _selectedValue,
          hint: Text("Select an option"),
          icon: AnimatedIcon(
            icon: AnimatedIcons.arrow_menu,
            progress: _animationController,
          ),
          onChanged: (String? newValue) {
            setState(() {
              _selectedValue = newValue;
            });
            widget.onSelected(newValue!);
          },
          onTap: () {
            // Toggle the arrow direction
            if (_animationController.isCompleted) {
              _animationController.reverse();
            } else {
              _animationController.forward();
            }
          },
          items: widget.options.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          underline: Container(
            height: 2,
            color: Colors.deepPurpleAccent,
          ),
        ),
      ),
    );
  }
}