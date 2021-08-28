import 'package:covid19app/app/modules/home/pages/health_tips/health_tips_repository.dart';
import 'package:covid19app/app/shared/models/health_tips_model.dart';
import 'package:mobx/mobx.dart';

part 'health_tips_controller.g.dart';

class HealthTipsController = _HealthTipsControllerBase
    with _$HealthTipsController;

abstract class _HealthTipsControllerBase with Store {
  final HealthTipsRepository _repository;

  _HealthTipsControllerBase(this._repository) {
    fetchPosts();
  }

  @observable
  TipsStatus status = TipsStatus.none;

  List<HealthTipsModel> tips = [];

  @action
  Future<void> fetchPosts() async {
    status = TipsStatus.loading;
    try {
      final response = await _repository.fetchPost();
      tips
        ..clear()
        ..addAll(response);
      status = TipsStatus.done;
    } catch (e) {
      status = TipsStatus.error;
    }
  }
}

enum TipsStatus { none, loading, done, error }
