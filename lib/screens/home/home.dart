import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../data/coffee_data.dart';
import '../../widgets/coffee_items.dart';
import '../../widgets/filter.dart';
import '../../widgets/searchbar.dart';
import '../getStarted/get_started.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final List<Coffee> coffees = coffee;
    return Scaffold(
      backgroundColor: const Color(0xff0c0f14),
      appBar: AppBar(
        actions: [
          const Padding(
            padding: EdgeInsets.only(right: 18.0),
            child: Icon(Icons.notifications, size: 28),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 18.0),
            child: IconButton(
                onPressed: () {
                  _auth.signOut();
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const GetStarted())));
                },
                icon: const Icon(Icons.logout)),
          )
        ],
        toolbarHeight: 100,
        leading: Builder(builder: (context) {
          return IconButton(
            icon: const Icon(
              Icons.dashboard_rounded,
              size: 28,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        }),
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        elevation: 0,
      ),
      bottomNavigationBar: bottomNavBar(context),
      drawer: const Drawer(),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Text(
              "Find the best coffee for you",
              style: Theme.of(context).textTheme.displaySmall,
            ),
            const SizedBox(height: 20),
            const CustomSearchBar(),
            const SizedBox(height: 20),
            const FilterTab(),
            const SizedBox(
              height: 26,
            ),
            CoffeeItems(coffees: coffees),
          ],
        ),
      ),
    );
  }

  Widget bottomNavBar(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      backgroundColor: const Color(0xff191619),
      selectedItemColor: const Color(0xFFD17842),
      unselectedItemColor: const Color(0xff4e5053),
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 30), label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag, size: 30), label: 'Shop'),
        BottomNavigationBarItem(
            icon: Icon(Icons.favorite, size: 30), label: 'Favorite'),
        BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 30), label: 'Profile'),
      ],
    );
  }
}
