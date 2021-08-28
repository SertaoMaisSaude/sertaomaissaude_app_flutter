import 'package:mobx/mobx.dart';

part 'direction_controller.g.dart';

class DirectionController = _DirectionControllerBase with _$DirectionController;

abstract class _DirectionControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
