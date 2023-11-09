abstract class DataEvent {}

class AddDataEvent extends DataEvent {
  String name;
  int value1;
  int value2;
  int value3;
  int value4;
  int value5;

  AddDataEvent(
      {required this.value1,
      required this.name,
      required this.value5,
      required this.value4,
      required this.value3,
      required this.value2});
}

class DeleteDataEvent extends DataEvent {
  final int index;

  DeleteDataEvent({required this.index});
}

class EditDataEvent extends DataEvent {
  String name;
  int index;

  EditDataEvent({required this.name, required this.index});
}

class ShowTextFieldsEvent extends DataEvent {}

class HideTextFieldsEvent extends DataEvent {}
