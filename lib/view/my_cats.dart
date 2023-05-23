import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/models/fake_data.dart';
import 'package:tech_blog/component/strings.dart';
import 'package:tech_blog/view/main_screen.dart';
import '../component/my_component.dart';

class MyCats extends StatefulWidget {
  const MyCats({Key? key}) : super(key: key);

  @override
  State<MyCats> createState() => _MyCatsState();
}

class _MyCatsState extends State<MyCats> {
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    double bodyMargine = size.width / 7;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.only(left: bodyMargine, right: bodyMargine),
            child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    SvgPicture.asset(
                      Assets.images.tcbot.path,
                      height: 100,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30, top: 30),
                      child: Text(
                        MyStrings.successFullRegistration,
                        style: textTheme.labelMedium,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                          hintText: "نام و نام خانوادگی",
                          alignLabelWithHint: true,
                          hintStyle: textTheme.labelSmall),
                      textAlign: TextAlign.center,
                      style: textTheme.bodyLarge,
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Text(
                      MyStrings.chooseCats,
                      style: textTheme.labelMedium,
                      textAlign: TextAlign.center,
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 32),
                      child: SizedBox(
                        // width: double.infinity,
                        height: 82,
                        child: GridView.builder(
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: tagList.length,
                            scrollDirection: Axis.horizontal,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisSpacing: 5,
                                    mainAxisSpacing: 5,
                                    crossAxisCount: 2,
                                    childAspectRatio: 0.3),
                            itemBuilder: ((context, index) {
                              return InkWell(
                                onTap: (() {
                                  setState(() {
                                    if (!selectedTags
                                        .contains(tagList[index])) {
                                      selectedTags.add(tagList[index]);
                                    }
                                  });
                                }),
                                child: MainTags(
                                    textTheme: textTheme, index: index),
                              );
                            })),
                      ),
                    ),
                    //FleshIcon
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 20,
                      ),
                      child: Image.asset(
                        Assets.icons.flash.path,
                        scale: 2.5,
                      ),
                    ),
                    //selected Tags
                    Padding(
                      padding: const EdgeInsets.only(top: 32),
                      child: SizedBox(
                        // width: double.infinity,
                        height: 82,
                        child: GridView.builder(
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: selectedTags.length,
                            scrollDirection: Axis.horizontal,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisSpacing: 5,
                                    mainAxisSpacing: 5,
                                    crossAxisCount: 2,
                                    childAspectRatio: 0.3),
                            itemBuilder: ((context, index) {
                              return Container(
                                  height: 70,
                                  decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(24)),
                                      color:
                                          Color.fromARGB(255, 242, 242, 242)),
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        Text(
                                          selectedTags[index].title,
                                          style: textTheme.bodyLarge,
                                        ),
                                        InkWell(
                                          onTap: (() {
                                            return setState(() {
                                              selectedTags.removeAt(index);
                                            });
                                          }),
                                          child: const Icon(
                                            CupertinoIcons.delete,
                                            color: Colors.grey,
                                            size: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ));
                            })),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(top: size.height/20),
                      child: ElevatedButton(
                        onPressed: (() {
                          Get.to(MainScreen());
                        }),
                        child: const Text(
                          "تایید",
                        ),
                      ),
                    )
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
