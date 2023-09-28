import 'package:flutter/material.dart';
import 'package:hair_salon_app/core/ui/constants.dart';
import 'package:hair_salon_app/core/widgets/hs_salon_services_list/hs_salon_services_list.dart';

class SalonServicesPage extends StatelessWidget {
  const SalonServicesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Serviços'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                      title: const Text('Incluir serviço'),
                      content: const Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextField(
                            decoration: const InputDecoration(
                              labelText: 'Serviço',
                            ),
                          ),
                          const SizedBox(height: 20),
                          TextField(
                            decoration: const InputDecoration(labelText: 'Valor'),
                          ),
                        ],
                      ),
                      actions: [
                        TextButton(
                          style: TextButton.styleFrom(
                            surfaceTintColor: ColorsConstants.ligthGreen,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('SALVAR'),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                            surfaceTintColor: ColorsConstants.ligthGreen,
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text(
                            'CANCELAR',
                            style: TextStyle(color: ColorsConstants.red),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              icon: const Icon(Icons.add),
            ),
          ),
        ],
      ),
      body: const Column(
        children: [
          HsSalonServicesList(),
        ],
      ),
    );
  }
}
