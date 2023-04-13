import 'package:flutter/material.dart';
import 'package:tech_blog/my_component.dart';
import '../strings.dart';
import '../colors.dart';
import '../gen/assets.gen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    super.key,
    required this.size,
    required this.textTheme,
    required this.bodyMargin,
  });

  final Size size;
  final TextTheme textTheme;
  final double bodyMargin;

  get homePagePosterMap => null;

  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(image: Assets.images.avatar.provider(), width: 100),
        const SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImageIcon(
              Assets.icons.bluePen.provider(),
              color: MyColors.colorHotList,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              MyStrings.editeProfilePhoto,
              style: textTheme.displaySmall,
            )
          ],
        ),
        const SizedBox(
          height: 60,
        ),
        Text(
          "فاطمه امیری",
          style: textTheme.headlineMedium,
        ),
        Text(
          "fateme.amiri@gmail.com",
          style: textTheme.bodyLarge,
        ),
        const SizedBox(
          height: 40,
        ),
        ThecDivider(size: size),
        InkWell(
          splashColor: MyColors.primaryColor,
          onTap: () {},
          child: SizedBox(
              height: 35,
              width: size.width/2,
              child: Center(child: Text(MyStrings.myFavBlog, style: textTheme.bodyLarge))),
        ),
        ThecDivider(size: size),
        InkWell(
          splashColor: MyColors.primaryColor,
          onTap: () {},
          child: SizedBox(
              height: 35,
              width: size.width/2,
              child: Center(child: Text(MyStrings.myFavPodcast, style: textTheme.bodyLarge))),
        ),
        ThecDivider(size: size),
        InkWell(
          splashColor: MyColors.primaryColor,
          onTap: () {},
          child: SizedBox(
              height: 35,
              width: size.width/2,
              child: Center(child: Text(MyStrings.exitMyAccount, style: textTheme.bodyLarge))),
        ),
        SizedBox(height: size.height/7,)
      ],
    );
  }
}
