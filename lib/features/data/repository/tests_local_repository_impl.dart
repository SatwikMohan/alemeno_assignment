import 'package:alemeno_assignment/features/core/failures.dart';
import 'package:alemeno_assignment/features/data/datasources/lab_tests_local_datasource.dart';
import 'package:alemeno_assignment/features/data/models/lab_test_model.dart';
import 'package:alemeno_assignment/features/domain/entities/tests_class.dart';
import 'package:alemeno_assignment/features/domain/repository/tests_local_repository.dart';
import 'package:dartz/dartz.dart';

class TestsLocalRepositoryImpl implements TestsLocalRepository{

  late final LabTestsLocalDataSource labTestsLocalDataSource;
  TestsLocalRepositoryImpl({required this.labTestsLocalDataSource});

  @override
  Future<void> addTestsLocally(LabTest labTest) async{
    final testModel=LabTestModel.fromEntity(labTest);
    labTestsLocalDataSource.addTestsLocally(testModel);
  }

  @override
  Future<void> deleteTestsLocally(LabTest labTest) async{
    final testModel=LabTestModel.fromEntity(labTest);
    labTestsLocalDataSource.deleteTestsLocally(testModel);
  }

  @override
  Future<Either<Failure,List<LabTest>>> getLocalTests() async{
    try {
      final testsModels = labTestsLocalDataSource.getLocalTests();
      List<LabTest> results = testsModels.map((e) => e.toEntity()).toList();
      return Right(results);
    } on Exception catch (e) {
      return Left(SomeSpecificError(e.toString()));
    }
  }

  @override
  Future<void> markAsAdded(LabTest labTest,bool mark) {
    // TODO: implement markAsAdded
    throw UnimplementedError();
  }

}