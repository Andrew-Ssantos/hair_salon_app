import 'package:flutter/material.dart';
import 'package:hair_salon_app/core/ui/constants.dart';

class ScheduleClientPage extends StatelessWidget {
  const ScheduleClientPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final clientEC = TextEditingController();
    final dateEC = TextEditingController();
    final startHourEC = TextEditingController();
    final endHourEC = TextEditingController();
    final whatsappEC = TextEditingController();
    final serviceEC = TextEditingController();
    final valueEC = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Agendar cliente'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                // icon: Icon(Icons.person),
                contentPadding: EdgeInsets.only(left: 10),
                labelText: 'Cliente',
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              decoration: const InputDecoration(
                // icon: HsIcons.scheduleIcon,
                contentPadding: EdgeInsets.only(left: 10),
                labelText: 'Selecione a data',
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Horário Inicial',
                    constraints: BoxConstraints.tightFor(),
                  ),
                ),
                // const SizedBox(width: 10),
                // TextFormField(
                //   decoration: const InputDecoration(
                //     labelText: 'Horário Final',
                //     constraints: BoxConstraints.tightFor(),
                //   ),
                // ),
              ],
            ),
            const SizedBox(height: 10),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Whatsapp',
                contentPadding: EdgeInsets.only(left: 10),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Serviço',
                contentPadding: EdgeInsets.only(left: 10),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Valor',
                contentPadding: EdgeInsets.only(left: 10),
              ),
            )
          ],
        ),
      ),
    );
  }
}
