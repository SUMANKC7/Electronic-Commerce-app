import 'package:electronic_ecommerce/pages/accountpage.dart';
import 'package:electronic_ecommerce/pages/addtocart.dart';
import 'package:electronic_ecommerce/pages/categorypage.dart';
import 'package:electronic_ecommerce/pages/homepage.dart';
import 'package:electronic_ecommerce/provider/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  static final List<Widget> _pages = <Widget>[
    Homepage(),
    Categorypage(),
    Cartpage(),
    MyAccount()
  ];

  @override
  Widget build(BuildContext context) {
    final bottomNavProvider = Provider.of<BottomNavProvider>(context);

    return Scaffold(
      body:
          _pages[bottomNavProvider.SelectedIndex], // Display the selected page
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),
        ],
        currentIndex: bottomNavProvider.SelectedIndex,
        selectedItemColor: const Color.fromARGB(255, 255, 123, 0),
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          bottomNavProvider.updateindex(index);
        },
      ),
    );
  }
}

// Sample pages for each tab
