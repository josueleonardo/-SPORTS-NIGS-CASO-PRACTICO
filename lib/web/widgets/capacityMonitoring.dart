import 'package:flutter/material.dart';

class CapacityMonitoring extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(title: Text('Monitoreo de Aforo', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Zona de gimnasio: 75% ocupada', style: TextStyle(fontSize: 16, color: Colors.red)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Piscina: 40% ocupada', style: TextStyle(fontSize: 16, color: Colors.green)),
          ),
        ],
      ),
    );
  }
}