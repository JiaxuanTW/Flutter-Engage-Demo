import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_engage_extended_demo/models/event_model.dart';
import 'package:flutter_engage_extended_demo/services/firestore.dart';

Color primaryColor = const Color(0xFF00A6B9);

class EventItemScreen extends StatelessWidget {
  final String eventId;
  const EventItemScreen({Key key, this.eventId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Object>(
        stream: FirebaseFirestore.instance
            .collection('Events')
            .doc(eventId)
            .snapshots()
            .map((event) => Event.fromFirestore(event)),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            final Event event = snapshot.data as Event;
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                leading: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(
                    Icons.arrow_back_outlined,
                    color: primaryColor,
                  ),
                ),
                title: Text(
                  event.title,
                  style: TextStyle(color: primaryColor),
                ),
              ),
              body: ListView(
                children: [
                  AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Image.network(
                      event.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      event.title,
                      style: const TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ListTile(
                    dense: true,
                    leading: Icon(
                      Icons.calendar_today,
                      color: primaryColor,
                    ),
                    title: Text(event.time.toString()),
                  ),
                  ListTile(
                    dense: true,
                    leading: Icon(
                      Icons.map,
                      color: primaryColor,
                    ),
                    title: Text(event.location),
                  ),
                  ListTile(
                    dense: true,
                    leading: Icon(
                      Icons.error,
                      color: primaryColor,
                    ),
                    title: Text('餘剩票數 ${event.ticketsLeft}'),
                  ),
                  ListTile(
                    dense: true,
                    leading: Icon(
                      Icons.accessibility,
                      color: primaryColor,
                    ),
                    title: Text('報名人數 ${event.attendeeNumber}'),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      '活動介紹',
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(event.description),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 80.0,
                  ),
                ],
              ),
              floatingActionButton: FloatingActionButton.extended(
                onPressed: () async {
                  final FirestoreService firestoreService = FirestoreService();
                  await firestoreService.signUpEvent(event.id);
                },
                icon: const Icon(Icons.create),
                backgroundColor: primaryColor,
                label: const Text('立即報名'),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerFloat,
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else {
            return const CircularProgressIndicator();
          }
        });
  }
}
