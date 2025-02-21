import 'package:flutter/material.dart';

class AdminAutomation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(title: Text('Gestión Administrativa', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
          ElevatedButton(
            onPressed: () {
              // Simulación de generación de reportes
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Reporte generado con éxito')),
              );
            },
            child: Text('Generar Reporte de Asistencias'),
          ),
          ElevatedButton(
            onPressed: () {
              // Simulación de envío de alerta
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Alerta enviada a los administradores')),
              );
            },
            child: Text('Enviar Alerta'),
          ),
        ],
      ),
    );
  }
}