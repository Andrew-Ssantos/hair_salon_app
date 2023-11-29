import 'package:asp/asp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hair_salon_app/core/db/collections/salon_service.dart';
import 'package:hair_salon_app/core/ui/constants.dart';
import 'package:hair_salon_app/core/widgets/hs_add_service_modal/hs_add_service_modal.dart';
import 'package:hair_salon_app/features/salon_services/controller/salon_service_controller.dart';

class HsSalonServicesList extends StatefulWidget {
  final List<SalonService> salonServices;
  const HsSalonServicesList({
    super.key,
    required this.salonServices,
  });

  @override
  State<HsSalonServicesList> createState() => _HsSalonServicesListState();
}

class _HsSalonServicesListState extends State<HsSalonServicesList> {
  final service = Modular.get<SalonServiceController>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView.separated(
          separatorBuilder: (context, index) => const Divider(),
          itemCount: widget.salonServices.length,
          itemBuilder: (context, index) {
            return ListTile(
              contentPadding: const EdgeInsets.all(0),
              title: Text(
                '${widget.salonServices[index].serviceName}',
                style: const TextStyle(fontSize: 18),
              ),
              subtitle: Text(
                ('R\$ ${widget.salonServices[index].price!.toStringAsFixed(2)}'),
                style: const TextStyle(color: ColorsConstants.grey, fontSize: 15),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                    splashColor: ColorsConstants.ligthPurple.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(5),
                    child: HsIcons.editIcon,
                    onTap: () async {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return HsAddServiceModal(
                            isUpdatingService: true,
                            salonServiceId: widget.salonServices[index].id,
                          );
                        },
                      );
                    },
                  ),
                  const SizedBox(width: 10),
                  InkWell(
                    splashColor: ColorsConstants.ligthPurple.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(5),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                            title: const Text(
                              'Excluir serviço',
                              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                            ),
                            content: const Text('Confirma a exclusão do serviço?'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text(
                                  'CANCELAR',
                                  style: TextStyle(color: ColorsConstants.purple),
                                ),
                              ),
                              TextButton(
                                onPressed: () async {
                                  await service.deleteSalonService(widget.salonServices[index]);
                                  await service.fetchSalonServices();
                                  Modular.to.pop();
                                },
                                child: const Text(
                                  'CONFIRMAR',
                                  style: TextStyle(color: ColorsConstants.red),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: HsIcons.deleteIcon,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
