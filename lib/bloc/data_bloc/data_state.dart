import 'package:task_07/data/data_model/data_model.dart';

abstract class DataState {}

class DataInitial extends DataState {

}

class DataAddedState extends DataState {
  final List<DataModel> dataList;

  DataAddedState({required this.dataList});
}

class DataDeletedState extends DataState {
  List<DataModel> updatedList;

  DataDeletedState({required this.updatedList});
}

class DataEditedState extends DataState {
  List updatedList;

  DataEditedState({required this.updatedList});
}

class TextFieldShownState extends DataState {}

class TextFieldHiddenState extends DataState {}
