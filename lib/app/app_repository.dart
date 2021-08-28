import 'package:covid19app/app/shared/models/health_center_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'shared/custom_dio/custom_dio.dart';
import 'shared/models/blog_post_model.dart';
import 'shared/models/city_model.dart';
import 'shared/models/daily_news_model.dart';

class AppRepository extends Disposable {
  final CustomDio _dio;

  AppRepository(this._dio);

  Future<List<BlogPostModel>> fetchPosts({bool refresh = true}) async {
    final response = await _dio.client.get(
      "blog-post/list/",
      options: Options(
        extra: {"refresh": refresh},
      ),
    );
    return BlogPostModel.fromJsonList(response.data);
  }

  Future<List<DailyNewsModel>> fetchDailyNews({bool refresh = true}) async {
    final response = await _dio.client.get(
      "daily-news-letter/list/",
      options: Options(
        extra: {"refresh": refresh},
      ),
    );
    final dailyNewsModel = DailyNewsModel.fromJsonList(response.data);
    dailyNewsModel.sort((a, b) => a.date.compareTo(b.datePublication));
    return dailyNewsModel;
  }

  Future<List<CityModel>> fetchCities({bool refresh = true}) async {
    final response = await _dio.client.get(
      "city/list/",
      options: Options(
        extra: {"refresh": refresh},
      ),
    );
    return CityModel.fromJsonList(response.data);
  }

  Future<List<HealthCenterModel>> fetchHealthCenterByNeighborhood() async {
    final response = await _dio.client.get('health-center/list/');
    return HealthCenterModel.fromJsonList(response.data);
  }

  @override
  void dispose() {}
}
