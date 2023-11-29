import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hair_salon_app/core/ui/constants.dart';
import 'package:hair_salon_app/features/schedule/controller/schedule_client_controller.dart';

class HsScheduleServiceModal extends StatelessWidget {
  final String serviceName;
  final double price;
  final int index;

  const HsScheduleServiceModal({
    super.key,
    required this.serviceName,
    required this.price,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final serviceNameEC = TextEditingController();
    final priceEC = TextEditingController();
    final scheduleClientController = Modular.get<ScheduleClientController>();

    serviceNameEC.text = '$serviceName:';
    priceEC.text = '$price'.contains('.00') ? '$price'.replaceAll('.00', '') : '$price'.replaceAll('.0', '');

    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      title: const Text('Serviço'),
      content: Row(
        children: [
          Expanded(
            child: TextField(
              controller: serviceNameEC,
              enabled: false,
              readOnly: true,
              decoration: const InputDecoration(disabledBorder: InputBorder.none),
              style: const TextStyle(color: Colors.black),
              maxLines: null,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: priceEC,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: ColorsConstants.ligthPurple)),
                enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: ColorsConstants.grey)),
              ),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Modular.to.pop();
          },
          child: const Text('Cancelar', style: TextStyle(color: ColorsConstants.red)),
        ),
        TextButton(
          onPressed: () async {
            await scheduleClientController.updateSalonService(index, double.parse(priceEC.text));
            Modular.to.pop();
          },
          child: const Text('Salvar'),
        )
      ],
    );
  }
}
