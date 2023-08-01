import 'package:flutter/material.dart';
import 'package:lascade_task/src/providers/dashbord_provider.dart';
import 'package:provider/provider.dart';

class BottomNavBarWidget extends StatelessWidget {
  const BottomNavBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
      child: Container(
        decoration: BoxDecoration(
            color: isDark ? const Color(0xff10101B) : const Color(0xff002B75),
            //002F75,
            borderRadius: const BorderRadius.all(Radius.circular(26))),
        padding: const EdgeInsets.symmetric(horizontal: 34),
        child: Consumer<DashBoardProvider>(
          builder: (context, provider, child) {
            return Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 34),
                  child: Row(children: [
                    Image.asset(
                        key:provider.index0,
                        'assets/Home.png'),
                    const Spacer(),
                    Image.asset(
                        key:provider.index1,'assets/Chart.png',
                        color: Colors.white.withOpacity(0.30000001192092896)),
                    const Spacer(),
                    Image.asset( key:provider.index2,'assets/Heart.png',
                        color: Colors.white.withOpacity(0.30000001192092896)),
                    const Spacer(),
                    Image.asset( key:provider.index3,'assets/Chat.png',
                        color: Colors.white.withOpacity(0.30000001192092896)),
                  ]),
                ),
                AnimatedPositioned(
                  bottom: 22,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.fastOutSlowIn,
                  left: provider.selectedPositionX,
                  child: Container(
                    width: 6,
                    height: 6,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Color(0xff004FC5),
                        Color(0xff4B19FD),
                      ]),
                      shape: BoxShape.circle,
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
