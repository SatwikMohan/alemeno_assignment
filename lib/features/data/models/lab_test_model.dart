import 'package:alemeno_assignment/features/domain/entities/tests_class.dart';
import 'package:hive/hive.dart';
part 'lab_test_model.g.dart';

@HiveType(typeId: 0)
class LabTestModel extends HiveObject{
  @HiveField(0)
  late final String name;
  @HiveField(1)
  late final int numberOfTests;
  @HiveField(2)
  late final int resultOutTime;
  @HiveField(3)
  late final int currPrice;
  @HiveField(4)
  late final int discardedPrice;
  @HiveField(5)
  bool mark = false;

  LabTestModel({
    required this.name,
    required this.numberOfTests,
    required this.resultOutTime,
    required this.currPrice,
    required this.discardedPrice,
    required this.mark,
  });
  
  factory LabTestModel.fromEntity(LabTest labTest) => LabTestModel(
      name: labTest.name, 
      numberOfTests: labTest.numberOfTests, 
      resultOutTime: labTest.resultOutTime, 
      currPrice: labTest.currPrice, 
      discardedPrice: labTest.discardedPrice,
      mark: labTest.mark
  );
  
  LabTest toEntity() => LabTest(
        name: name,
        numberOfTests: numberOfTests,
        resultOutTime: resultOutTime,
        currPrice: currPrice,
        discardedPrice: discardedPrice,
        mark: mark,
      );
  
}