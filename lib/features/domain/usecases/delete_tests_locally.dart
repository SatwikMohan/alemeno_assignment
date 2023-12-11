import 'package:alemeno_assignment/features/domain/entities/tests_class.dart';
import 'package:alemeno_assignment/features/domain/repository/tests_local_repository.dart';

class DeleteTestsLocally{
  late final TestsLocalRepository repository;
  DeleteTestsLocally({required this.repository});
  Future<void> call(LabTest labTest){
    return repository.deleteTestsLocally(labTest);
  }
}