// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AppController on _AppControllerBase, Store {
  final _$cityAtom = Atom(name: '_AppControllerBase.city');

  @override
  String get city {
    _$cityAtom.context.enforceReadPolicy(_$cityAtom);
    _$cityAtom.reportObserved();
    return super.city;
  }

  @override
  set city(String value) {
    _$cityAtom.context.conditionallyRunInAction(() {
      super.city = value;
      _$cityAtom.reportChanged();
    }, _$cityAtom, name: '${_$cityAtom.name}_set');
  }

  final _$postsAtom = Atom(name: '_AppControllerBase.posts');

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

  final _$dailyNewsAtom = Atom(name: '_AppControllerBase.dailyNews');

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

  final _$healthCentersAtom = Atom(name: '_AppControllerBase.healthCenters');

  @override
  List<HealthCenterModel> get healthCenters {
    _$healthCentersAtom.context.enforceReadPolicy(_$healthCentersAtom);
    _$healthCentersAtom.reportObserved();
    return super.healthCenters;
  }

  @override
  set healthCenters(List<HealthCenterModel> value) {
    _$healthCentersAtom.context.conditionallyRunInAction(() {
      super.healthCenters = value;
      _$healthCentersAtom.reportChanged();
    }, _$healthCentersAtom, name: '${_$healthCentersAtom.name}_set');
  }

  final _$citiesAtom = Atom(name: '_AppControllerBase.cities');

  @override
  List<CityModel> get cities {
    _$citiesAtom.context.enforceReadPolicy(_$citiesAtom);
    _$citiesAtom.reportObserved();
    return super.cities;
  }

  @override
  set cities(List<CityModel> value) {
    _$citiesAtom.context.conditionallyRunInAction(() {
      super.cities = value;
      _$citiesAtom.reportChanged();
    }, _$citiesAtom, name: '${_$citiesAtom.name}_set');
  }

  @override
  String toString() {
    final string =
        'city: ${city.toString()},posts: ${posts.toString()},dailyNews: ${dailyNews.toString()},healthCenters: ${healthCenters.toString()},cities: ${cities.toString()}';
    return '{$string}';
  }
}
