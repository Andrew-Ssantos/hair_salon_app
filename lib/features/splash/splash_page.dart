import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hair_salon_app/core/db/database.dart';
import 'package:hair_salon_app/core/ui/constants.dart';
import 'package:lottie/lottie.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  _databaseConnection() async {
    final db = Database();
    await db.connectDB();
  }

  @override
  void initState() {
    _databaseConnection();
    Future.delayed(const Duration(seconds: 3)).then((_) {
      Modular.to.pushReplacementNamed('/main/');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConstants.purple,
      body: Center(
        child: Lottie.asset('lib/core/assets/animation/splash_page_icon.json'),
      ),
    );
  }
}
