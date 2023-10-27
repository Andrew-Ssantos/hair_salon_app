import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hair_salon_app/core/db/collections/salon_service.dart';
import 'package:hair_salon_app/core/ui/constants.dart';
import 'package:hair_salon_app/features/salon_services/controller/salon_service_controller.dart';
import 'package:validatorless/validatorless.dart';

class HsAddServiceModal extends StatefulWidget {
  final int? salonServiceId;
  final bool isUpdatingService;

  const HsAddServiceModal({
    super.key,
    required this.isUpdatingService,
    this.salonServiceId,
  });

  @override
  State<HsAddServiceModal> createState() => _HsAddServiceModalState();
}

class _HsAddServiceModalState extends State<HsAddServiceModal> {
  final service = Modular.get<SalonServiceController>();

  final formKey = GlobalKey<FormState>();
  final serviceNameEC = TextEditingController();
  final servicePriceEC = TextEditingController();

  @override
  void initState() {
    _getServiceData();
    super.initState();
  }

  _getServiceData() async {
    if (widget.isUpdatingService) {
      final SalonService salonService = await service.findSingleSalonService(widget.salonServiceId!);
      serviceNameEC.text = salonService.serviceName!;
      servicePriceEC.text = salonService.price.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
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
            onPressed: () async {
              if (formKey.currentState!.validate()) {
                switch (widget.isUpdatingService) {
                  case false:
                    try {
                      final salonService = SalonService()
                        ..serviceName = serviceNameEC.text
                        ..price = double.parse(servicePriceEC.text.contains(',')
                            ? servicePriceEC.text.replaceAll(',', '.')
                            : servicePriceEC.text);

                      await service.addSalonService(salonService);
                    } on Exception catch (e, s) {
                      log('Erro ao incluir serviço', error: e, stackTrace: s);
                    }
                    serviceNameEC.clear();
                    servicePriceEC.clear();
                    await service.fetchSalonServices();
                    Modular.to.pop();

                  case true:
                    try {
                      final salonService = SalonService()
                        ..id = widget.salonServiceId!
                        ..serviceName = serviceNameEC.text
                        ..price = double.parse(servicePriceEC.text);

                      await service.updateSalonService(salonService);
                    } on Exception catch (e, s) {
                      log('Erro ao atualizar serviço', error: e, stackTrace: s);
                    }
                    serviceNameEC.clear();
                    servicePriceEC.clear();
                    await service.fetchSalonServices();
                    Modular.to.pop();
                }
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
              Modular.to.pop();
            },
            child: const Text(
              'CANCELAR',
              style: TextStyle(color: ColorsConstants.red),
            ),
          ),
        ],
      ),
    );
  }
}
