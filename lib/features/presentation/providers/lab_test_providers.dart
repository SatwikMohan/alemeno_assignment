import 'package:alemeno_assignment/features/data/datasources/lab_tests_local_datasource.dart';
import 'package:alemeno_assignment/features/data/models/lab_test_model.dart';
import 'package:alemeno_assignment/features/data/repository/tests_local_repository_impl.dart';
import 'package:alemeno_assignment/features/domain/entities/tests_class.dart';
import 'package:alemeno_assignment/features/domain/repository/tests_local_repository.dart';
import 'package:alemeno_assignment/features/domain/usecases/add_tests_locally.dart';
import 'package:alemeno_assignment/features/domain/usecases/delete_tests_locally.dart';
import 'package:alemeno_assignment/features/domain/usecases/get_local_tests.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

final labTestsLocalDataSourceProvider = Provider<LabTestsLocalDataSource>((ref){
  final Box<LabTestModel> testsBox = Hive.box('labtests');
  //testsBox.clear();
  return LabTestsLocalDataSource(testsBox: testsBox);
});

final testsLocalRepository = Provider<TestsLocalRepository>((ref){
  final labTestsLocalDataSource = ref.read(labTestsLocalDataSourceProvider);
  return TestsLocalRepositoryImpl(labTestsLocalDataSource: labTestsLocalDataSource);
});

final addTestsLocallyProvider = Provider<AddTestsLocally>((ref){
  final repository = ref.read(testsLocalRepository);
  return AddTestsLocally(repository: repository);
});

final deleteTestsLocallyProvider = Provider<DeleteTestsLocally>((ref){
  final repository = ref.read(testsLocalRepository);
  return DeleteTestsLocally(repository: repository);
});

final getLocalTestsProvider = Provider<GetLocalTests>((ref){
  final repository = ref.read(testsLocalRepository);
  return GetLocalTests(repository: repository);
});

final labTestsLocalListNotifierProvider = StateNotifierProvider<LabTestsLocalListNotifier,List<LabTest>>((ref){
  final getLocalTests = ref.read(getLocalTestsProvider);
  final addTestsLocally = ref.read(addTestsLocallyProvider);
  final deleteTestsLocally = ref.read(deleteTestsLocallyProvider);
  return LabTestsLocalListNotifier(getLocalTests,addTestsLocally,deleteTestsLocally);
});

class LabTestsLocalListNotifier extends StateNotifier<List<LabTest>>{
  final GetLocalTests _getLocalTests;
  final AddTestsLocally _addTestsLocally;
  final DeleteTestsLocally _deleteTestsLocally;
  LabTestsLocalListNotifier(this._getLocalTests,this._addTestsLocally,this._deleteTestsLocally):super([]);

  addNewLabTestLocally(LabTest labTest) async{
    await _addTestsLocally(labTest);
  }

  removeLabTestLocally(LabTest labTest) async{
    await _deleteTestsLocally(labTest);
  }

  loadLocallyStoredLabTests()async{
     final localTestsOrFailure = await _getLocalTests();
     localTestsOrFailure.fold((error) => state=[], (tests) => state = tests);
  }

}

final selectDateTimeProvider = StateProvider<String>((ref) => "Select Date and Time");

final selectedOption = ChangeNotifierProvider<CheckNotifier>((ref) => CheckNotifier());
class CheckNotifier extends ChangeNotifier{
  int option =0;
  void setOption(int value){
    option = value;
    notifyListeners();
  }
}

final selectedOptionProvider = ChangeNotifierProvider<OptionNotifier>((ref) => OptionNotifier());
class OptionNotifier extends ChangeNotifier{
  int option = 0;
  void setOption(int index){
    option = index;
    notifyListeners();
  }
}