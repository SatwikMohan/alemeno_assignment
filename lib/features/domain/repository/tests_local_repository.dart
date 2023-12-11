import 'package:alemeno_assignment/features/core/failures.dart';
import 'package:alemeno_assignment/features/domain/entities/tests_class.dart';
import 'package:dartz/dartz.dart';

abstract class TestsLocalRepository{
  Future<Either<Failure,List<LabTest>>> getLocalTests();
  Future<void> addTestsLocally(LabTest labTest);
  Future<void> deleteTestsLocally(LabTest labTest);
  Future<void> markAsAdded(LabTest labTest,bool mark);
}