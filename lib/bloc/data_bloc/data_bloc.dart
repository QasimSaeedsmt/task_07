import 'package:bloc/bloc.dart';
import 'package:task_07/data/data_model/data_model.dart';
import 'package:task_07/repo/hive_repo.dart';

import '../../data/boxes..dart';
import 'data_event.dart';
import 'data_state.dart';

class DataBloc extends Bloc<DataEvent, DataState> {
  DataBloc() : super(DataInitial()) {
    // Existing logic...

    on<ShowFirstTextFieldEvent>((event, emit) {
      emit(ShowFirstTextFieldState());
    });

    on<EditDataEvent>((event, emit) {
      var box = Boxes.getData();
      HiveRepo.editExistingValue(event.index, event.name);
      List<DataModel> updatedList = box.values.toList().cast<DataModel>();
      emit(DataEditedState(updatedList: updatedList));
    });

    on<AddDataEvent>((event, emit) {
      HiveRepo.addNewValue(event.name, event.value1, event.value2, event.value3,
          event.value4, event.value5);
      var box = Boxes.getData();
      List<DataModel> updatedList = box.values.toList().cast<DataModel>();
      emit(DataAddedState(dataList: updatedList));
    });

    on<DeleteDataEvent>((event, emit) {
      HiveRepo.deleteValue(event.index);
      var box = Boxes.getData();
      List<DataModel> updatedList = box.values.toList().cast<DataModel>();
      emit(DataDeletedState(updatedList: updatedList));
    });

    on<ShowSecondTextFieldEvent>(
        (event, emit) => emit(ShowSecondTextFieldState()));
    on<ShowThirdTextFieldEvent>(
        (event, emit) => emit(ShowThirdTextFieldState()));
    on<ShowFourthTextFieldEvent>(
        (event, emit) => emit(ShowFourthTextFieldState()));
    on<ShowFifthTextFieldEvent>(
        (event, emit) => emit(ShowFifthTextFieldState()));
  }
}
