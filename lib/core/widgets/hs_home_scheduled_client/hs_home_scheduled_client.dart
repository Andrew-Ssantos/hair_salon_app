import 'package:flutter/material.dart';
import 'package:hair_salon_app/core/ui/constants.dart';

class HsHomeScheduledClient extends StatelessWidget {
  const HsHomeScheduledClient({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> scheduledClients = [
      {'name': 'Andrew dos Santos', 'hour': '8:30', 'service': 'Corte Masculino'},
      {'name': 'Camila Vieira Camargo', 'hour': '10:30', 'service': 'Sobrancelha'},
      {'name': 'Wyller dos Santos', 'hour': '09:00', 'service': 'Corte Masculino'},
      {'name': 'Terezinha Maria dos Santos Silva', 'hour': '11:00', 'service': 'Escova'},
      {'name': 'Rebeca Gomes de Araújo', 'hour': '12:30', 'service': 'Progressiva'},
      {'name': 'Luciana', 'hour': '6:30', 'service': 'Corte Feminino'},
      {'name': 'Marcelo Caetano', 'hour': '18:00', 'service': 'Corte Masculino'},
      {'name': 'Maura Gomes Araujo', 'hour': '18:30', 'service': 'Escova'},
      {'name': 'Mario', 'hour': '17:30', 'service': 'Nevou na BARBA + Degrade'},
    ];

    return ListView(
        children: scheduledClients.map((e) {
      return ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        minVerticalPadding: 10,
        contentPadding: const EdgeInsets.all(0),
        title: Text(
          e['name'],
          style: const TextStyle(fontSize: 16),
        ),
        subtitle: Text(
          e['service'],
          style: const TextStyle(
            color: ColorsConstants.grey,
            fontSize: 15,
          ),
        ),
        trailing: Text(
          e['hour'],
          style: const TextStyle(fontSize: 16),
        ),
        onTap: () {},
      );
    }).toList());
  }
}
