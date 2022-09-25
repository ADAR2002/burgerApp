import 'package:burger/Data/model/burger_model.dart';
import 'package:burger/business_logic/cubit/burger_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemScreen extends StatelessWidget {
  const ItemScreen({Key? key, required this.burger}) : super(key: key);
  final Burger burger;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: BlocConsumer<BurgerCubit,BurgerState>(
            listener: (context,state){},
            builder: (context,state){
              final cubit = BlocProvider.of<BurgerCubit>(context);
              return Container(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(onPressed: (){Navigator.pop(context); }, icon: const Icon(Icons.arrow_back_ios)),
                      const Text(
                        'Burgers',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: const DecorationImage(
                                image: AssetImage('assets/Icon.jpg'))),
                      )
                    ],
                  ),
                  const SizedBox(height: 20,),
                  buildPickImage(context, cubit),
                  const SizedBox(height: 20,),
                  Row(
                    children: [
                      buildDetailsBurger(context),
                      const SizedBox(width: 10,),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30),
                            bottomLeft:  Radius.circular(30)

                          )


                        ),
                        height: MediaQuery.of(context).size.height * 0.3,
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: ListView.builder(itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.only(top: 8),
                            child: Text(
                             "${index + 1} - "+ burger.ingredients[index],style: const TextStyle(color: Colors.white),
                            ),
                          );

                        },
                        itemCount: burger.ingredients.length,),
                      )

                    ],

                  )
                ],
              ),
            );},
          ),
        ),
      ),
    );
  }

  Widget buildDetailsBurger(context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.6,
      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Name :"+burger.name,style:const TextStyle(fontSize: 18,fontWeight: FontWeight.bold) ,)  ,
                          const SizedBox(height: 20,),
                          Text("Description :"+burger.description,style:const TextStyle(fontSize: 16,) ,)  ,
                          const SizedBox(height: 20,),
                          Text("Restaurant :"+burger.restaurant,style:const TextStyle(fontSize: 16,fontWeight: FontWeight.bold) ,)  ,
                        ],
                      ),
    );
  }

  Expanded buildPickImage(BuildContext context, BurgerCubit cubit) {
    return Expanded(
                  child: Row(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.5,
                        width: MediaQuery.of(context).size.width * 0.6,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(cubit.image),
                              fit: BoxFit.fill
                            ),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      const SizedBox(width: 10,),
                      Center(
                        child: SizedBox(
                          height:MediaQuery.of(context).size.height * 0.46 ,
                          width:MediaQuery.of(context).size.width * 0.25 ,
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) => GestureDetector(
                              onTap: ()=>cubit.pickImage(index),
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 15),
                                height:
                                MediaQuery.of(context).size.height * 0.1,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(cubit.img[index]),
                                        fit: BoxFit.fill
                                    ),
                                    borderRadius: BorderRadius.circular(15)),
                              ),
                            ),
                            itemCount: 4,
                          ),
                        ),
                      )
                    ],
                  ),
                );
  }
}
