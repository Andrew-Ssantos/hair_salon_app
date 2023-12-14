import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hair_salon_app/core/db/collections/salon_service.dart';
import 'package:hair_salon_app/core/ui/constants.dart';
import 'package:hair_salon_app/features/schedule/controller/schedule_client_controller.dart';

enum Type { adding, updating }

class HsScheduleServiceModal extends StatelessWidget {
  int? id;
  final String serviceName;
  final double price;
  int? index;
  final Type type;

  HsScheduleServiceModal({
    super.key,
    this.id,
    required this.serviceName,
    required this.price,
    this.index,
    required this.type,
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
            switch (type) {
              case Type.adding:
                await scheduleClientController.addSalonService(
                  SalonService()
                    ..id = id!
                    ..serviceName = serviceNameEC.text.replaceAll(':', '')
                    ..price = double.parse(priceEC.text),
                );
                scheduleClientController.sumTotalValue();

                Modular.to.pop();
              case Type.updating:
                await scheduleClientController.updateSalonService(index!, double.parse(priceEC.text));
                scheduleClientController.sumTotalValue();

                Modular.to.pop();
            }
          },
          child: const Text('Salvar'),
        )
      ],
    );
  }
}
