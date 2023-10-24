import 'package:asp/asp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hair_salon_app/app_module.dart';
import 'package:hair_salon_app/app_widget.dart';
import 'package:hair_salon_app/core/db/database.dart';

void main() async {
  final db = Database();
  await db.connectDB();

  return runApp(
    RxRoot(
      child: ModularApp(
        module: AppModule(),
        child: const AppWidget(),
      ),
    ),
  );
}
