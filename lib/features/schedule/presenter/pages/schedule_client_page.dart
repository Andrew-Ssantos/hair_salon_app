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
      body: SafeArea(
        child: CustomScrollView(
          reverse: true,
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Column(
                      // mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(
                            // icon: Icon(Icons.person),
                            contentPadding: EdgeInsets.only(left: 10),
                            labelText: 'Cliente',
                            labelStyle: TextStyle(fontSize: 14, color: ColorsConstants.grey),
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          keyboardType: TextInputType.datetime,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.only(left: 10),
                            labelText: 'Selecione a data',
                            labelStyle: TextStyle(fontSize: 14, color: ColorsConstants.grey),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Expanded(
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.only(left: 10),
                                  labelText: 'Horário Inicial',
                                  labelStyle: TextStyle(fontSize: 14, color: ColorsConstants.grey),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.only(left: 10),
                                  labelText: 'Horário Final',
                                  labelStyle: TextStyle(fontSize: 14, color: ColorsConstants.grey),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.only(left: 10),
                            labelText: 'Whatsapp',
                            labelStyle: TextStyle(fontSize: 14, color: ColorsConstants.grey),
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.only(left: 10),
                            labelText: 'Serviço',
                            labelStyle: TextStyle(fontSize: 14, color: ColorsConstants.grey),
                          ),
                        ),
                        const SizedBox(height: 10),
                        // TextFormField(
                        //   decoration: const InputDecoration(
                        //     contentPadding: EdgeInsets.only(left: 10),
                        //     labelText: 'Valor',
                        //     labelStyle: TextStyle(fontSize: 14, color: ColorsConstants.grey),
                        //   ),
                        // ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorsConstants.ligthGreen,
                          foregroundColor: ColorsConstants.purple,
                        ),
                        child: const Text('AGENDAR'),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
