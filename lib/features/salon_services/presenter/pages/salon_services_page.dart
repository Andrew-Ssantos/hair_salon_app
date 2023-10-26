import 'package:asp/asp.dart';
import 'package:flutter/material.dart';
import 'package:hair_salon_app/core/db/collections/salon_service.dart';
import 'package:hair_salon_app/core/ui/constants.dart';
import 'package:hair_salon_app/core/widgets/hs_add_service_modal/hs_add_service_modal.dart';
import 'package:hair_salon_app/core/widgets/hs_salon_services_list/hs_salon_services_list.dart';
import 'package:hair_salon_app/features/salon_services/atom/salon_services_atom.dart';
import 'package:hair_salon_app/features/salon_services/presenter/states/salon_services_states.dart';

class SalonServicesPage extends StatefulWidget {
  const SalonServicesPage({Key? key}) : super(key: key);

  @override
  State<SalonServicesPage> createState() => _SalonServicesPageState();
}

class _SalonServicesPageState extends State<SalonServicesPage> {
  @override
  Widget build(BuildContext context) {
    final state = context.select(() => salonServicesState.value);

    return switch (state) {
      SalonServicesStatesLoading _ => const Center(child: CircularProgressIndicator()),
      SalonServicesStatesSuccess state => buildData(state.data),
      SalonServicesStatesFail _ => Container(height: 10, width: 10, color: ColorsConstants.darkgrey)
    };
  }

  Widget buildData(List<SalonService> servicesList) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Serviços'),
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(
                onPressed: () {
                  showDialog(context: context, builder: (context) => const HsAddServiceModal());
                },
                icon: const Icon(Icons.add),
              )),
        ],
      ),
      body: Column(
        children: [
          HsSalonServicesList(salonServices: servicesList),
        ],
      ),
    );
  }
}
