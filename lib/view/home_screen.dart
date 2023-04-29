import 'package:flutter/material.dart';
import 'package:tech_blog/my_component.dart';

import '../strings.dart';
import '../colors.dart';
import '../gen/assets.gen.dart';
import '../models/fake_data.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
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
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
        child: Column(children: [
          HomePagePoster(size: size, textTheme: textTheme),
          const SizedBox(height: 32),
          HomePageTagList(bodyMargin: bodyMargin, textTheme: textTheme),
          SeeMoreBlog(size: size, bodyMargin: bodyMargin, textTheme: textTheme),
          HomePageBlogList(
              size: size, bodyMargin: bodyMargin, textTheme: textTheme),
          SeeMorePodcast(
              size: size, bodyMargin: bodyMargin, textTheme: textTheme),
          HomePagePodcastList(
              size: size, bodyMargin: bodyMargin, textTheme: textTheme),
        ]),
      ),
    );
  }
}

class HomePagePoster extends StatelessWidget {
  const HomePagePoster({
    super.key,
    required this.size,
    required this.textTheme,
  });

  final Size size;

  // final var homePagePosterMap;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        width: size.width / 1.2,
        height: size.height / 4.2,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(homePagePosterMap["imageAsset"])),
            borderRadius: const BorderRadius.all(Radius.circular(16))),
        // width: size.width / 1.209,
        // height: size.height / 4.2,
        foregroundDecoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: GradientColors.homePosterCoverGradient)),
      ),
      Positioned(
        bottom: 8,
        right: 0,
        left: 0,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  homePagePosterMap["writer"] +
                      " - " +
                      homePagePosterMap["date"],
                  style: textTheme.titleMedium,
                ),
                Row(
                  children: [
                    Text(
                      homePagePosterMap["view"],
                      style: textTheme.titleMedium,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const Icon(
                      Icons.remove_red_eye,
                      color: Colors.white,
                      size: 20,
                    )
                  ],
                )
              ],
            ),
            Text(
              homePagePosterMap["title"],
              style: textTheme.displayLarge,
            )
          ],
        ),
      )
    ]);
  }
}

class HomePageTagList extends StatelessWidget {
  const HomePageTagList({
    super.key,
    required this.bodyMargin,
    required this.textTheme,
  });

  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: tagList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding:
                EdgeInsets.fromLTRB(5, 12, index == 0 ? bodyMargin : 12, 12),
            child: MainTags(textTheme: textTheme, index: index,),
          );
        },
      ),
    );
  }
}


class SeeMoreBlog extends StatelessWidget {
  const SeeMoreBlog({
    super.key,
    required this.size,
    required this.bodyMargin,
    required this.textTheme,
  });

  final Size size;
  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, size.height / 40, bodyMargin, 0),
      child: Row(
        children: [
          ImageIcon(
            Assets.icons.bluePen.provider(),
            color: MyColors.colorHotList,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(MyStrings.viewHotBlog, style: textTheme.displaySmall)
        ],
      ),
    );
  }
}

class HomePageBlogList extends StatelessWidget {
  const HomePageBlogList({
    super.key,
    required this.size,
    required this.bodyMargin,
    required this.textTheme,
  });

  final Size size;
  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height / 3,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: blogList.getRange(0, 5).length,
          scrollDirection: Axis.horizontal,
          itemBuilder: ((context, index) {
            //blog Item
            return Padding(
              padding: EdgeInsets.only(right: index == 0 ? bodyMargin : 10),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 15, 0, 8),
                    child: SizedBox(
                      height: size.height / 4.5,
                      width: size.width / 2.2,
                      child: Stack(children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(16)),
                            image: DecorationImage(
                                image: NetworkImage(blogList[index].imageUrl),
                                fit: BoxFit.cover),
                          ),
                          foregroundDecoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)),
                              gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: GradientColors.blogPost)),
                        ),
                        Positioned(
                          bottom: 8,
                          right: 0,
                          left: 0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                blogList[index].writer,
                                style: textTheme.titleMedium,
                              ),
                              Row(
                                children: [
                                  Text(
                                    blogList[index].views,
                                    style: textTheme.titleMedium,
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    "like",
                                    style: textTheme.titleMedium,
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ]),
                    ),
                  ),
                  SizedBox(
                      width: size.width / 2.2,
                      child: Text(
                        blogList[index].title,
                        style: textTheme.bodyLarge,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ))
                ],
              ),
            );
          })),
    );
  }
}

class SeeMorePodcast extends StatelessWidget {
  const SeeMorePodcast({
    super.key,
    required this.size,
    required this.bodyMargin,
    required this.textTheme,
  });

  final Size size;
  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, size.height / 40, bodyMargin, 0),
      child: Row(
        children: [
          ImageIcon(
            Assets.icons.record.provider(),
            color: MyColors.colorHotList,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(MyStrings.viewHotPodcast, style: textTheme.displaySmall)
        ],
      ),
    );
  }
}

class HomePagePodcastList extends StatelessWidget {
  const HomePagePodcastList({
    super.key,
    required this.size,
    required this.bodyMargin,
    required this.textTheme,
  });

  final Size size;
  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height / 2.4,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: podcastModel.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: ((context, index) {
            //blog Item
            return Padding(
              padding: EdgeInsets.only(right: index == 0 ? bodyMargin : 10),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 15, 0, 8),
                    child: SizedBox(
                      height: size.height / 4.5,
                      width: size.width / 2.2,
                      child: Stack(children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(16)),
                            image: DecorationImage(
                                image:
                                    NetworkImage(podcastModel[index].imageUrl),
                                fit: BoxFit.cover),
                          ),
                        ),
                      ]),
                    ),
                  ),
                  SizedBox(
                      // width: size.width / 2.2,
                      child: Text(
                    podcastModel[index].title,
                    style: textTheme.bodyLarge,
                  ))
                ],
              ),
            );
          })),
    );
  }
}
