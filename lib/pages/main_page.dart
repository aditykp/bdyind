import 'package:budaya/pages/province_page.dart';
import 'package:budaya/pages/home_page.dart';
import 'package:budaya/pages/nearby_page.dart';
import 'package:flutter/material.dart';
import 'package:budaya/theme.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  Widget customBottomNavBar() {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (value) {
        setState(() {
          currentIndex = value;
        });
      },
      backgroundColor: backgroundColor1,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(top: 25, bottom: 10),
              child: Image.asset(
                'assets/images/home_icon.png',
                width: 21,
                color: currentIndex == 0 ? yellowColor : greyColor,
              ),
            ),
            label: ''),
        BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(top: 25, bottom: 10),
              child: Image.asset(
                'assets/images/city_map.png',
                width: 20,
                color: currentIndex == 1 ? yellowColor : greyColor,
              ),
            ),
            label: ''),
        BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(top: 25, bottom: 10),
              child: Image.asset(
                'assets/images/nearby.png',
                width: 25,
                color: currentIndex == 3 ? yellowColor : greyColor,
              ),
            ),
            label: ''),
      ],
    );
  }

  Widget body() {
    switch (currentIndex) {
      case 0:
        return const HomePage();
      case 1:
        return const ProvincePage();
      case 2:
        return const NearbyPage();
      default:
        return const HomePage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor1,
        bottomNavigationBar: customBottomNavBar(),
        body: body());
  }
}
