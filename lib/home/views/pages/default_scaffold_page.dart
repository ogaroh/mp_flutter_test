import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:moniepoint_test/app/theme/colors.dart';
import 'package:moniepoint_test/home/views/pages/home.dart';
import 'package:moniepoint_test/home/views/pages/search.dart';

enum _SelectedTab { search, message, home, favorite, user }

class DefaultScaffoldPage extends StatefulWidget {
  const DefaultScaffoldPage({super.key});

  @override
  State<DefaultScaffoldPage> createState() => _DefaultScaffoldPageState();
}

class _DefaultScaffoldPageState extends State<DefaultScaffoldPage> {
  var _selectedTab = _SelectedTab.home;

  // handle index changed
  void _handleIndexChanged(int i) {
    setState(() {
      _selectedTab = _SelectedTab.values[i];
    });
  }

  // map selected enum to widget
  Widget mapTabToWidget() {
    Widget widget = const HomePage();
    switch (_selectedTab) {
      case _SelectedTab.search:
        widget = const SearchPage();
      case _SelectedTab.message:
        widget = const Center(
          child: Text('Message'),
        );
      case _SelectedTab.home:
        widget = const HomePage();

      case _SelectedTab.favorite:
        widget = const Center(
          child: Text('Favorite'),
        );

      case _SelectedTab.user:
        widget = const Center(
          child: Text('User'),
        );
    }

    return widget;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: mapTabToWidget(),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: CrystalNavigationBar(
          selectedItemColor: kDefaultOrange,
          unselectedItemColor: Colors.white70,
          currentIndex: _SelectedTab.values.indexOf(_selectedTab),
          height: 10,
          // indicatorColor: Colors.blue,
          backgroundColor: kDefaultBlack.withOpacity(0.9),
          onTap: _handleIndexChanged,
          items: [
            /// Search
            CrystalNavigationBarItem(
              icon: IconlyBold.search,
              unselectedIcon: IconlyLight.search,
            ),

            /// Favourite
            CrystalNavigationBarItem(
              icon: IconlyBold.message,
              unselectedIcon: IconlyLight.message,
              selectedColor: Colors.blue,
              // selectedColor: Colors.red,
            ),

            /// Home
            CrystalNavigationBarItem(
              icon: IconlyBold.home,
              unselectedIcon: IconlyLight.home,
              // selectedColor: Colors.white,
            ),

            /// Add
            CrystalNavigationBarItem(
              icon: IconlyBold.heart,
              unselectedIcon: IconlyLight.heart,
              selectedColor: Colors.red,
            ),

            /// Profile
            CrystalNavigationBarItem(
              icon: IconlyBold.user_2,
              unselectedIcon: IconlyLight.user,
            ),
          ],
        ),
      ),
    );
  }
}
