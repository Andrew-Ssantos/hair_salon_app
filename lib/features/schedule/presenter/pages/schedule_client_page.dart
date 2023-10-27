import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hair_salon_app/core/ui/constants.dart';
import 'package:hair_salon_app/core/widgets/hs_add_service_modal/hs_add_service_modal.dart';
import 'package:validatorless/validatorless.dart';

class ScheduleClientPage extends StatelessWidget {
  const ScheduleClientPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final clientEC = TextEditingController();
    final dateEC = TextEditingController();
    final startHourEC = TextEditingController();
    final endHourEC = TextEditingController();
    final whatsappEC = TextEditingController();
    final serviceEC = TextEditingController();
    final valueEC = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Agendar Cliente'),
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
                    Form(
                      key: formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: const InputDecoration(
                              // icon: Icon(Icons.person),
                              contentPadding: EdgeInsets.only(left: 10),
                              labelText: 'Cliente',
                              labelStyle: TextStyle(fontSize: 14, color: ColorsConstants.grey),
                            ),
                            controller: clientEC,
                            validator: Validatorless.required('Campo obrigatório'),
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            keyboardType: TextInputType.datetime,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.only(left: 10),
                              labelText: 'Selecione a data',
                              labelStyle: TextStyle(fontSize: 14, color: ColorsConstants.grey),
                            ),
                            controller: dateEC,
                            validator: Validatorless.required('Campo obrigatório'),
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
                                  controller: startHourEC,
                                  validator: Validatorless.required('Campo obrigatório'),
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
                                  controller: endHourEC,
                                  validator: Validatorless.required('Campo obrigatório'),
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
                            controller: whatsappEC,
                            validator: Validatorless.required('Campo obrigatório'),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    contentPadding: EdgeInsets.only(left: 10),
                                    labelText: 'Serviço',
                                    labelStyle: TextStyle(fontSize: 14, color: ColorsConstants.grey),
                                  ),
                                  controller: serviceEC,
                                  validator: Validatorless.required('Campo obrigatório'),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: TextButton.icon(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: ((context) => const HsAddServiceModal(isUpdatingService: false)),
                                    );
                                    // HsAddServiceModal(
                                    //   isButtonType: true,
                                    // );
                                  },
                                  icon: const Icon(Icons.add, size: 20),
                                  label: const Text(
                                    'CADASTRAR SERVIÇO',
                                    style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.only(left: 10),
                              labelText: 'Valor',
                              labelStyle: TextStyle(fontSize: 14, color: ColorsConstants.grey),
                            ),
                            controller: valueEC,
                            validator: Validatorless.required('Campo obrigatório'),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorsConstants.ligthGreen,
                          foregroundColor: ColorsConstants.purple,
                        ),
                        child: const Text('AGENDAR'),
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            Modular.to.pop();
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
