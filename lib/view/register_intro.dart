import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tech_blog/component/strings.dart';
import 'package:tech_blog/view/my_cats.dart';
import '../gen/assets.gen.dart';
import 'package:validators/validators.dart';

class RegisterIntro extends StatelessWidget {
  const RegisterIntro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    var textTheme = Theme.of(context).textTheme;
    return SafeArea(
        child: Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            Assets.images.tcbot.path,
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 60),
            child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: MyStrings.welcome, style: textTheme.displayMedium)),
          ),
          ElevatedButton(
            onPressed: (() {
              _showEmailBottomSheet(context, size, textTheme);
            }),
            child: const Text(
              "بزن بریم ",
            ),
          )
        ],
      )),
    ));
  }

  //inputEmail
  Future<dynamic> _showEmailBottomSheet(
      BuildContext context, Size size, TextTheme textTheme) {
    return showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        backgroundColor: Colors.transparent,
        builder: ((context) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              height: size.height / 2.5,
              // width: size.width,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    MyStrings.insertYourEmail,
                    style: textTheme.displayMedium,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: TextField(
                      onChanged: (value) {
                        print("${value}is Email : ${isEmail(value)}");
                      },
                      style: textTheme.displayMedium,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          hintText: "techblog@gmail.com",
                          hintStyle: textTheme.labelSmall),
                    ),
                  ),
                  ElevatedButton(onPressed: (() {
                    Navigator.pop(context);
                    _activateCodeBottomSheet(context, size, textTheme);
                  }), child: const Text("ادامه"))
                ],
              ),
            ),
          );
        }));
  }

  //inputActivateCode
  Future<dynamic> _activateCodeBottomSheet(
      BuildContext context, Size size, TextTheme textTheme) {
    return showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        backgroundColor: Colors.transparent,
        builder: ((context) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              height: size.height / 2.5,
              // width: size.width,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    MyStrings.activateCode,
                    style: textTheme.displayMedium,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: TextField(
                      onChanged: (value) {
                        print("${value}is Email : ${isEmail(value)}");
                      },
                      style: textTheme.displayMedium,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          hintText: "* * * * * *",
                          hintStyle: textTheme.labelSmall),
                    ),
                  ),
                  ElevatedButton(onPressed: (() {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>const MyCats()));
                  }), child: const Text("ادامه"))
                ],
              ),
            ),
          );
        }));
  }
}
