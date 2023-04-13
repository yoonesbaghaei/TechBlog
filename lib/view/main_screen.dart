import 'package:flutter/material.dart';
import 'package:tech_blog/colors.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/view/profile_screen.dart';
import 'home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var selectedPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    double bodyMargin = size.width / 12.3;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: MyColors.scafoldBG,
          automaticallyImplyLeading: false,
          title:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            const Icon(
              Icons.menu,
              color: Colors.black,
            ),
            Image(
                height: size.height / 13.6,
                image: Assets.images.logo.provider()),
            const Icon(
              Icons.search,
              color: Colors.black,
            )
          ]),
        ),
        body: Stack(children: [
          Positioned.fill(child:IndexedStack(
            index: selectedPageIndex,
            children: [
              HomeScreen(size: size, textTheme: textTheme, bodyMargin: bodyMargin),
              ProfileScreen(size: size, textTheme: textTheme, bodyMargin: bodyMargin)
            ],
          )),
          BottomNavigation(size: size, bodyMargin: bodyMargin,changeScreen: (int value){
            setState(() {
              selectedPageIndex = value;
            });
          },),
        ]),
      ),
    );
  }
}

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    super.key,
    required this.size,
    required this.bodyMargin,
    required this.changeScreen,
  });

  final Size size;
  final double bodyMargin;
  final Function(int) changeScreen;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        height: size.height / 10.3,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: GradientColors.bottomNavigationBackGround,
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter)),
        child: Padding(
          padding: EdgeInsets.only(
              right: size.width / 7, left: size.width / 7, bottom: 8),
          child: Container(
            // height: size.height / 13,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                gradient:
                    LinearGradient(colors: GradientColors.bottomNavigation)),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                      onPressed: ()=>changeScreen(0),
                      icon: ImageIcon(
                        Assets.icons.home.provider(),
                        color: Colors.white,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: ImageIcon(
                        Assets.icons.par.provider(),
                        color: Colors.white,
                      )),
                  IconButton(
                      onPressed: ()=>changeScreen(1),
                      icon: ImageIcon(
                        Assets.icons.user.provider(),
                        color: Colors.white,
                      )),
                ]),
          ),
        ),
      ),
    );
  }
}
