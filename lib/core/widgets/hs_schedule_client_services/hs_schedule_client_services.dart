import 'package:asp/asp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hair_salon_app/core/db/collections/salon_service.dart';
import 'package:hair_salon_app/core/ui/constants.dart';
import 'package:hair_salon_app/core/widgets/hs_schedule_service_modal/hs_schedule_service_modal.dart';
import 'package:hair_salon_app/core/widgets/hs_warning_modal/hs_warning_modal.dart';
import 'package:hair_salon_app/features/schedule/atom/schedule_client_atom.dart';
import 'package:hair_salon_app/features/schedule/controller/schedule_client_controller.dart';
import 'package:hair_salon_app/features/schedule/presenter/state/schedule_salon_services_state.dart';

class HsScheduleClientServices extends StatefulWidget {
  const HsScheduleClientServices({super.key});

  @override
  State<HsScheduleClientServices> createState() => _HsScheduleClientServicesState();
}

class _HsScheduleClientServicesState extends State<HsScheduleClientServices> {
  final scheduleClientController = Modular.get<ScheduleClientController>();

  Widget _emptyList() => const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text('Nenhum serviço adicionado'), Text('Adicione pelo menos um serviço!')],
      );

  _showAlertError(String message) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Modular.to.pop(),
              child: const Text('Fechar'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildData(List<SalonService> servicesList) {
    return RxBuilder(
      builder: (context) {
        return Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) => const Divider(indent: 5, endIndent: 5),
            itemCount: servicesList.length,
            itemBuilder: (context, index) {
              return ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 5),
                title: Text(servicesList[index].serviceName!),
                subtitle: Text(servicesList[index].price!.toStringAsFixed(2)),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                      child: const Icon(
                        Icons.edit,
                        color: ColorsConstants.green,
                      ),
                      onTap: () => showDialog(
                        context: context,
                        builder: (context) {
                          return HsScheduleServiceModal(
                            serviceName: servicesList[index].serviceName!,
                            price: servicesList[index].price!,
                            index: index,
                            type: Type.updating,
                          );
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                    InkWell(
                      child: const Icon(Icons.close, color: ColorsConstants.red),
                      onTap: () {
                        scheduleClientController.subtractTotalValue(index);
                        scheduleClientController.deleteSalonService(servicesList[index]);
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = context.select(() => scheduleSalonServicesState.value);

    return switch (state) {
      ScheduleSalonServicesStateEmpty _ => _emptyList(),
      ScheduleSalonServicesStateLoading _ => const Center(child: CircularProgressIndicator()),
      ScheduleSalonServicesStateSuccess state => _buildData(state.data),
      ScheduleSalonServicesStateFail state => state.errorMessage == 'Erro: Serviço já incluído'
          ? _showAlertError(state.errorMessage)
          : Center(child: Text(state.errorMessage)),
    };
  }
}
