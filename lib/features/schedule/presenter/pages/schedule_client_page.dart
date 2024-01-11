import 'package:asp/asp.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hair_salon_app/core/db/collections/salon_service.dart';
import 'package:hair_salon_app/core/db/collections/schedule.dart';
import 'package:hair_salon_app/core/ui/constants.dart';
import 'package:hair_salon_app/core/widgets/hs_add_service_modal/hs_add_service_modal.dart';
import 'package:hair_salon_app/core/widgets/hs_date_time_input/hs_date_time_input.dart';
import 'package:hair_salon_app/core/widgets/hs_schedule_client_services/hs_schedule_client_services.dart';
import 'package:hair_salon_app/core/widgets/hs_schedule_service_modal/hs_schedule_service_modal.dart';
import 'package:hair_salon_app/core/widgets/hs_warning_modal/hs_warning_modal.dart';
import 'package:hair_salon_app/features/salon_services/atom/salon_services_atom.dart';
import 'package:hair_salon_app/features/schedule/atom/schedule_client_atom.dart';
import 'package:hair_salon_app/features/schedule/controller/schedule_client_controller.dart';
import 'package:hair_salon_app/features/schedule/controller/schedule_controller.dart';
import 'package:validatorless/validatorless.dart';

class ScheduleClientPage extends StatefulWidget {
  final DateTime? date;
  const ScheduleClientPage({super.key, this.date});

  @override
  State<ScheduleClientPage> createState() => _ScheduleClientPageState();
}

class _ScheduleClientPageState extends State<ScheduleClientPage> {
  final formKey = GlobalKey<FormState>();
  final clientEC = TextEditingController();
  final whatsappEC = TextEditingController();

  bool checkBoxValue = false;

  final scheduleClientController = Modular.get<ScheduleClientController>();
  final scheduleController = Modular.get<ScheduleController>();

  @override
  void dispose() {
    scheduleClientServiceList.value.clear();
    totalValue.value = 0.00;
    clientEC.clear();
    whatsappEC.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agendar Cliente'),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              fillOverscroll: true,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        inputFormatters: [LengthLimitingTextInputFormatter(60)],
                        decoration: const InputDecoration(
                          // icon: Icon(Icons.person),
                          contentPadding: EdgeInsets.only(left: 10),
                          labelText: 'Nome do cliente',
                          labelStyle: TextStyle(fontSize: 15, color: ColorsConstants.grey),
                        ),
                        controller: clientEC,
                        validator: Validatorless.required('Campo obrigatório'),
                      ),
                      const SizedBox(height: 10),
                      HsDateTimeInput(context: context, date: widget.date),
                      const SizedBox(height: 10),
                      TextFormField(
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(20),
                          FilteringTextInputFormatter.digitsOnly,
                          TelefoneInputFormatter(),
                        ],
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.only(left: 10),
                          labelText: 'Whatsapp',
                          labelStyle: TextStyle(fontSize: 14, color: ColorsConstants.grey),
                          hintText: '(XX) XXXXX-XXXX',
                          hintStyle:
                              TextStyle(fontSize: 14, color: ColorsConstants.ligthGrey, fontWeight: FontWeight.normal),
                        ),
                        controller: whatsappEC,
                        validator: Validatorless.required('Campo obrigatório'),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: RxBuilder(
                              builder: (context) {
                                return DropdownButtonFormField<SalonService>(
                                  menuMaxHeight: MediaQuery.of(context).size.height * 0.65,
                                  decoration:
                                      const InputDecoration(contentPadding: EdgeInsets.symmetric(horizontal: 10)),
                                  focusColor: Colors.white,
                                  iconSize: 14,
                                  icon: const RotatedBox(quarterTurns: 3, child: Icon(Icons.arrow_back_ios)),
                                  hint: const Text(
                                    'Serviços',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: ColorsConstants.grey,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  isDense: false,
                                  borderRadius: BorderRadius.circular(5),
                                  onChanged: (service) {
                                    String message = scheduleClientController.checkRepeatedService(service!.id);
                                    if (message == '' || message.isEmpty) {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return HsScheduleServiceModal(
                                            id: service.id,
                                            serviceName: service.serviceName!,
                                            price: service.price!,
                                            type: Type.adding,
                                          );
                                        },
                                      );
                                    } else {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return HsWarningModal(message: message);
                                        },
                                      );
                                    }
                                  },
                                  items: salonServicesList.value.map((service) {
                                    return DropdownMenuItem<SalonService>(
                                      value: service,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            service.serviceName!,
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          Text(
                                            'R\$ ${service.price!.toStringAsFixed(2)}',
                                            style: const TextStyle(
                                              color: ColorsConstants.grey,
                                              fontSize: 12,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }).toList(),
                                  validator: (_) =>
                                      scheduleClientServiceList.value.isEmpty ? 'Inclua um serviço!' : null,
                                );
                              },
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: TextButton.icon(
                              onPressed: () async {
                                await showDialog(
                                  context: context,
                                  builder: ((context) => const HsAddServiceModal(isUpdatingService: false)),
                                );
                                setState(() {});
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
                      Row(
                        children: [
                          Checkbox(
                              splashRadius: 0,
                              value: checkBoxValue,
                              onChanged: (bool? newValue) {
                                setState(() {
                                  checkBoxValue = newValue!;
                                });
                              }),
                          const Text('Serviço Finalizado?')
                        ],
                      ),
                      const SizedBox(height: 5),
                      const Divider(height: 12),
                      const Text('SERVIÇOS:', style: TextStyle(fontSize: 13)),
                      const Divider(height: 12),
                      const SizedBox(height: 10),
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            border: Border.all(color: ColorsConstants.ligthPurple, width: 1),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          // child: Text(''),
                          child: const Column(
                            children: [
                              Expanded(child: HsScheduleClientServices()),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'VALOR TOTAL:',
                                  style: TextStyle(
                                    color: ColorsConstants.ligthPurple,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                RxBuilder(
                                  builder: (context) {
                                    return Text(
                                      "R\$ ${totalValue.value.toStringAsFixed(2)}",
                                      textAlign: TextAlign.end,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: ColorsConstants.ligthGreen,
                                foregroundColor: ColorsConstants.purple,
                              ),
                              child: const Text('AGENDAR'),
                              onPressed: () async {
                                if (formKey.currentState!.validate()) {
                                  final String whatsappNumber = whatsappEC.text.replaceAll(RegExp(r'\D'), '');
                                  final scheduledClient = Schedule()
                                    ..clientName = clientEC.text
                                    ..date = date.value
                                    ..startHour = initialHour.value
                                    ..endHour = finalHour.value
                                    ..whatsappNumber = whatsappNumber
                                    ..price = totalValue.value
                                    ..isServiceFinished = checkBoxValue;

                                  for (var i = 0; i < scheduleClientServiceList.value.length; i++) {
                                    scheduledClient.services.add(scheduleClientServiceList.value[i]);
                                  }

                                  await scheduleController.addScheduledClient(scheduledClient);
                                  await scheduleController.fetchAllScheduledClients();
                                  Modular.to.pop();
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
