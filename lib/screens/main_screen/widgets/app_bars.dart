import 'package:flutter/material.dart';

Color primaryColor = const Color(0xFF00A6B9);

AppBar eventAppBar() {
  return AppBar(
    backgroundColor: Colors.white,
    centerTitle: true,
    title: Text(
      'EVENTS',
      style: TextStyle(color: primaryColor),
    ),
    leading: IconButton(
      icon: Icon(
        Icons.add,
        color: primaryColor,
      ),
      onPressed: () {},
    ),
    actions: [
      IconButton(
        icon: Icon(
          Icons.search,
          color: primaryColor,
        ),
        onPressed: () {},
      ),
    ],
  );
}

AppBar ticketAppBar() {
  return AppBar(
    backgroundColor: Colors.white,
    centerTitle: true,
    title: Text(
      'TICKETS',
      style: TextStyle(color: primaryColor),
    ),
    actions: [
      IconButton(
        icon: Icon(
          Icons.notifications,
          color: primaryColor,
        ),
        onPressed: () {},
      ),
    ],
  );
}

AppBar profileAppBar() {
  return AppBar(
    backgroundColor: Colors.white,
    centerTitle: true,
    title: Text(
      'PROFILE',
      style: TextStyle(color: primaryColor),
    ),
  );
}
