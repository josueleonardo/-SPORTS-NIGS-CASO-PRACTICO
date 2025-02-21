import 'package:flutter/material.dart';

class ScheduleSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(title: Text('Horarios y Reservas', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
          Expanded(
            child: ListView(
              children: [
                ListTile(title: Text('Fútbol - 10:00 AM - 12:00 PM')),
                ListTile(title: Text('Natación - 2:00 PM - 4:00 PM')),
                ListTile(title: Text('Gimnasio - 6:00 PM - 8:00 PM')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
