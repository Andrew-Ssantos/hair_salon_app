import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hair_salon_app/core/ui/constants.dart';

class HsSalonServicesList extends StatelessWidget {
  const HsSalonServicesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> services = [
      {'service_name': 'Corte Masculino', 'price': 25},
      {'service_name': 'Corte Feminino', 'price': 35},
      {'service_name': 'Barba', 'price': 15},
      {'service_name': 'Escova', 'price': 40},
      {'service_name': 'Progessiva', 'price': 120},
      {'service_name': 'Sobrancelha', 'price': 20},
      {'service_name': 'Botox', 'price': 100},
    ];

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView.separated(
          separatorBuilder: (context, index) => const Divider(),
          itemCount: services.length,
          itemBuilder: (context, index) {
            return ListTile(
              contentPadding: const EdgeInsets.all(0),
              title: Text(
                services[index]['service_name'],
                style: const TextStyle(fontSize: 18),
              ),
              subtitle: Text(
                ('R\$ ${services[index]['price'].toStringAsFixed(2)}'),
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
                    onTap: () {},
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
  }
}
