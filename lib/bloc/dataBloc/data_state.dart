import '../../data/dataModel/data_model.dart';

abstract class DataState {}

class DataInitial extends DataState {}

class DataAddedState extends DataState {
  final List<DataModel> dataList;

  DataAddedState({required this.dataList});
}

class DataDeletedState extends DataState {
  List<DataModel> updatedList;

  DataDeletedState({required this.updatedList});
}

class DataEditedState extends DataState {
  List<DataModel> updatedList;

  DataEditedState({required this.updatedList});
}

class TextFieldShownState extends DataState {}

class TextFieldHiddenState extends DataState {}

class ShowFirstTextFieldState extends DataState {}

class ShowSecondTextFieldState extends DataState {}

class ShowThirdTextFieldState extends DataState {}

class ShowFourthTextFieldState extends DataState {}

class ShowFifthTextFieldState extends DataState {}

class DataAddedToAllFieldsState extends DataState {}

class DataSubmittedState extends DataState {
  List<DataModel> updatedList;

  DataSubmittedState({required this.updatedList});
}