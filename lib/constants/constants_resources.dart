// ignore_for_file: constant_identifier_names

import 'package:task_07/data/data_model/data_model.dart';

class ConstantsResources {
  static const String ALL_DIGITS = '0123456789';
  static const int SNACKBAR_DELAY = 3;

  static const String HIVE_BOX_NAME = "Data Box";

  static const int LABEL_NO_ONE = 1;
  static const int LABEL_NO_TWO = 2;
  static const int LABEL_NO_THREE = 3;
  static const int LABEL_NO_FOUR = 4;
  static const int LABEL_NO_FIVE = 5;

  //
  static const int EMPTY_LIST = 0;
  static const int MINIMUM_LENGTH = 1;

  static const int NUMBER_MAX_LENGTH = 4;

  static var defaultData = <DataModel>{
    DataModel(
        name: "Default values",
        value2: 2,
        value3: 3,
        value4: 4,
        value5: 5,
        value1: 1)
  };
}
