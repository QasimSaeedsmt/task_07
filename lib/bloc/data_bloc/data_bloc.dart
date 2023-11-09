import 'package:bloc/bloc.dart';
import 'package:task_07/data/data_model/data_model.dart';
import 'package:task_07/repo/hive_repo.dart';

import '../../data/boxes..dart';
import 'data_event.dart';
import 'data_state.dart';

class DataBloc extends Bloc<DataEvent, DataState> {
  DataBloc() : super(DataInitial(dataList: [])) {
    on<AddDataEvent>((event, emit) {
      var box = Boxes.getData();
      HiveRepo.addNewValue(event.name, event.value1, event.value2, event.value3,
          event.value4, event.value5);
      List<DataModel> updatedList = box.values.toList().cast<DataModel>();
      emit(DataAddedState(dataList: updatedList));
    });

    on<DeleteDataEvent>((event, emit) async {
      var deletedIndex = await HiveRepo.deleteValue(event.index);
      if (deletedIndex != null) {
        var box = Boxes.getData();
        List<DataModel> uL = box.values.toList().cast<DataModel>();
        emit(DataDeletedState(updatedList: uL));
      } else {}
    });

    on<EditDataEvent>((event, emit) {
      HiveRepo.editExistingValue(event.index, event.name);
      var box = Boxes.getData();
      List<DataModel> updatedList = box.values.toList().cast<DataModel>();
      emit(DataEditedState(updatedList: updatedList));
    });

    on<HideTextFieldsEvent>((event, emit) => emit(TextFieldHiddenState()));
    on<ShowTextFieldsEvent>((event, emit) => emit(TextFieldShownState()));
  }
}
