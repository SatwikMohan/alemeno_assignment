import 'package:alemeno_assignment/core/utils/functions.dart';
import 'package:alemeno_assignment/features/domain/entities/tests_class.dart';
import 'package:alemeno_assignment/features/presentation/providers/lab_test_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartLabTestTile extends ConsumerWidget {
  late LabTest labTest;
  CartLabTestTile({required this.labTest});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
          border: Border.all(color: Colors.grey)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(labTest.name,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
                SizedBox(width: 30,),
                Column(
                  children: [
                    Text('\$ '+labTest.currPrice.toString(),style: TextStyle(color: Colors.cyan,fontSize: 20,fontWeight: FontWeight.bold),),
                    Text('\$ '+labTest.discardedPrice.toString(),style: TextStyle(decoration: TextDecoration.lineThrough,color: Colors.grey),)
                  ],
                )
              ],
            ),
          ),
          Column(
            children: [
              ElevatedButton(onPressed: (){
                ref.watch(labTestsLocalListNotifierProvider.notifier).removeLabTestLocally(labTest);
              },
                  child: Text('Remove',style: TextStyle(color: Colors.blue.shade900),),
                  style: getButtonStyle(Colors.white),
              ),
              SizedBox(height: 12,),
              ElevatedButton.icon(onPressed: (){},
                  label: Text('Upload Prescription (optional)',style: TextStyle(color: Colors.blue.shade900),),
                icon: Icon(Icons.upload,color: Colors.blue.shade900,),
                style: getButtonStyle(Colors.white),
              )
            ],
          ),
          SizedBox(height: 14,),
          Divider(
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
