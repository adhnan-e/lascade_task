import 'package:flutter/material.dart';
import 'package:lascade_task/src/features/dashboard/widgets/bottom_nav_bar_widget.dart';
import 'package:lascade_task/src/features/home/home_screen.dart';
import 'package:lascade_task/src/providers/dashbord_provider.dart';
import 'package:provider/provider.dart';

import '../favorites/favorites_screen.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery
        .of(context)
        .platformBrightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? const Color(0xff181922) : const Color(
          0xffF1F2F7),
      body: Padding(
        padding: const EdgeInsets.only(top: 60.0),
        child: Consumer<DashBoardProvider>(
          builder: (context, provider, child) {
            return PageView(
              controller: provider.controller,
                onPageChanged: (value) => provider.changeTab(value),
                children: const [
                  HomeScreen(),
                  Center(child: Text("Chart")),
                  FavoriteScreen(),
                  Center(child: Text("Chat")),

                ]);
          },
        ),
      ),
      extendBody: true,
      bottomNavigationBar: const BottomNavBarWidget(),
    );
  }
}
