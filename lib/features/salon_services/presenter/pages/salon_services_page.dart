import 'dart:developer';

import 'package:asp/asp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hair_salon_app/core/db/collections/salon_service.dart';
import 'package:hair_salon_app/core/ui/constants.dart';
import 'package:hair_salon_app/core/widgets/hs_salon_services_list/hs_salon_services_list.dart';
import 'package:hair_salon_app/features/salon_services/controller/salon_service_controller.dart';
import 'package:validatorless/validatorless.dart';

class SalonServicesPage extends StatefulWidget {
  const SalonServicesPage({Key? key}) : super(key: key);

  @override
  State<SalonServicesPage> createState() => _SalonServicesPageState();
}

class _SalonServicesPageState extends State<SalonServicesPage> {
  final service = Modular.get<SalonServiceController>();

  final formKey = GlobalKey<FormState>();
  final serviceNameEC = TextEditingController();
  final servicePriceEC = TextEditingController();
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
                    return Form(
                      key: formKey,
                      child: AlertDialog(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                        title: const Text('Incluir serviço'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextFormField(
                              controller: serviceNameEC,
                              validator: Validatorless.required('Nome do serviço não pode ser vazio'),
                              decoration: const InputDecoration(
                                labelText: 'Serviço',
                              ),
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              controller: servicePriceEC,
                              validator: Validatorless.required('Preço do serviço não pode ser vazio'),
                              keyboardType: TextInputType.number,
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
                              if (formKey.currentState!.validate()) {
                                try {
                                  final salonService = SalonService()
                                    ..serviceName = serviceNameEC.text
                                    ..price = double.parse(servicePriceEC.text);

                                  service.addSalonService(salonService);
                                  service.fetchSalonServices();
                                } on Exception catch (e, s) {
                                  log('Erro ao incluir serviço', error: e, stackTrace: s);
                                }
                                Navigator.of(context).pop();
                                service.fetchSalonServices();
                              }
                            },
                            child: const Text('SALVAR'),
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                              surfaceTintColor: ColorsConstants.ligthGreen,
                            ),
                            onPressed: () {
                              serviceNameEC.clear();
                              servicePriceEC.clear();
                              Navigator.of(context).pop();
                            },
                            child: const Text(
                              'CANCELAR',
                              style: TextStyle(color: ColorsConstants.red),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              icon: const Icon(Icons.add),
            ),
          ),
        ],
      ),
      body: RxBuilder(
        builder: (BuildContext context) {
          return const Column(
            children: [
              HsSalonServicesList(),
            ],
          );
        },
      ),
    );
  }
}
