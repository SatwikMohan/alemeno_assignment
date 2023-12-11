import 'package:alemeno_assignment/features/core/failures.dart';
import 'package:alemeno_assignment/features/domain/entities/tests_class.dart';
import 'package:alemeno_assignment/features/domain/repository/tests_local_repository.dart';
import 'package:dartz/dartz.dart';

class GetLocalTests{
  late final TestsLocalRepository repository;
  GetLocalTests({required this.repository});
  Future<Either<Failure,List<LabTest>>> call(){
    return repository.getLocalTests();
  }
}