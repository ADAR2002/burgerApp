import 'package:burger/Data/model/burger_model.dart';
import 'package:flutter/material.dart';

import '../../business_logic/cubit/burger_cubit.dart';
import 'conditional.dart';

class MyItem extends StatelessWidget {
  const MyItem({Key? key, required this.burger,required this.state, required this.image}) : super(key: key);
final Burger burger;
final String image;
final BurgerState state;
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){ Navigator.pushNamed(context, "/itemScreen" , arguments: burger);},
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 240,
            width: 170,
            decoration: BoxDecoration(
                image: DecorationImage(
                    opacity: 0.8,
                    image: AssetImage(image),
                    fit: BoxFit.fill),
                borderRadius: BorderRadius.circular(25)),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            width: 120,
            color: Colors.black38,
            child: Condition(
              after: (context) => Text(
                burger.name,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: const TextStyle(color: Colors.white60),
              ),
              before: (context) => Container(),
              condition: state is BurgerSuccess,
            ),
          )
        ],
      ),
    );
  }
}
