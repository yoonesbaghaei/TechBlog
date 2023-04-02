import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tech_blog/colors.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/view/splash_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: myColors.scafoldBG,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: myColors.scafoldBG,
      systemNavigationBarIconBrightness: Brightness.dark));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('fa', ''), // persian
      ],
      home: splashScreen(),
      theme: ThemeData(
          fontFamily: 'dana',
          brightness: Brightness.light,
          textTheme:  const TextTheme(
            displayLarge: TextStyle(
                fontFamily: 'dana',
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: myColors.lightText),
            titleMedium:TextStyle(
                fontFamily: 'dana',
                fontSize: 16,
                fontWeight: FontWeight.w300,
                color: myColors.subTitleText),
            displayMedium: TextStyle(
                fontFamily: 'dana',
                fontSize: 14,
                fontWeight: FontWeight.w300,
                color: Colors.white),
            displaySmall: TextStyle(
                fontFamily: 'dana',
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: myColors.colorHotList),
            headlineMedium: TextStyle(
                fontFamily: 'dana',
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: Color.fromARGB(255, 70, 70, 70)),
            bodyLarge: TextStyle(
                fontFamily: 'dana',
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: Colors.black),
          )),
    );
  }
}
