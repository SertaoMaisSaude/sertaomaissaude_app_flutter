// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$homeStatusAtom = Atom(name: '_HomeControllerBase.homeStatus');

  @override
  HomeStatus get homeStatus {
    _$homeStatusAtom.context.enforceReadPolicy(_$homeStatusAtom);
    _$homeStatusAtom.reportObserved();
    return super.homeStatus;
  }

  @override
  set homeStatus(HomeStatus value) {
    _$homeStatusAtom.context.conditionallyRunInAction(() {
      super.homeStatus = value;
      _$homeStatusAtom.reportChanged();
    }, _$homeStatusAtom, name: '${_$homeStatusAtom.name}_set');
  }

  final _$postsAtom = Atom(name: '_HomeControllerBase.posts');

  @override
  List<BlogPostModel> get posts {
    _$postsAtom.context.enforceReadPolicy(_$postsAtom);
    _$postsAtom.reportObserved();
    return super.posts;
  }

  @override
  set posts(List<BlogPostModel> value) {
    _$postsAtom.context.conditionallyRunInAction(() {
      super.posts = value;
      _$postsAtom.reportChanged();
    }, _$postsAtom, name: '${_$postsAtom.name}_set');
  }

  final _$dailyNewsAtom = Atom(name: '_HomeControllerBase.dailyNews');

  @override
  List<DailyNewsModel> get dailyNews {
    _$dailyNewsAtom.context.enforceReadPolicy(_$dailyNewsAtom);
    _$dailyNewsAtom.reportObserved();
    return super.dailyNews;
  }

  @override
  set dailyNews(List<DailyNewsModel> value) {
    _$dailyNewsAtom.context.conditionallyRunInAction(() {
      super.dailyNews = value;
      _$dailyNewsAtom.reportChanged();
    }, _$dailyNewsAtom, name: '${_$dailyNewsAtom.name}_set');
  }

  final _$indexAtom = Atom(name: '_HomeControllerBase.index');

  @override
  int get index {
    _$indexAtom.context.enforceReadPolicy(_$indexAtom);
    _$indexAtom.reportObserved();
    return super.index;
  }

  @override
  set index(int value) {
    _$indexAtom.context.conditionallyRunInAction(() {
      super.index = value;
      _$indexAtom.reportChanged();
    }, _$indexAtom, name: '${_$indexAtom.name}_set');
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  void changeIndex(int value) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction();
    try {
      return super.changeIndex(value);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'homeStatus: ${homeStatus.toString()},posts: ${posts.toString()},dailyNews: ${dailyNews.toString()},index: ${index.toString()}';
    return '{$string}';
  }
}
