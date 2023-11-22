import 'package:asp/asp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hair_salon_app/core/db/collections/salon_service.dart';
import 'package:hair_salon_app/core/ui/constants.dart';
import 'package:hair_salon_app/core/widgets/hs_add_service_modal/hs_add_service_modal.dart';
import 'package:hair_salon_app/core/widgets/hs_schedule_client_services/hs_schedule_client_services.dart';
import 'package:hair_salon_app/features/salon_services/atom/salon_services_atom.dart';
import 'package:hair_salon_app/features/salon_services/controller/salon_service_controller.dart';
import 'package:hair_salon_app/features/schedule/atom/schedule_client_atom.dart';
import 'package:intl/intl.dart';
import 'package:validatorless/validatorless.dart';

enum Time { initial, end }

enum Hour { full, half }

class ScheduleClientPage extends StatefulWidget {
  final DateTime? date;
  const ScheduleClientPage({super.key, this.date});

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

  final salonServiceController = Modular.get<SalonServiceController>();
  List<SalonService> salonServices = salonServicesList.value;

  @override
  void initState() {
    _getDateSelected();
    super.initState();
  }

  _convertTimeToString(int hour, int minute) {
    return '${hour.toStringAsFixed(0).padLeft(2, '0')}:${minute.toStringAsFixed(0).padLeft(2, '0')}';
  }

  _showTimeAlertMessage(String message) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          backgroundColor: Colors.white,
          actions: [
            TextButton(
              onPressed: () {
                Modular.to.pop();
              },
              child: const Text(
                'Fechar',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
          title: const Text('Horário Inválido'),
          content: Text(message),
        );
      },
    );
  }

  _setHour(DateTime time) {
    int hour = int.parse('${time.hour}');
    int minute = int.parse('${time.minute}');

    startHourEC.text = _convertTimeToString(hour, minute);
    if (minute == 30) {
      hour += 1;
      minute = 00;
    } else {
      minute = 30;
    }
    endHourEC.text = _convertTimeToString(hour, minute);
  }

  _getDateSelected() {
    if (widget.date != null) {
      dateEC.text = DateFormat('dd/MM/yyyy').format(widget.date!);
      _setHour(widget.date!);
    }
  }

  _checkTimeLessOrMore(String initialTime, String endTime, Time timeType) {
    final List<String> convertInitialHour = initialTime.split(':');
    final List<String> convertEndHour = endTime.split(':');

    final initialHour = int.parse(convertInitialHour[0]);
    final initialMinute = int.parse(convertInitialHour[1]);
    final endHour = int.parse(convertEndHour[0]);
    final endMinute = int.parse(convertEndHour[1]);

    final hourType = initialMinute > endMinute ? Hour.half : Hour.full;

    switch (timeType) {
      case Time.initial:
        if (initialHour > endHour || initialHour == endHour && hourType == Hour.half) {
          return _showTimeAlertMessage('Horário Inicial não pode ser maior do que o Horário Final.');
        } else if (initialTime == endTime) {
          return _showTimeAlertMessage('Horário inicial e final não podem ser iguais.');
        } else {
          return _convertTimeToString(initialHour, initialMinute);
        }

      case Time.end:
        if (endHour < initialHour && endHourEC.text.isNotEmpty || endHour == initialHour && hourType == Hour.half) {
          return _showTimeAlertMessage('Horário Final não pode ser menor do que o Horário Inicial.');
        } else if (initialTime == endTime) {
          return _showTimeAlertMessage('Horário inicial e final não podem ser iguais.');
        } else {
          return _convertTimeToString(endHour, endMinute);
        }
    }
  }

  _showDatePickerDialog(context) {
    return showDatePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 10),
      lastDate: DateTime(DateTime.now().year + 10),
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      initialDate: DateTime.now(),
    ).then(
      (pickedDate) => dateEC.text = DateFormat('dd/MM/yyyy').format(pickedDate!),
    );
  }

  _showTimePickerDialog(context, isInitialHour) {
    !isInitialHour && startHourEC.text.isEmpty
        ? _showTimeAlertMessage('Hora Inicial não pode estar vazia.\nPreencha Hora Inicial primeiro.')
        : showTimePicker(
            context: context,
            initialTime: TimeOfDay.now(),
          ).then(
            (pickedTime) {
              final now = DateTime.now();
              final time = DateTime(
                now.year,
                now.month,
                now.day,
                pickedTime!.hour,
                pickedTime.minute,
              );

              switch (isInitialHour) {
                case true:
                  if (endHourEC.text == '' || endHourEC.text.isEmpty) {
                    _setHour(time);
                  } else {
                    final String initialTime = _convertTimeToString(time.hour, time.minute);
                    startHourEC.text = _checkTimeLessOrMore(initialTime, endHourEC.text, Time.initial);
                  }
                case false:
                  final String endTime = _convertTimeToString(time.hour, time.minute);
                  endHourEC.text = _checkTimeLessOrMore(startHourEC.text, endTime, Time.end);
              }
            },
          );
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
              hasScrollBody: false,
              fillOverscroll: true,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          // icon: Icon(Icons.person),
                          contentPadding: EdgeInsets.only(left: 10),
                          labelText: 'Cliente',
                          labelStyle: TextStyle(fontSize: 15, color: ColorsConstants.grey),
                        ),
                        controller: clientEC,
                        validator: Validatorless.required('Campo obrigatório'),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              readOnly: true,
                              textAlign: TextAlign.center,
                              textAlignVertical: TextAlignVertical.center,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.only(left: 10),
                                floatingLabelAlignment: FloatingLabelAlignment.center,
                                labelText: 'Selec. a data',
                                labelStyle: TextStyle(
                                  fontSize: 14,
                                  color: ColorsConstants.grey,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              controller: dateEC,
                              validator: Validatorless.required('Campo obrigatório'),
                              onTap: () async {
                                await _showDatePickerDialog(context);
                              },
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: TextFormField(
                              readOnly: true,
                              textAlign: TextAlign.center,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                                labelText: 'Hora Inicial',
                                floatingLabelAlignment: FloatingLabelAlignment.center,
                                labelStyle: TextStyle(
                                  fontSize: 14,
                                  color: ColorsConstants.grey,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              controller: startHourEC,
                              validator: Validatorless.required('Campo obrigatório'),
                              onTap: () async {
                                await _showTimePickerDialog(context, true);
                              },
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: TextFormField(
                              readOnly: true,
                              textAlign: TextAlign.center,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                                labelText: 'Hora Final',
                                floatingLabelAlignment: FloatingLabelAlignment.center,
                                labelStyle: TextStyle(
                                  fontSize: 14,
                                  color: ColorsConstants.grey,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              controller: endHourEC,
                              validator: Validatorless.required('Campo obrigatório'),
                              onTap: () async {
                                await _showTimePickerDialog(context, false);
                              },
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
                          hintText: '(Apenas números)',
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
                                  decoration: const InputDecoration(
                                    contentPadding: EdgeInsets.only(left: 10),
                                    // labelText: 'Serviço',
                                    // labelStyle: TextStyle(fontSize: 14, color: ColorsConstants.grey),
                                  ),
                                  hint: const Text('Serviços'),
                                  borderRadius: BorderRadius.circular(5),
                                  // controller: serviceEC,
                                  onChanged: (service) {
                                    scheduleClientServiceList.value.add(service!);
                                  },
                                  items: salonServices
                                      ?.map(
                                        (service) => DropdownMenuItem<SalonService>(
                                          value: service,
                                          child: ListTile(
                                            title: Text(
                                              service.serviceName!,
                                              style: const TextStyle(fontSize: 16),
                                            ),
                                            trailing: Text(
                                              service.price!.toStringAsFixed(2),
                                              style: const TextStyle(
                                                  color: ColorsConstants.grey,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                        ),
                                      )
                                      .toList(),
                                  validator: Validatorless.required('Campo obrigatório'),
                                );
                              },
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
                      const Divider(height: 12),
                      const Text('SERVIÇOS:', style: TextStyle(fontSize: 13)),
                      const Divider(height: 12),
                      const SizedBox(height: 10),
                      Positioned.fill(
                        child: Expanded(
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              border: Border.all(color: ColorsConstants.ligthPurple, width: 1),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: const Expanded(child: HsScheduleClientServices()),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Positioned.fill(
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Expanded(
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
