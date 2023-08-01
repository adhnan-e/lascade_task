import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lascade_task/src/features/favorites/widgets/chip_item_widget.dart';
import 'package:lascade_task/src/features/favorites/widgets/item_adpter_widget.dart';
import 'package:lascade_task/src/widgets/dotted_line_widget.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16.0,bottom: 16,left: 12,right: 12),
          child: SizedBox(

            width: double.infinity,
            child: Center(
              child: Stack(

                alignment: Alignment.centerLeft,
                children: [
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.arrow_back_ios_new_rounded),
                      Spacer(),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Favorites",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                            color:
                                isDark ? Colors.white : const Color(0xff001E48)),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.only(top: 14),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return const ItemAdapterWidget();
            },
          ),
        )
      ],
    );
  }
}
