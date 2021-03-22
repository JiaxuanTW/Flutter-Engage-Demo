import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_engage_extended_demo/models/event_model.dart';
import 'package:flutter_engage_extended_demo/widgets/event_item.dart';
import 'package:provider/provider.dart';

class EventPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Event> eventList = Provider.of<List<Event>>(context);
    return ListView(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 1.0,
            autoPlay: true,
          ),
          items: [
            Image.network(
              'https://firebasestorage.googleapis.com/v0/b/flutter-engage-extended-demo.appspot.com/o/event-image%2Focfp-OG-image.png?alt=media&token=b3afd67f-0004-4191-8c05-cdce420146a0',
              fit: BoxFit.cover,
            ),
            Image.network(
              'https://firebasestorage.googleapis.com/v0/b/flutter-engage-extended-demo.appspot.com/o/event-image%2Fmaxresdefault.jpg?alt=media&token=f6415332-cfb6-4445-af50-925c2ecd783a',
              fit: BoxFit.cover,
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            '所有活動',
            style: TextStyle(
              fontSize: 18.0,
            ),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          itemCount: eventList.length,
          itemBuilder: (context, index) => EventItem(
            event: eventList[index],
          ),
        )
      ],
    );
  }
}
