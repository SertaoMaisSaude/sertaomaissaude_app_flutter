import 'package:mobx/mobx.dart';

part 'comorbidities_controller.g.dart';

class ComorbiditiesController = _ComorbiditiesControllerBase
    with _$ComorbiditiesController;

abstract class _ComorbiditiesControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
