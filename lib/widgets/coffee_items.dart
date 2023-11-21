import 'package:flutter/material.dart';

import '../data/coffee_data.dart';

class CoffeeItems extends StatelessWidget {
  const CoffeeItems({
    Key? key,
    required this.coffees,
  }) : super(key: key);

  final List<Coffee> coffees;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 1.25,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            childAspectRatio: 0.72,
            mainAxisSpacing: 15,
            maxCrossAxisExtent: 200),
        physics: const NeverScrollableScrollPhysics(),
        // scrollDirection: Axis.horizontal,
        itemCount: coffees.length,
        itemBuilder: (context, index) {
          return Container(
            // width: 200,
            // height: 300,
            margin: const EdgeInsets.only(right: 15.0),
            padding: const EdgeInsets.all(15.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: const Color(0xff141921),
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 20.0,
                              spreadRadius: 1.0,
                              color: Color(0xff30221f),
                            ),
                          ],
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(coffees[index].images),
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            coffees[index].title,
                            style: const TextStyle(fontSize: 16),
                          ),
                          Text(
                            coffees[index].subTitle,
                            style: const TextStyle(fontSize: 10),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RichText(
                                text: TextSpan(
                                  children: [
                                    const TextSpan(
                                        text: '₹\t',
                                        style: TextStyle(
                                            color: Color(0xFFD17842),
                                            fontSize: 21)),
                                    TextSpan(
                                        text: coffees[index].price,
                                        style: const TextStyle(
                                            color: Color(0xFFD17842),
                                            fontSize: 21)),
                                  ],
                                ),
                              ),
                              Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFD17842),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Icon(
                                  Icons.add_rounded,
                                  size: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 22.0,
                  width: 55.0,
                  decoration: const BoxDecoration(
                    color: Color(0xff231715),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20.0),
                      bottomLeft: Radius.circular(15.0),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Icon(
                        Icons.star_rounded,
                        size: 15,
                        color: Color(0xFFD17842),
                      ),
                      Text(coffees[index].rating,
                          style: const TextStyle(fontSize: 12))
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
