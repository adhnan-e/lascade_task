import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChipItemWidget extends StatelessWidget {
  const ChipItemWidget({Key? key,  this.image="assets/Chart.png",  this.value='139,820 KM'}) : super(key: key);
final String image;
final String value;
  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return  Container(
      decoration: BoxDecoration(
          borderRadius:
          const BorderRadius.all(Radius.circular(14)),
          color: isDark?const Color(0xff181922):Colors.white,
          border: Border.all(color:isDark?const Color(0xff181922):const Color(0xffD6DADF),width: 0.5 )
      ),
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
          SvgPicture.asset(image,
              height: 15, width: 15),
          const SizedBox(
            width: 4,
          ),
          Text(value,style: TextStyle(color: isDark?const Color(0xff7781A7).withOpacity(0.800000011920929):const Color(0xff001E48)),)
        ]),
      ),
    );
  }
}
