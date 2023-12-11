import 'package:alemeno_assignment/features/data/models/lab_test_model.dart';
import 'package:hive/hive.dart';

class LabTestsLocalDataSource{
  late final Box<LabTestModel> testsBox;
  LabTestsLocalDataSource({required this.testsBox});
  List<LabTestModel> getLocalTests(){
    return testsBox.values.toList();
  }
  void addTestsLocally(LabTestModel labTestModel){
    testsBox.add(labTestModel);
  }
  void deleteTestsLocally(LabTestModel labTestModel){
    final valueMap = testsBox.toMap();
    valueMap.forEach((key, value) {
      if((value.name==labTestModel.name)&&(value.numberOfTests==labTestModel.numberOfTests)&&(value.resultOutTime==labTestModel.resultOutTime)){
        testsBox.delete(key);
      }
    });
  }
  void markAsAdded(LabTestModel labTestModel,bool mark){
      final newModel = LabTestModel(
          name: labTestModel.name,
          numberOfTests: labTestModel.numberOfTests,
          resultOutTime: labTestModel.resultOutTime,
          currPrice: labTestModel.currPrice,
          discardedPrice: labTestModel.discardedPrice,
          mark: mark
      );
      final valueMap = testsBox.toMap();
      valueMap.forEach((key, value) {
        if((value.name==labTestModel.name)&&(value.numberOfTests==labTestModel.numberOfTests)&&(value.resultOutTime==labTestModel.resultOutTime)){
          testsBox.put(key, newModel);
        }
      });
  }

}