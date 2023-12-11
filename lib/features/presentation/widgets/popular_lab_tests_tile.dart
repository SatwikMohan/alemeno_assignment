import 'package:alemeno_assignment/core/utils/functions.dart';
import 'package:alemeno_assignment/features/domain/entities/tests_class.dart';
import 'package:alemeno_assignment/features/presentation/providers/lab_test_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
class PopularLabTestsTile extends ConsumerWidget {
  late LabTest labTest;
  PopularLabTestsTile(this.labTest);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isAdded = labTest.mark;
    return Container(
      width: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(left: 5,right: 5),
            height: 30,
            width: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(labTest.name,style: TextStyle(color: Colors.black,fontWeight:FontWeight.bold),),
              ],
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                color: Colors.blue,
                border: Border.all(color: Colors.grey)
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 5,right: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(10),bottomLeft: Radius.circular(10)),
                color: Colors.white,
                border: Border.all(color: Colors.grey)
            ),
            width: 200,
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Include ${labTest.numberOfTests} tests  '),
                    Icon(Icons.check,color: Colors.green,)
                  ],
                ),
                SizedBox(height: 20,),
                Text('Get results in ${labTest.resultOutTime} hours',style: TextStyle(color: Colors.grey)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(' \$ ${labTest.currPrice}  ',style: TextStyle(color: Colors.blue.shade900,fontWeight: FontWeight.bold,fontSize: 18)),
                    Text('\$ ${labTest.discardedPrice}',style: TextStyle(decoration: TextDecoration.lineThrough,color: Colors.grey))
                  ],
                ),
                ElevatedButton(onPressed: isAdded?null:(){
                  // final test= LabTest(name: "name", numberOfTests: 1, resultOutTime: 1, currPrice:1, discardedPrice: 3,mark: true);
                  ref.read(labTestsLocalListNotifierProvider.notifier).addNewLabTestLocally(labTest);
                  print(ref.watch(labTestsLocalListNotifierProvider));
                },
                  child: isAdded?Text('Added to Cart',style: TextStyle(color: Colors.white),):Text('Add to cart',style: TextStyle(color: Colors.white),),
                  style: isAdded?getButtonStyle(Colors.grey):getButtonStyle(Colors.blue.shade900)
                ),
                ElevatedButton(onPressed: (){

                },
                    child: Text('View Details'),
                  style: getButtonStyle(Colors.white),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
