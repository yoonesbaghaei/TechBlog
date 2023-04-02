import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Strings.dart';
import '../colors.dart';
import '../gen/assets.gen.dart';
import '../models/fake_data.dart';

class homeScreen extends StatelessWidget {
  const homeScreen({
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
          homePagePoster(size: size, textTheme: textTheme),
          const SizedBox(height: 32),
          homePageTagList(bodyMargin: bodyMargin, textTheme: textTheme),
          seeMoreBlog(size: size, bodyMargin: bodyMargin, textTheme: textTheme),
          homePageBlogList(
              size: size, bodyMargin: bodyMargin, textTheme: textTheme),
          seeMorePodcast(
              size: size, bodyMargin: bodyMargin, textTheme: textTheme),
          homePagePodcastList(
              size: size, bodyMargin: bodyMargin, textTheme: textTheme),
        ]),
      ),
    );
  }
}

class homePagePoster extends StatelessWidget {
  const homePagePoster({
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

class homePageTagList extends StatelessWidget {
  const homePageTagList({
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
            child: Container(
                height: 60,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    gradient: LinearGradient(
                        colors: GradientColors.tags,
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft)),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                  child: Row(
                    children: [
                      ImageIcon(
                        Assets.icons.hashTag.provider(),
                        color: Colors.white,
                        size: 16,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        tagList[index].title,
                        style: textTheme.displayMedium,
                      )
                    ],
                  ),
                )),
          );
        },
      ),
    );
  }
}

class seeMoreBlog extends StatelessWidget {
  const seeMoreBlog({
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
      padding: EdgeInsets.fromLTRB(0, size.height / 20, bodyMargin, 0),
      child: Row(
        children: [
          ImageIcon(
            Assets.icons.pen.provider(),
            color: myColors.colorHotList,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(Strings.viewHotBlog, style: textTheme.displaySmall)
        ],
      ),
    );
  }
}

class homePageBlogList extends StatelessWidget {
  const homePageBlogList({
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
                    padding: const EdgeInsets.fromLTRB(15, 25, 0, 8),
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

class seeMorePodcast extends StatelessWidget {
  const seeMorePodcast({
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
      padding: EdgeInsets.fromLTRB(0, size.height / 20, bodyMargin, 0),
      child: Row(
        children: [
          ImageIcon(
            Assets.icons.record.provider(),
            color: myColors.colorHotList,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(Strings.viewHotPodcast, style: textTheme.displaySmall)
        ],
      ),
    );
  }
}

class homePagePodcastList extends StatelessWidget {
  const homePagePodcastList({
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
                    padding: const EdgeInsets.fromLTRB(15, 25, 0, 8),
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
