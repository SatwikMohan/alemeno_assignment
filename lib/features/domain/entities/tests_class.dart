class LabTest{
  late final String name;
  late final int numberOfTests;
  late final int resultOutTime;
  late final int currPrice;
  late final int discardedPrice;
  bool mark = false;
  LabTest({
    required this.name,
    required this.numberOfTests,
    required this.resultOutTime,
    required this.currPrice,
    required this.discardedPrice,
    required this.mark,
  });
}