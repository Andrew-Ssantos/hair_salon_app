import 'package:flutter/material.dart';
import 'package:hair_salon_app/core/ui/constants/constants.dart';
import 'package:lottie/lottie.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
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
