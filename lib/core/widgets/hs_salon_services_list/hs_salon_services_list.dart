import 'package:asp/asp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hair_salon_app/core/db/collections/salon_service.dart';
import 'package:hair_salon_app/core/db/database.dart';
import 'package:hair_salon_app/core/ui/constants.dart';
import 'package:hair_salon_app/features/salon_services/atom/salon_services_atom.dart';
import 'package:hair_salon_app/features/salon_services/controller/salon_service_controller.dart';

class HsSalonServicesList extends StatefulWidget {
  const HsSalonServicesList({Key? key}) : super(key: key);

  @override
  State<HsSalonServicesList> createState() => _HsSalonServicesListState();
}

class _HsSalonServicesListState extends State<HsSalonServicesList> {
  List<SalonService> salonServices = salonServicesList.value;
  final service = Modular.get<SalonServiceController>();

  @override
  void initState() {
    super.initState();
    final servicesList = service.fetchSalonServices();
    setState(() {
      salonServices.clear();
      // salonServices.addAll(servicesList);
    });
  }

  @override
  Widget build(BuildContext context) {
    // final List<Map<String, dynamic>> services = [
    //   {'service_name': 'Corte Masculino', 'price': 25},
    //   {'service_name': 'Corte Feminino', 'price': 35},
    //   {'service_name': 'Barba', 'price': 15},
    //   {'service_name': 'Escova', 'price': 40},
    //   {'service_name': 'Progessiva', 'price': 120},
    //   {'service_name': 'Sobrancelha', 'price': 20},
    //   {'service_name': 'Botox', 'price': 100},
    // ];

    return RxBuilder(
      builder: (context) {
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: ListView.separated(
              separatorBuilder: (context, index) => const Divider(),
              itemCount: salonServices.length,
              itemBuilder: (context, index) {
                return ListTile(
                  contentPadding: const EdgeInsets.all(0),
                  title: Text(
                    '${salonServices[index].serviceName}',
                    style: const TextStyle(fontSize: 18),
                  ),
                  subtitle: Text(
                    ('R\$ ${salonServices[index].price!.toStringAsFixed(2)}'),
                    style: const TextStyle(color: ColorsConstants.grey, fontSize: 15),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      InkWell(
                        splashColor: ColorsConstants.ligthPurple.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(5),
                        child: HsIcons.editIcon,
                        onTap: () {},
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
                                      Database().deleteSalonService(salonServices[index]);
                                      SalonServiceController().fetchSalonServices();
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text(
                                      'CONFIRMAR',
                                      style: TextStyle(color: ColorsConstants.red),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text(
                                      'CANCELAR',
                                      style: TextStyle(color: ColorsConstants.purple),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: HsIcons.deleteIcon,
                      ),
                      // IconButton(
                      //   onPressed: () {},
                      //   icon: HsIcons.editIcon,
                      // ),
                      // IconButton(
                      //   onPressed: () {},
                      //   icon: HsIcons.deleteIcon,
                      // ),
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
