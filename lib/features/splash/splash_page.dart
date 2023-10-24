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
  final db = Database();

  @override
  void initState() {
    super.initState();
    db.connectDB();
    Future.delayed(const Duration(seconds: 3)).then((_) {
      Modular.to.pushReplacementNamed('/main/');
    });
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
