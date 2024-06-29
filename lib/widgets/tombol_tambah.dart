import 'package:flutter/material.dart';

class ButtonTambah extends StatelessWidget {
  const ButtonTambah({
    Key? key, 
    required this.text,
    this.backgroundColor = Colors.red,
    required this.onPressed,
    }) : super(key: key);

  final String text;
  final Color backgroundColor;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.indigoAccent,
              blurRadius: 0.5,
              spreadRadius: 0.5,
              offset: Offset.fromDirection(90))
          ]),
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(10),
        child: const Icon(Icons.add),
      ),
    );
  }
}