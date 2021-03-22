import 'package:flutter/material.dart';
import 'package:flutter_engage_extended_demo/screens/main_screen/pages/event_page.dart';
import 'package:flutter_engage_extended_demo/screens/main_screen/pages/profile_page.dart';
import 'package:flutter_engage_extended_demo/screens/main_screen/pages/ticket_page.dart';
import 'package:flutter_engage_extended_demo/screens/main_screen/widgets/app_bars.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<AppBar> _appBars = [
    eventAppBar(),
    ticketAppBar(),
    profileAppBar(),
  ];

  final List<Widget> _pages = [
    EventPage(),
    TicketPage(),
    ProfilePage(),
  ];

  int _selectedPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBars[_selectedPage],
      body: IndexedStack(
        index: _selectedPage,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: false,
        onTap: (int index) {
          setState(() {
            _selectedPage = index;
          });
        },
        currentIndex: _selectedPage,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            label: 'Events',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.archive),
            label: 'Tickets',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
