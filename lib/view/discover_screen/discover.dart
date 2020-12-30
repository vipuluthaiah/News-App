import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inshort_clone/aplication_localization.dart';
import 'package:inshort_clone/bloc/feed/news_feed_bloc.dart';
import 'package:inshort_clone/bloc/feed/news_feed_event.dart';
import 'package:inshort_clone/controller/feed_controller.dart';
import 'package:inshort_clone/controller/provider.dart';
import 'package:inshort_clone/view/discover_screen/widgets/category_card.dart';
import 'package:inshort_clone/view/discover_screen/widgets/headline.dart';
import 'package:inshort_clone/view/discover_screen/widgets/topics_card.dart';
import 'package:provider/provider.dart';
import 'widgets/app_bar.dart';

class DiscoverScreen extends StatefulWidget {
  @override
  _DiscoverScreenState createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  var bloc;

  @override
  void initState() {
    bloc = BlocProvider.of<NewsFeedBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FeedProvider>(context, listen: false);
    provider.setAppBarVisible(true);

    return Scaffold(
      appBar: appSearchBar(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 16,
            ),
            headLine(AppLocalizations.of(context).translate("categories")),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Consumer<FeedProvider>(
                  builder: (context, value, child) => Row(
                    children: <Widget>[
                      CategoryCard(
                        title:
                            AppLocalizations.of(context).translate("my_feed"),
                        icon: "https://assets1.lottiefiles.com/packages/lf20_VyblYx.json",
                        active: provider.getActiveCategory == 1,
                        onTap: () {
                          provider.setActiveCategory(1);
                          provider.setAppBarTitle(AppLocalizations.of(context)
                              .translate("my_feed"));

                          bloc.add(
                            FetchNewsByCategoryEvent(category: "general"),
                          );
                        },
                      ),
                      CategoryCard(
                        title:
                            AppLocalizations.of(context).translate("trending"),
                        icon: "https://assets10.lottiefiles.com/datafiles/KB7F0ArTJgo6IeN/data.json",
                        active: provider.getActiveCategory == 2,
                        onTap: () {
                          provider.setActiveCategory(2);
                          provider.setAppBarTitle(AppLocalizations.of(context)
                              .translate("trending"));

                          bloc.add(
                            FetchNewsByTopicEvent(topic: "trending"),
                          );
                        },
                      ),
                      CategoryCard(
                        title:
                            AppLocalizations.of(context).translate("bookmark"),
                        icon: "https://assets4.lottiefiles.com/datafiles/SkdS7QDyJTKTdwA/data.json",
                        active: provider.getActiveCategory == 3,
                        onTap: () {
                          provider.setActiveCategory(3);
                          provider.setAppBarTitle(AppLocalizations.of(context)
                              .translate("bookmark"));

                          bloc.add(
                            FetchNewsFromLocalStorageEvent(box: 'bookmarks'),
                          );
                        },
                      ),
                      CategoryCard(
                        title:
                            AppLocalizations.of(context).translate("unreads"),
                        icon: "https://assets9.lottiefiles.com/temp/lf20_ZGnXlB.json",
                        active: provider.getActiveCategory == 4,
                        onTap: () {
                          provider.setActiveCategory(4);
                          provider.setAppBarTitle(AppLocalizations.of(context)
                              .translate("unreads"));

                          bloc.add(
                            FetchNewsFromLocalStorageEvent(box: 'unreads'),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            headLine(AppLocalizations.of(context).translate("sugested_topics")),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: GridView.count(
                shrinkWrap: true,
                childAspectRatio: (1 / 1.4),
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 3,
                children: <Widget>[
                  TopicCard(
                    title:
                        AppLocalizations.of(context).translate("coronavirus"),
                    // icon: "coronavirus",
                    icon:  "https://assets8.lottiefiles.com/packages/lf20_wv4mTG.json",
                    onTap: () {
                      provider.setAppBarTitle(AppLocalizations.of(context)
                          .translate("coronavirus"));
                      FeedController.addCurrentPage(1);
                      bloc.add(
                        FetchNewsByTopicEvent(topic: "coronavirus"),
                      );
                    },
                  ),
                  TopicCard(
                    title: AppLocalizations.of(context).translate("india"),
                    icon: "https://assets10.lottiefiles.com/datafiles/5FGDT1tGd6PRFWjrlnK36tsX4dv7kt1ihUMebNma/india.json",
                    onTap: () {
                      provider.setAppBarTitle(
                          AppLocalizations.of(context).translate("india"));
                      FeedController.addCurrentPage(1);
                      bloc.add(
                        FetchNewsByTopicEvent(topic: "india"),
                      );
                    },
                  ),
                  TopicCard(
                    title: AppLocalizations.of(context).translate("business"),
                    icon: "https://assets8.lottiefiles.com/packages/lf20_BzsCRH.json",
                    onTap: () {
                      provider.setAppBarTitle(
                          AppLocalizations.of(context).translate("business"));
                      FeedController.addCurrentPage(1);
                      bloc.add(
                        FetchNewsByCategoryEvent(category: "business"),
                      );
                    },
                  ),
                  TopicCard(
                    title: AppLocalizations.of(context).translate("politics"),
                    icon: "https://assets6.lottiefiles.com/packages/lf20_gSemY3.json",
                    onTap: () {
                      provider.setAppBarTitle(
                          AppLocalizations.of(context).translate("politics"));
                      FeedController.addCurrentPage(1);
                      bloc.add(
                        FetchNewsByTopicEvent(topic: "politics"),
                      );
                    },
                  ),
                  TopicCard(
                    title: AppLocalizations.of(context).translate("sports"),
                    icon: "https://assets3.lottiefiles.com/datafiles/ogIQ10UnwnKiBZS/data.json",
                    onTap: () {
                      provider.setAppBarTitle(
                          AppLocalizations.of(context).translate("sports"));
                      FeedController.addCurrentPage(1);
                      bloc.add(
                        FetchNewsByCategoryEvent(category: "sports"),
                      );
                    },
                  ),
                  TopicCard(
                    title: AppLocalizations.of(context).translate("technology"),
                    icon: "https://assets4.lottiefiles.com/packages/lf20_Ns4TLz.json",
                    onTap: () {
                      provider.setAppBarTitle(
                          AppLocalizations.of(context).translate("technology"));
                      FeedController.addCurrentPage(1);
                      bloc.add(
                        FetchNewsByCategoryEvent(category: "technology"),
                      );
                    },
                  ),
                  TopicCard(
                    title: AppLocalizations.of(context).translate("startups"),
                    icon: "https://assets10.lottiefiles.com/packages/lf20_5adtCi.json",
                    onTap: () {
                      provider.setAppBarTitle(
                          AppLocalizations.of(context).translate("startups"));
                      FeedController.addCurrentPage(1);
                      bloc.add(
                        FetchNewsByTopicEvent(topic: "startups"),
                      );
                    },
                  ),
                  TopicCard(
                    title:
                        AppLocalizations.of(context).translate("entertainment"),
                    icon: "https://assets5.lottiefiles.com/datafiles/vpWoQBht24jz6iW/data.json",
                    onTap: () {
                      provider.setAppBarTitle(AppLocalizations.of(context)
                          .translate("entertainment"));
                      FeedController.addCurrentPage(1);
                      bloc.add(
                        FetchNewsByCategoryEvent(category: "entertainment"),
                      );
                    },
                  ),
                  TopicCard(
                    title: AppLocalizations.of(context).translate("education"),
                    icon: "https://assets4.lottiefiles.com/packages/lf20_K7aZUG.json",
                    onTap: () {
                      provider.setAppBarTitle(
                          AppLocalizations.of(context).translate("education"));
                      FeedController.addCurrentPage(1);
                      bloc.add(
                        FetchNewsByTopicEvent(topic: "education"),
                      );
                    },
                  ),
                  TopicCard(
                    title: AppLocalizations.of(context).translate("automobile"),
                    icon: "https://assets9.lottiefiles.com/datafiles/HN7OcWNnoqje6iXIiZdWzKxvLIbfeCGTmvXmEm1h/data.json",
                    onTap: () {
                      provider.setAppBarTitle(
                          AppLocalizations.of(context).translate("automobile"));
                      FeedController.addCurrentPage(1);
                      bloc.add(
                        FetchNewsByTopicEvent(topic: "automobile"),
                      );
                    },
                  ),
                  TopicCard(
                    title: AppLocalizations.of(context).translate("science"),
                    icon: "https://assets7.lottiefiles.com/packages/lf20_zeocn70d.json",
                    onTap: () {
                      provider.setAppBarTitle(
                          AppLocalizations.of(context).translate("science"));
                      FeedController.addCurrentPage(1);
                      bloc.add(
                        FetchNewsByCategoryEvent(category: "science"),
                      );
                    },
                  ),
                  TopicCard(
                    title: AppLocalizations.of(context).translate("travel"),
                    icon: "https://assets10.lottiefiles.com/datafiles/muoQLO89h8Wo5xg/data.json",
                    onTap: () {
                      provider.setAppBarTitle(
                          AppLocalizations.of(context).translate("travel"));
                      FeedController.addCurrentPage(1);
                      bloc.add(
                        FetchNewsByTopicEvent(topic: "travel"),
                      );
                    },
                  ),
                  TopicCard(
                    title: AppLocalizations.of(context).translate("fashion"),
                    icon: "https://assets2.lottiefiles.com/packages/lf20_zwijnhaz.json",
                    onTap: () {
                      provider.setAppBarTitle(
                          AppLocalizations.of(context).translate("fashion"));
                      FeedController.addCurrentPage(1);
                      bloc.add(
                        FetchNewsByTopicEvent(topic: "fashion"),
                      );
                    },
                  ),
                    SizedBox(
              height: 16,
            ),

                ],
              ),
            ),
            headLine(AppLocalizations.of(context).translate("others_market")),
   Padding(
              padding: const EdgeInsets.all(4.0),
              child: GridView.count(
                shrinkWrap: true,
                childAspectRatio: (1 / 1.4),
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 3,
                children: <Widget>[
                  TopicCard(
                    title:
                        AppLocalizations.of(context).translate("deaths"),
                    // icon: "coronavirus",
                    icon:  "https://assets5.lottiefiles.com/packages/lf20_0iB3jy.json",
                    onTap: () {
                      provider.setAppBarTitle(AppLocalizations.of(context)
                          .translate("coronavirus"));
                      FeedController.addCurrentPage(1);
                      bloc.add(
                        FetchNewsByTopicEvent(topic: "coronavirus"),
                      );
                    },
                  ),
                  TopicCard(
                    title: AppLocalizations.of(context).translate("shopping"),
                    icon: "https://assets4.lottiefiles.com/packages/lf20_hl349l.json",
                    onTap: () {
                      provider.setAppBarTitle(
                          AppLocalizations.of(context).translate("india"));
                      FeedController.addCurrentPage(1);
                      bloc.add(
                        FetchNewsByTopicEvent(topic: "india"),
                      );
                    },
                  ),
                  TopicCard(
                    title: AppLocalizations.of(context).translate("price"),
                    icon: "https://assets2.lottiefiles.com/packages/lf20_hocmonst.json",
                    onTap: () {
                      provider.setAppBarTitle(
                          AppLocalizations.of(context).translate("business"));
                      FeedController.addCurrentPage(1);
                      bloc.add(
                        FetchNewsByCategoryEvent(category: "business"),
                      );
                    },
                  ),
                  TopicCard(
                    title: AppLocalizations.of(context).translate("cars_bikes"),
                    icon: "https://assets9.lottiefiles.com/datafiles/HN7OcWNnoqje6iXIiZdWzKxvLIbfeCGTmvXmEm1h/data.json",
                    onTap: () {
                      provider.setAppBarTitle(
                          AppLocalizations.of(context).translate("politics"));
                      FeedController.addCurrentPage(1);
                      bloc.add(
                        FetchNewsByTopicEvent(topic: "politics"),
                      );
                    },
                  ),
                  TopicCard(
                    title: AppLocalizations.of(context).translate("resorts_hotel"),
                    icon: "https://assets1.lottiefiles.com/packages/lf20_5ohCYt.json",
                    onTap: () {
                      provider.setAppBarTitle(
                          AppLocalizations.of(context).translate("sports"));
                      FeedController.addCurrentPage(1);
                      bloc.add(
                        FetchNewsByCategoryEvent(category: "sports"),
                      );
                    },
                  ),
                      TopicCard(
                    title: AppLocalizations.of(context).translate("husbandry"),
                    icon: "https://assets2.lottiefiles.com/temp/lf20_tsdGdl.json",
                    onTap: () {
                      provider.setAppBarTitle(
                          AppLocalizations.of(context).translate("sports"));
                      FeedController.addCurrentPage(1);
                      bloc.add(
                        FetchNewsByCategoryEvent(category: "sports"),
                      );
                    },
                  ),
                   TopicCard(
                    title: AppLocalizations.of(context).translate("weather"),
                    icon: "https://assets10.lottiefiles.com/temp/lf20_XkF78Y.json",
                    onTap: () {
                      provider.setAppBarTitle(
                          AppLocalizations.of(context).translate("sports"));
                      FeedController.addCurrentPage(1);
                      bloc.add(
                        FetchNewsByCategoryEvent(category: "sports"),
                      );
                    },
                  ),
                      TopicCard(
                    title: AppLocalizations.of(context).translate("hockey"),
                    icon: "https://assets3.lottiefiles.com/packages/lf20_GWWy4D.json",
                    onTap: () {
                      provider.setAppBarTitle(
                          AppLocalizations.of(context).translate("sports"));
                      FeedController.addCurrentPage(1);
                      bloc.add(
                        FetchNewsByCategoryEvent(category: "sports"),
                      );
                    },
                  ),
                 
                
                 
               
                 
               
           

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
