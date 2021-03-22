import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_engage_extended_demo/models/event_model.dart';

class FirestoreService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  // 取得 Events 集合下的所有文件並轉成 List<Event> 的 Stream
  Stream<List<Event>> get events {
    return firestore
        .collection('Events')
        .snapshots()
        .map((snapshot) => snapshot.docs.map((document) {
              final event = Event.fromMap(document.data());
              event.id = document.id;
              return event;
            }).toList());
  }

  // 報名活動
  Future<void> signUpEvent(String eventId) async {
    firestore.collection('Events').doc(eventId).update(
      {
        'attendee-number': FieldValue.increment(1),
        'tickets-left': FieldValue.increment(-1),
      },
    );
  }
}
