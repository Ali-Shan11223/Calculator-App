import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String title;
  final Color color;
  final VoidCallback onPress;
  const MyButton(
      {super.key,
      required this.title,
      this.color = Colors.white,
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: InkWell(
          onTap: onPress,
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: const Offset(0, 2.0),
                    blurStyle: BlurStyle.normal)
              ],
              borderRadius: BorderRadius.circular(10),
              color: color,
            ),
            child: Center(
                child: Text(
              title,
              style: const TextStyle(fontSize: 18, color: Colors.blueGrey),
            )),
          ),
        ),
      ),
    );
  }
}
