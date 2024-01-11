import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hair_salon_app/core/ui/theme/hs_app_theme.dart';
import 'package:hair_salon_app/features/schedule/atom/scheduled_clients.dart';
import 'package:hair_salon_app/features/schedule/model/schedule_event.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final listScheduledClients = scheduledClients.value;

    return CalendarControllerProvider<ScheduleEvent>(
      controller: EventController<ScheduleEvent>()..addAll(listScheduledClients),
      child: MaterialApp.router(
        localizationsDelegates: const [
          GlobalWidgetsLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [Locale('pt', 'BR')],
        debugShowCheckedModeBanner: false,
        title: 'Hair Salon App',
        theme: HsAppTheme.theme,
        routeInformationParser: Modular.routeInformationParser,
        routerDelegate: Modular.routerDelegate,
      ),
    );
  }
}
