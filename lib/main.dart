 import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tech_blog/component/colors.dart';
import 'package:tech_blog/view/main_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: MyColors.scafoldBG,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: MyColors.scafoldBG,
      systemNavigationBarIconBrightness: Brightness.dark));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme
        .of(context)
        .textTheme;
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
      home: const MainScreen(),
      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(width: 2)
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(style: ButtonStyle(
          textStyle: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return textTheme.displayLarge;
            }
            return textTheme.titleMedium;
          }),
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return const Color.fromARGB(255, 138, 75, 155);
            }
            return MyColors.primaryColor;
          }),
        ),),
          fontFamily: 'dana',
          brightness: Brightness.light,
          textTheme:  const TextTheme(
            titleSmall: TextStyle(fontFamily: 'dana',
                fontSize: 14,
                fontWeight: FontWeight.w300,
                color: MyColors.lightText),
            displayLarge: TextStyle(
                fontFamily: 'dana',
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: MyColors.lightText),
            titleMedium:TextStyle(
                fontFamily: 'dana',
                fontSize: 16,
                fontWeight: FontWeight.w300,
                color: MyColors.subTitleText),
            displayMedium: TextStyle(
                fontFamily: 'dana',
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: MyColors.infoSubTitleArticle),
            displaySmall: TextStyle(
                fontFamily: 'dana',
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: MyColors.colorHotList),
            headlineMedium: TextStyle(
                fontFamily: 'dana',
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: MyColors.primaryColor),
            labelMedium: TextStyle(
                fontFamily: 'dana',
                fontSize: 14,
                fontWeight: FontWeight.w300,
                color: MyColors.primaryColor),
            bodyLarge: TextStyle(
                fontFamily: 'dana',
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: Colors.black),
            labelSmall: TextStyle(
                fontFamily: 'dana',
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color:MyColors.hintText),
          )),
    );
  }
}
