import 'package:burger/Data/model/burger_model.dart';
import 'package:burger/business_logic/cubit/burger_cubit.dart';
import 'package:burger/presentation/widget/conditional.dart';
import 'package:burger/presentation/widget/my_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:showcaseview/showcaseview.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    GlobalKey _one = GlobalKey();
    GlobalKey _two = GlobalKey();
    GlobalKey _three = GlobalKey();

    List<String> img = [
      "assets/1.jpg",
      "assets/2.jpg",
      "assets/3.jpg",
      "assets/4.jpg",
      "assets/5.jpg",
      "assets/6.jpg",
      "assets/7.jpg"
    ];
    int i = -1;
    TextEditingController controller = TextEditingController();
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: BlocConsumer<BurgerCubit, BurgerState>(
            listener: (context, state) {},
            builder: (context, state) {
              final cubit = BlocProvider.of<BurgerCubit>(context).burgers;
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(
                            Icons.restaurant_menu,
                            size: 28,
                          ),
                          const Text(
                            'Food',
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
                      const SizedBox(height: 30),
                      Container(
                        padding: const EdgeInsets.only(top: 5),
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(16)),
                        height: 60,
                        width: double.infinity,
                        child: TextField(
                          controller: controller,
                          decoration: InputDecoration(
                            hintText: "Search Food",
                            border: InputBorder.none,
                            prefixIcon: const Icon(Icons.search),
                            suffixIcon: Container(
                              margin: const EdgeInsets.only(right: 8),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8)),
                              height: 15,
                              width: 15,
                              child: const Center(
                                child: Icon(
                                  Icons.multitrack_audio_outlined,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      const SizedBox(
                        width: 200,
                        child: Text(
                          'Select \nyour Choices',
                          maxLines: 2,
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Condition(
                        condition: state is BurgerSuccess,
                        before: (context) => const Center(
                          child: CircularProgressIndicator(),
                        ),
                        after: (context) => Column(
                          children: [
                            buildMyList(i, cubit, state, img, false),
                            const SizedBox(
                              height: 20,
                            ),
                            buildMyList(i, cubit, state, img, true)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  SizedBox buildMyList(int i, List<Burger> cubit, BurgerState state,
      List<String> img, bool isTwo) {
    return SizedBox(
      height: 250,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            if (isTwo && index == 0) {
              index = 14;
              i = 4;
            }
            i++;
            if (i == 7) {
              i = 0;
            }
            return MyItem(burger: cubit[index], state: state, image: img[i]);
          },
          separatorBuilder: (context, index) => const SizedBox(
                width: 10,
              ),
          itemCount: 14),
    );
  }

  Widget myShowCase(
      {required GlobalKey globalKey,
      required String des,
      required Widget child}) {
    return Showcase(key: globalKey, child: child, description: des);
  }
}
