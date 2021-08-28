import 'package:mobx/mobx.dart';

part 'dashboard_controller.g.dart';

class DashboardController = _DashboardControllerBase with _$DashboardController;

abstract class _DashboardControllerBase with Store {
  @observable
  int position = 1;

  @action
  loaded(String A) {
    position = 0;
  }

  @action
  loading(String A) {
    position = 1;
  }
}
