import 'package:cloud_firestore/cloud_firestore.dart';

class Event {
  String id;
  String title;
  String description;
  String imageUrl;
  DateTime time;
  String location;
  int ticketsLeft;
  int attendeeNumber;

  Event({
    this.title,
    this.description,
    this.imageUrl,
    this.attendeeNumber,
    this.location,
    this.ticketsLeft,
    this.time,
  });

  Event.fromMap(Map<String, dynamic> data)
      : title = data['title'] as String,
        description = data['description'] as String,
        imageUrl = data['image-url'] as String,
        attendeeNumber = data['attendee-number'] as int,
        location = data['location'] as String,
        ticketsLeft = data['tickets-left'] as int,
        time = DateTime.parse(data['time'].toDate().toString());

  Event.fromFirestore(DocumentSnapshot documentSnapshot) {
    final Map data = documentSnapshot.data();
    id = documentSnapshot.id;
    title = data['title'] as String;
    description = data['description'] as String;
    imageUrl = data['image-url'] as String;
    attendeeNumber = data['attendee-number'] as int;
    location = data['location'] as String;
    ticketsLeft = data['tickets-left'] as int;
    time = DateTime.parse(data['time'].toDate().toString());
  }
}

set id(String eventId) {
  id = eventId;
}
