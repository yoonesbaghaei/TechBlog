import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:tech_blog/component/colors.dart';
import 'package:tech_blog/component/strings.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/models/fake_data.dart';
import 'package:url_launcher/url_launcher.dart';


class ThecDivider extends StatelessWidget {
  const ThecDivider({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: MyColors.dividerColor,
      indent: size.width/5,
      endIndent: size.width/5,
      thickness: 0.8,
    );
  }
}


class MainTags extends StatelessWidget {
  MainTags({
    Key? key,
    required this.textTheme,
    required this.index,
  }): super (key : key);

  final TextTheme textTheme;
  var index;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 70,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(24)),
            gradient: LinearGradient(
                colors: GradientColors.tags,
                begin: Alignment.centerRight,
                end: Alignment.centerLeft)),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(5, 5, 5 ,5),
          child: Row(
            children: [
              ImageIcon(
                Assets.icons.hashTag.provider(),
                color: Colors.white,
                size: 14,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                tagList[index].title,
                style: textTheme.titleSmall,
              )
            ],
          ),
        ));
  }
}


myLaunchUrl(String url)async{
var _uri = Uri.parse(url);
  if(!await canLaunchUrl(_uri)){
  await launchUrl(_uri);
  }else{
    log("could not launch ${_uri.toString()} ");
  }
}

