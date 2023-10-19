import 'package:asp/asp.dart';
import 'package:flutter/material.dart';
import 'package:hair_salon_app/core/widgets/hs_bottom_navigation_bar/atom/hs_bottom_navigation_bar_atom.dart';
import 'package:hair_salon_app/core/widgets/hs_bottom_navigation_bar/hs_bottom_navigation_bar.dart';
import 'package:hair_salon_app/features/dashboard/dashboard_page.dart';
import 'package:hair_salon_app/features/home/presenter/pages/home_page.dart';
import 'package:hair_salon_app/features/schedule/presenter/pages/schedule_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return RxBuilder(
      builder: (context) {
        return Scaffold(
          bottomNavigationBar: RxBuilder(
            builder: (_) => HsBottomNavigationBar(
              currentIndex: currentIndex.value,
              onTap: (i) {
                currentIndex.value = i;
                pageController.animateToPage(
                  i,
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.bounceInOut,
                );
              },
            ),
          ),
          body: Column(
            children: [
              Expanded(
                child: PageView(
                  onPageChanged: (newIndex) => setState(() => currentIndex.value = newIndex),
                  controller: pageController,
                  children: const [
                    HomePage(),
                    SchedulePage(),
                    DashboardPage(),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
