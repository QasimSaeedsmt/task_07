import 'package:hive/hive.dart';
import 'package:task_07/constants/constants_resources.dart';

import 'dataModel/data_model.dart';

class Boxes {
  static Box<DataModel> getData() =>
      Hive.box<DataModel>(ConstantsResources.HIVE_BOX_NAME);
}
