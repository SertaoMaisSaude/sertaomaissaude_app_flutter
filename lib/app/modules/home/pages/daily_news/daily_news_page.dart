import 'package:covid19app/app/modules/home/home_module.dart';
import 'package:covid19app/app/modules/home/pages/daily_news/components/DailyNewsLineChart.dart';
import 'package:covid19app/app/modules/home/pages/daily_news/components/boletim_list_item.dart';
import 'package:covid19app/app/modules/home/pages/daily_news/daily_news_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class DailyNewsPage extends StatefulWidget {
  final String title;
  const DailyNewsPage({Key key, this.title = "DailyNews"}) : super(key: key);

  @override
  _DailyNewsPageState createState() => _DailyNewsPageState();
}

class _DailyNewsPageState extends State<DailyNewsPage> {
  final _controller = HomeModule.to.get<DailyNewsController>();
//  final _homeRepository = HomeModule.to.get<HomeRepository>();
//  Snapshot<List<DailyNewsModel>> subscribNews;

  @override
  void initState() {
//    subscribNews = _homeRepository.subscribNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Observer(
            builder: (context) {
              if (_controller.boletimSelected == null) {
                return Container();
              } else {
                return AnimatedContainer(
                  height: MediaQuery.of(context).size.height * 0.4,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        _controller.boletimSelected.color,
                        Colors.white,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  duration: Duration(milliseconds: 500),
                );
              }
            },
          ),
          Container(
            child: Observer(
              builder: (_) {
                if (_controller.boletins == null) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return CustomScrollView(
                    slivers: [
                      SliverAppBar(
                        centerTitle: true,
                        elevation: 0,
                        pinned: false,
                        backgroundColor: Colors.transparent,
                        title: RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: 'Sertão ',
                                style: TextStyle(fontSize: 22)),
                            TextSpan(
                                text: 'Saúde',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ))
                          ]),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${_controller.boletimSelected.spots.last.y.toInt()}",
                                  style: TextStyle(
                                    fontSize: 44,
                                    fontWeight: FontWeight.bold,
                                    color: _controller.boletimSelected.color,
                                  ),
                                ),
                                Text(
                                  '${_controller.boletimSelected.title}',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: Container(
                            height: 65,
                            child: ListView(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              physics: BouncingScrollPhysics(),
                              children: [
                                BoletimListItem(
                                  boletimLineModel: _controller.confirmed,
                                ),
                                BoletimListItem(
                                  boletimLineModel: _controller.discarded,
                                ),
                                BoletimListItem(
                                  boletimLineModel: _controller.recovered,
                                ),
                                BoletimListItem(
                                  boletimLineModel: _controller.waitingExam,
                                ),
                                BoletimListItem(
                                  boletimLineModel: _controller.deaths,
                                ),
                                BoletimListItem(
                                  boletimLineModel: _controller.homeIsolation,
                                ),
                                BoletimListItem(
                                  boletimLineModel: _controller.hospitalStay,
                                ),
                                BoletimListItem(
                                  boletimLineModel: _controller.testsCounty,
                                ),
                                BoletimListItem(
                                  boletimLineModel: _controller.testsLacen,
                                ),
                                BoletimListItem(
                                  boletimLineModel: _controller.testsPrivate,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(child: DailyNewsLineChart())
                    ],
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
