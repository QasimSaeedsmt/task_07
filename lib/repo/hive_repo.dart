
import '../data/boxes..dart';
import '../data/dataModel/data_model.dart';

class HiveRepo {
  final _box1 = Boxes.getData();

  get box1 => _box1;

  static void addNewValue(String name,
      int value1,
      int value2,
      int value3,
      int value4,
      int value5,) {
    var data = DataModel(
        name: name,
        value2: value2,
        value3: value3,
        value4: value4,
        value5: value5,
        value1: value1);
    var box = Boxes.getData();
    box.add(data);
    data.save();
  }

  static void editExistingValue(int index, String name) {
    final box = Boxes.getData();
    List<DataModel> data = box.values.toList().cast<DataModel>();

    if (index >= 0 && index < data.length) {
      DataModel updatedModel = data[index];
      updatedModel.name = name;
      box.put(updatedModel.key, updatedModel);
    }
  }

  static Future<int?> deleteValue(int index) async {
    var box = Boxes.getData();
    try {
      await box.deleteAt(index);
      return index;
    } catch (e) {
      return null;
    }
  }
}
