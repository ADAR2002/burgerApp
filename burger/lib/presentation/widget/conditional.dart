import 'package:flutter/material.dart';

class Condition extends StatelessWidget {
  const Condition(
      {Key? key,
      required this.condition,
      required this.after,
      required this.before})
      : super(key: key);
  final bool condition;
  final Widget Function(BuildContext context) after;
  final Widget Function(BuildContext context) before;

  @override
  Widget build(BuildContext context) {
    return Container(

      child: condition? after(context) : before(context) ,
    );
  }
}
