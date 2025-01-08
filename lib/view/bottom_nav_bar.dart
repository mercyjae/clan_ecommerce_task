import 'package:ecommerce/notifier/cart_provider.dart';
import 'package:ecommerce/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final List<Widget> _screens = [
    HomeScreen(),
    const Center(
        child: Text(
      'Search Screen',
      style: TextStyle(fontWeight: FontWeight.bold),
    )),
    const Center(
        child: Text('Favourite Screen',
            style: TextStyle(fontWeight: FontWeight.bold))),
    const Center(
        child: Text('Profile Screen',
            style: TextStyle(fontWeight: FontWeight.bold)))
  ];

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      body: _screens[productProvider.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w700),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w700),
        currentIndex: productProvider.currentIndex,
        onTap: (index) {
          productProvider.setIndex(index);
        },
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favorites",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
