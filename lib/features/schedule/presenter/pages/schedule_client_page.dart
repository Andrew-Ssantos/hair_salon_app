import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hair_salon_app/core/ui/constants.dart';
import 'package:hair_salon_app/core/widgets/hs_add_service_modal/hs_add_service_modal.dart';
import 'package:hair_salon_app/core/widgets/hs_salon_services_list/hs_salon_services_list.dart';
import 'package:intl/intl.dart';
import 'package:validatorless/validatorless.dart';

class ScheduleClientPage extends StatefulWidget {
  final DateTime? date;
  const ScheduleClientPage({Key? key, this.date}) : super(key: key);

  @override
  State<ScheduleClientPage> createState() => _ScheduleClientPageState();
}

class _ScheduleClientPageState extends State<ScheduleClientPage> {
  final formKey = GlobalKey<FormState>();
  final clientEC = TextEditingController();
  final dateEC = TextEditingController();
  final startHourEC = TextEditingController();
  final endHourEC = TextEditingController();
  final whatsappEC = TextEditingController();
  final serviceEC = TextEditingController();
  final valueEC = TextEditingController();

  @override
  void initState() {
    _getDateSelected();
    super.initState();
  }

  _getDateSelected() {
    if (widget.date != null) {
      print(widget.date);
      dateEC.text = DateFormat('dd/MM/yyyy').format(widget.date!);
      startHourEC.text = '${widget.date!.hour}:${widget.date!.minute}';
      endHourEC.text = '${widget.date!.hour}:${widget.date!.minute}';
    }
  }

  @override
  Widget build(BuildContext context) {
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
                        mainAxisAlignment: MainAxisAlignment.start,
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
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.datetime,
                                  decoration: const InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(horizontal: 6),
                                    labelText: 'Selecione a data',
                                    floatingLabelAlignment: FloatingLabelAlignment.center,
                                    labelStyle: TextStyle(fontSize: 14, color: ColorsConstants.grey),
                                  ),
                                  controller: dateEC,
                                  validator: Validatorless.required('Campo obrigatório'),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(horizontal: 13),
                                    labelText: 'Horário Inicial',
                                    floatingLabelAlignment: FloatingLabelAlignment.center,
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
                                    contentPadding: EdgeInsets.symmetric(horizontal: 18),
                                    labelText: 'Horário Final',
                                    floatingLabelAlignment: FloatingLabelAlignment.center,
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
                          const Divider(),
                          const Text('SERVIÇOS:', style: TextStyle(fontSize: 14)),
                          const Divider(),
                          const SizedBox(height: 10),
                          Container(
                            height: 275,
                            width: double.infinity,
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              border: Border.all(color: ColorsConstants.ligthPurple, width: 1),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Text('Teste'),
                          ),

                          // TextFormField(
                          //   decoration: const InputDecoration(
                          //     contentPadding: EdgeInsets.only(left: 10),
                          //     labelText: 'Valor',
                          //     labelStyle: TextStyle(fontSize: 14, color: ColorsConstants.grey),
                          //   ),
                          //   controller: valueEC,
                          //   validator: Validatorless.required('Campo obrigatório'),
                          // ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'VALOR TOTAL:',
                                style: TextStyle(
                                  color: ColorsConstants.ligthPurple,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'R\$ 35,00',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
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
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
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
          ],
        ),
      ),
    );
  }
}
