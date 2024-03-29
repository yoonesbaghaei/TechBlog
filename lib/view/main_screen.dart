import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:tech_blog/component/api_constant.dart';
import 'package:tech_blog/component/colors.dart';
import 'package:tech_blog/component/my_component.dart';
import 'package:tech_blog/component/strings.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/services/dio_service.dart';
import 'package:tech_blog/view/profile_screen.dart';
import 'package:tech_blog/view/register_intro.dart';
import 'package:url_launcher/url_launcher.dart';
import 'home_screen.dart';


final GlobalKey<ScaffoldState> _key = GlobalKey();
class MainScreen extends StatelessWidget {
  RxInt selectedPageIndex = 0.obs;

  MainScreen({super.key});

  @override
  Widget build(BuildContext context) {

    DioService().getMethod(ApiConstant.getHomeItem);

    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    double bodyMargin = size.width / 12.3;

    return SafeArea(
      child: Scaffold(
        key: _key,
        drawer: Drawer(
          backgroundColor: MyColors.scafoldBG,
          child: Padding(
            padding: EdgeInsets.only(right: bodyMargin,left: bodyMargin),
            child: ListView(
              children: [
                DrawerHeader(
                    child: Center(
                  child: Image.asset(
                    Assets.images.logo.path,
                    scale: 3,
                  ),
                )),
                ListTile(
                  title: Text('پروفایل کاربری', style: textTheme.bodyLarge),
                  onTap: (() {}),
                ),
                const Divider(
                  color: MyColors.dividerColor,
                ),
                ListTile(
                  title: Text('درباره تک‌بلاگ', style: textTheme.bodyLarge),
                  onTap: (() {}),
                ),
                const Divider(
                  color: MyColors.dividerColor,
                ),
                ListTile(
                  title: Text('اشتراک گذاری تک بلاگ', style: textTheme.bodyLarge),
                  onTap: (() async{
                    await Share.share(MyStrings.shareText);
                  }),
                ),
                const Divider(
                  color: MyColors.dividerColor,
                ),
                ListTile(
                  title: Text('تک‌بلاگ در گیت هاب', style: textTheme.bodyLarge),
                  onTap: (() async{
                    myLaunchUrl(MyStrings.techBlogGithubUrl);

                  }),
                ),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: MyColors.scafoldBG,
          automaticallyImplyLeading: false,
          title:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            InkWell(
              onTap: ((){
                _key.currentState!.openDrawer();
              }),
              child: const Icon(
                Icons.menu,
                color: Colors.black,
              ),
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
          Positioned.fill(
              child: Obx(() => IndexedStack(
                index: selectedPageIndex.value,
                children: [
                  HomeScreen(
                      size: size, textTheme: textTheme, bodyMargin: bodyMargin),
                  ProfileScreen(
                      size: size, textTheme: textTheme, bodyMargin: bodyMargin)
                ],
              ))
          ),
          BottomNavigation(
            size: size,
            bodyMargin: bodyMargin,
            changeScreen: (int value) {
                selectedPageIndex.value = value;

            },
          ),
        ]),
      ),
    );
  }
}

class BottomNavigation extends StatefulWidget {
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
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        height: widget.size.height / 10.3,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: GradientColors.bottomNavigationBackGround,
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter)),
        child: Padding(
          padding: EdgeInsets.only(
              right: widget.size.width / 7, left: widget.size.width / 7, bottom: 8),
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
                      onPressed: () => widget.changeScreen(0),
                      icon: ImageIcon(
                        Assets.icons.home.provider(),
                        color: Colors.white,
                      )),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>const RegisterIntro()));
                        });
                      },
                      icon: ImageIcon(
                        Assets.icons.par.provider(),
                        color: Colors.white,
                      )),
                  IconButton(
                      onPressed: () => widget.changeScreen(1),
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
