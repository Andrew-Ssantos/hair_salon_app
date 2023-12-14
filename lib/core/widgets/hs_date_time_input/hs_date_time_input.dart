import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hair_salon_app/core/ui/constants.dart';
import 'package:hair_salon_app/features/schedule/atom/schedule_client_atom.dart';
import 'package:intl/intl.dart';
import 'package:validatorless/validatorless.dart';

enum Time { initial, end }

enum Hour { full, half }

class HsDateTimeInput extends StatefulWidget {
  final BuildContext context;
  final DateTime? date;

  const HsDateTimeInput({super.key, required this.context, this.date});

  @override
  State<HsDateTimeInput> createState() => _HsDateTimeInputState();
}

class _HsDateTimeInputState extends State<HsDateTimeInput> {
  final dateEC = TextEditingController();
  final startHourEC = TextEditingController();
  final endHourEC = TextEditingController();

  _convertTimeToString(int hour, int minute) {
    return '${hour.toStringAsFixed(0).padLeft(2, '0')}:${minute.toStringAsFixed(0).padLeft(2, '0')}';
  }

  _showTimeAlertMessage(String message) {
    return showDialog(
      context: widget.context,
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

    initialHour.value = time;
    startHourEC.text = _convertTimeToString(hour, minute);
    if (minute == 30) {
      hour += 1;
      minute = 00;
    } else {
      minute = 30;
    }
    finalHour.value = DateTime(time.year, time.month, time.day, hour, minute);
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
      (pickedDate) {
        date.value = pickedDate!;
        return dateEC.text = DateFormat('dd/MM/yyyy').format(pickedDate);
      },
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
                    initialHour.value = time;
                  }
                case false:
                  final String endTime = _convertTimeToString(time.hour, time.minute);
                  endHourEC.text = _checkTimeLessOrMore(startHourEC.text, endTime, Time.end);
                  finalHour.value = time;
              }
            },
          );
  }

  @override
  void initState() {
    _getDateSelected();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        HsDateTimeTextFormField(
          hint: 'Selec. a data',
          label: 'Data',
          controller: dateEC,
          validator: Validatorless.required('Campo obrigatório'),
          onTap: () async {
            await _showDatePickerDialog(context);
          },
        ),
        const SizedBox(width: 10),
        HsDateTimeTextFormField(
          hint: 'Hora Inicial',
          label: 'Hora Inicial',
          controller: startHourEC,
          validator: Validatorless.required('Campo obrigatório'),
          onTap: () async {
            await _showTimePickerDialog(context, true);
          },
        ),
        const SizedBox(width: 10),
        HsDateTimeTextFormField(
          hint: 'Hora Final',
          label: 'Hora Final',
          controller: endHourEC,
          validator: Validatorless.required('Campo obrigatório'),
          onTap: () async {
            await _showTimePickerDialog(context, false);
          },
        )
      ],
    );
  }
}

class HsDateTimeTextFormField extends StatelessWidget {
  final String hint;
  final String label;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final void Function()? onTap;

  const HsDateTimeTextFormField({
    super.key,
    required this.hint,
    required this.label,
    required this.controller,
    this.validator,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFormField(
        readOnly: true,
        textAlign: TextAlign.center,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(0),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          floatingLabelAlignment: FloatingLabelAlignment.center,
          hintText: hint,
          hintStyle: const TextStyle(
            fontSize: 14,
            color: ColorsConstants.grey,
            fontWeight: FontWeight.w400,
          ),
          labelText: label,
          labelStyle: const TextStyle(
            fontSize: 14,
            color: ColorsConstants.grey,
            fontWeight: FontWeight.w400,
          ),
        ),
        controller: controller,
        validator: validator,
        onTap: onTap,
      ),
    );
  }
}
