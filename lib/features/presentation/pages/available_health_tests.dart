import 'package:alemeno_assignment/core/utils/constants.dart';
import 'package:alemeno_assignment/core/utils/functions.dart';
import 'package:alemeno_assignment/core/utils/navigation.dart';
import 'package:alemeno_assignment/features/domain/entities/tests_class.dart';
import 'package:alemeno_assignment/features/presentation/pages/my_cart.dart';
import 'package:alemeno_assignment/features/presentation/providers/lab_test_providers.dart';
import 'package:alemeno_assignment/features/presentation/widgets/popular_lab_tests_tile.dart';
import 'package:alemeno_assignment/features/presentation/widgets/popular_packages_tile.dart';
import 'package:alemeno_assignment/features/presentation/widgets/widget_short_cut.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AvailableHealthTestsScreen extends ConsumerWidget {

final list2=POPULAR_PACKAGES_LIST;
List<LabTest> popularTests = LOAD_POPULAR_LAB_TESTS;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(labTestsLocalListNotifierProvider.notifier).loadLocallyStoredLabTests();
    final cartList = ref.watch(labTestsLocalListNotifierProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              height: 60,
              width: 60,
              child: Image(image: AssetImage("assets/images/logo.png"),),
            )
          ],
        ),
        actions: [
          Row(
            children: [
              Text(cartList.length.toString(),style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 12),),
              IconButton(onPressed: (){
                print(ref.watch(labTestsLocalListNotifierProvider));
                NavigateTo(context, MyCart());
              },
                  icon: Icon(Icons.shopping_cart,color: Colors.black,),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            HeaderRow("Popular Lab Tests"),
            GridView.builder(
                gridDelegate: getDelegate(2, 20, 10, 0.7),
                itemCount: popularTests.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context,index){
                final item = popularTests[index];
                if(check(popularTests[index],cartList)){
                  return PopularLabTestsTile(LabTest(name: item.name, numberOfTests: item.numberOfTests,
                      resultOutTime: item.resultOutTime, currPrice: item.currPrice,
                      discardedPrice: item.discardedPrice, mark: true)
                  );
                }else{
                  return PopularLabTestsTile(popularTests[index]);
                }
            }),
            HeaderRow("Popular Packages"),
            ListView.builder(
              shrinkWrap: true,
              itemCount: list2.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context,index){
                  return list2[index];
                }),
          ],
        ),
      ),
    );
  }
}
