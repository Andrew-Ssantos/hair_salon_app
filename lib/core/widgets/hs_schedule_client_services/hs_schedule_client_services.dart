import 'package:asp/asp.dart';
import 'package:flutter/material.dart';
import 'package:hair_salon_app/features/schedule/atom/schedule_client_atom.dart';

class HsScheduleClientServices extends StatefulWidget {
  const HsScheduleClientServices({super.key});

  @override
  State<HsScheduleClientServices> createState() => _HsScheduleClientServicesState();
}

class _HsScheduleClientServicesState extends State<HsScheduleClientServices> {
  @override
  Widget build(BuildContext context) {
    return RxBuilder(
      builder: (context) {
        return Column(
          children: [
            ListView.separated(
              separatorBuilder: (context, index) => const Divider(),
              itemCount: scheduleClientServiceList.value.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(scheduleClientServiceList.value[index].serviceName!),
                  subtitle: Text('${scheduleClientServiceList.value[index].price!}'),
                  trailing: Row(
                    children: [
                      InkWell(
                        child: const Icon(Icons.close),
                        onTap: () => scheduleClientServiceList.value.removeAt(index),
                      ),
                    ],
                  ),
                );
              },
            )
          ],
        );
      },
    );
  }
}
