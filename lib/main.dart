import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_engage_extended_demo/models/event_model.dart';
import 'package:provider/provider.dart';

import 'screens/main_screen/main_screen.dart';
import 'services/firestore.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Future<Event> getFirstEvent() async {
    final data = await FirebaseFirestore.instance
        .collection('Events')
        .doc('event')
        .get();
    final Event event = Event(
      title: data['title'] as String,
      description: data['description'] as String,
      imageUrl: data['image-url'] as String,
      attendeeNumber: data['attendee-number'] as int,
      location: data['location'] as String,
      ticketsLeft: data['tickets-left'] as int,
      time: DateTime.parse(data['time'].toDate().toString()),
    );
    return event;
  }

  @override
  Widget build(BuildContext context) {
    final FirestoreService firestoreService = FirestoreService();
    return StreamProvider<List<Event>>(
      create: (context) => firestoreService.events,
      initialData: const [],
      child: MaterialApp(
        title: 'Flutter Engage Extended Demo',
        theme: ThemeData(
          primaryColor: const Color(0xFF00A6B9),
        ),
        home: MainScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
