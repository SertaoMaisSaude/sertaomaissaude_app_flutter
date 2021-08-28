import 'package:covid19app/app/app_controller.dart';
import 'package:covid19app/app/app_module.dart';
import 'package:covid19app/app/modules/home/pages/feed/components/blog_post_tile.dart';
import 'package:covid19app/app/modules/home/pages/feed/components/feed_card_hints_anlisy.dart';
import 'package:covid19app/app/modules/home/pages/feed/components/feed_sliver_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class FeedPage extends StatefulWidget {
  final String title;

  const FeedPage({Key key, this.title = "Feed"}) : super(key: key);

  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  //use 'controller' variable to access controller
  // final _homeController = HomeModule.to.get<HomeController>();
  final _appController = AppModule.to.get<AppController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          physics: BouncingScrollPhysics(),
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          slivers: <Widget>[
            SliverPersistentHeader(
              delegate: FeedSliverAppBar(expandedHeight: 200),
              pinned: true,
            ),
            SliverToBoxAdapter(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(
                  top: 16,
                  right: 18,
                  bottom: 16,
                ),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SizedBox(
                          width: 18,
                        ),
                        FeedCardHintsAnalisy(
                          title: 'Sente-se bem ?',
                          icon: 'assets/images/analys.png',
                          router: 'analise',
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        FeedCardHintsAnalisy(
                          title: 'Dicas',
                          icon: 'assets/images/covid.png',
                          router: 'dicas',
                        ),
                      ],
                    ),
                    SizedBox(height: 24)
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: Text(
                  'Notícias',
                  textAlign: TextAlign.start,
                  style: TextStyle(color: Color(0xFF05A8F3), fontSize: 24),
                ),
              ),
            ),
            Observer(
              builder: (_) {
                return (_appController.posts != null &&
                        _appController.posts.length > 0)
                    ? SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (_, int index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child:
                                  BlogTileWidget(_appController.posts[index]),
                            );
                          },
                          childCount: _appController.posts.length,
                        ),
                      )
                    : SliverToBoxAdapter(
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 50,
                            ),
                            Text('Nenhuma nova notícia'),
                          ],
                        ),
                      );
              },
            )
          ],
        ),
        //bottomNavigationBar: BottomBarWidget(),
      ),
    );
  }
}
