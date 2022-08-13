import 'package:flutter/material.dart';
import 'package:sikopy/screens/pinjaman/pinjaman_screen.dart';
import 'package:sikopy/widget/common.dart';

import 'angsuran/angsuran_screen.dart';
import 'home/home_screen.dart';

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({Key? key}) : super(key: key);

  @override
  State<HomepageScreen> createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> {
  int _currentIndex = 0;

  final tabs = [
    HomeScreen(),
    PinjamanScreen(),
    AngsuranScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              color: (_currentIndex == 0) ? Common.green : Colors.grey,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.monetization_on_outlined,
              color: (_currentIndex == 1) ?  Common.green : Colors.grey,
            ),
            label: 'Pinjaman',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_balance_wallet_outlined,
              color: (_currentIndex == 2) ?  Common.green : Colors.grey,
            ),
            label: 'Angsuran',
          ),
        ],
        selectedItemColor:  Common.green,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      body: tabs[_currentIndex],
    );
  }
}