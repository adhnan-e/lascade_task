import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lascade_task/src/features/resuts/result_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            children: [
              SvgPicture.asset('assets/home/logo.svg',),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration:  BoxDecoration(
                    color:isDark ? const Color(0xff242634):Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const CircleAvatar(
                      backgroundColor: Color(0xffFC964B), //
                      backgroundImage: AssetImage('assets/home/profile.png')),
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ResultScreen(),)),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 9, vertical: 12),
              decoration: BoxDecoration(
                  color:isDark ? Color(0xff242634):Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              child: Row(children: [
                Icon(Icons.search,color: Color(0xff7781A7)),
                Text("Search your destination",style: TextStyle(color: Color(0xff7781A7),fontSize: 14,fontWeight: FontWeight.w500)),
                Spacer(),
                Container(
                  width: 30,
                  height: 30,
                  child: Icon(Icons.arrow_forward_ios_rounded, size: 20,color: isDark ?null:Colors.white),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Color(0xff004FC5),
                      Color(0xff4B19FD),
                    ]),
                    shape: BoxShape.circle,
                  ),
                )
              ]),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(15),
          child: Image.asset("assets/home/slider.png"),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Row(
            children: [
              Expanded(
                  child: Container(
                height: 1,
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Color(0xff002F75),
                  Color(0xff0A2D73).withOpacity(0.18)
                ])),
              )),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text("Galaxies",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 18,color:isDark? Colors.white:null)),
              ),
              Expanded(
                  child: Container(
                height: 1,
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Color(0xff0A2D73).withOpacity(0.18),
                  Color(0xff002F75)
                ])),
              )),
            ],
          ),
        ),

        Image.asset('assets/home/home_dataper.png'),
        
      ],
    );
  }
}
