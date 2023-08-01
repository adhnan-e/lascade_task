import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lascade_task/src/features/dashboard/dashbord_screen.dart';
import 'package:lascade_task/src/providers/dashbord_provider.dart';
import 'package:lascade_task/src/providers/result_provider.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DashBoardProvider()),
        ChangeNotifierProvider(create: (_) => ResultProvider()),
      ],
      child: MaterialApp(
        title: 'Lascode Task',
        theme: ThemeData(

          textTheme: GoogleFonts.interTextTheme(),
          fontFamily: GoogleFonts.inter().fontFamily,
          primaryColor:const Color(0xff002B75) ,
          colorScheme: const ColorScheme(
              brightness: Brightness.light,
              primary: Color(0xff002B75),
              onPrimary: Color(0xff002B75),
              secondary: Color(0xff6C8DE9),
              onSecondary: Color(0xff6C8DE9),
              error: Colors.red,
              onError: Colors.red,
              background: Color(0xffF1F2F7),
              onBackground: Color(0xffF1F2F7),
              surface: Color(0xffffffff),
              onSurface:  Color(0xffffffff)),
          useMaterial3: true,
        ),
        darkTheme: ThemeData(
          primaryColor: const Color(0xff10101B),
          textTheme: GoogleFonts.interTextTheme(),
          fontFamily: GoogleFonts.inter().fontFamily,
          colorScheme: const ColorScheme(
              brightness: Brightness.dark,
              primary:  Color(0xff10101B),
              onPrimary: Color(0xff10101B),
              secondary: Color(0xff7781A7),
              onSecondary: Color(0xff7781A7),
              error: Colors.red,
              onError: Colors.red,
              background: Color(0xff181922),
              onBackground: Color(0xff181922),
              surface:  Color(0xff42634),
              onSurface:  Color(0xff42634)),
          useMaterial3: true,
        ),
        builder: (context, child) {
          return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
              child: child!);
        },
        themeMode: ThemeMode.system,
        home: const DashBoardScreen(),
      ),
    );
  }
}
