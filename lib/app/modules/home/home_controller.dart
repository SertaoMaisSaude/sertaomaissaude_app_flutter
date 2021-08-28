import 'package:covid19app/app/shared/models/blog_post_model.dart';
import 'package:covid19app/app/shared/models/daily_news_model.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  PageController pageController;

  @observable
  HomeStatus homeStatus = HomeStatus.loading;

  @observable
  List<BlogPostModel> posts;
  @observable
  List<DailyNewsModel> dailyNews;

  @observable
  int index = 1;

  @action
  void changeIndex(int value) => index = value;
}

enum HomeStatus { loading, sucess, error }
