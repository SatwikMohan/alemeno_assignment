import 'package:alemeno_assignment/core/utils/constants.dart';
import 'package:alemeno_assignment/core/utils/functions.dart';
import 'package:alemeno_assignment/core/utils/navigation.dart';
import 'package:alemeno_assignment/features/domain/entities/tests_class.dart';
import 'package:alemeno_assignment/features/presentation/pages/book_appointment.dart';
import 'package:alemeno_assignment/features/presentation/pages/success_screen.dart';
import 'package:alemeno_assignment/features/presentation/providers/lab_test_providers.dart';
import 'package:alemeno_assignment/features/presentation/widgets/cart_lab_tests_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:group_radio_button/group_radio_button.dart';

class MyCart extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final testsList = ref.watch(labTestsLocalListNotifierProvider);
    String datetime = ref.watch(selectDateTimeProvider.notifier).state;
    int select = 1;
    return Scaffold(
      appBar: AppBar(
        title: Text('My Cart'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Order Review',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
              ),
              SizedBox(height: 10,),
              Container(
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                  color: Colors.blue.shade900,
                    border: Border.all(color: Colors.grey)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Pathology Tests',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
                  ],
                ),
              ),
              Container(
                //height: 430,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10)),
                ),
                child: testsList.length>0?ListView.builder(
                  shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: testsList.length,
                    itemBuilder: (context,index)
                {
                    return CartLabTestTile(labTest: testsList[index]);
                }):Text('Go Testing'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: testsList.length>0? Container(
                  width: 300,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: TextButton.icon(
                      onPressed: (){
                        NavigateTo(context, BookAppointment());
                      },
                      icon: Icon(Icons.calendar_month,color: Colors.black,),
                      label: Text(datetime)
                  ),
                ):Container(),
              ),
              testsList.length>0?
              Container(
                width: 300,
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 10,),
                    Text('MRP Total : \$ ${totalDiscardedPrice(testsList)}',style: TextStyle(color: Colors.black,fontSize: 15),),
                    SizedBox(height: 10,),
                    Text('Discount : \$ ${getTotalSavings(testsList)}',style: TextStyle(color: Colors.black,fontSize: 15),),
                    SizedBox(height: 10,),
                    Text('Final Amount to be Paid : \$ ${totalCurrPrice(testsList)}',style: TextStyle(color: Colors.blue.shade900,fontSize: 18,fontWeight: FontWeight.bold),),
                    SizedBox(height: 10,),
                    Text('Your Total Savings : \$ ${getTotalSavings(testsList)}',style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),
                    SizedBox(height: 10,),
                  ],
                ),
              ):Container(),
              Container(
                width: 300,
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RadioButton(
                      description: DESCRIPTION,
                      value: select,
                      groupValue: ref.watch(selectedOption).option,
                      onChanged: (value){
                        ref.watch(selectedOption.notifier).setOption(value!);
                      }
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: SizedBox(
                  width: 250,
                  height: 50,
                  child: ElevatedButton(
                      onPressed:
                  ((testsList.length>0)&&((ref.watch(selectDateTimeProvider.notifier).state)!="Select Date and Time"))?
                      ()=>whenPressed(ref, testsList, context):null,
                    child: Text('Schedule',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                    style:
                    ((testsList.length>0)&&((ref.watch(selectDateTimeProvider.notifier).state)!="Select Date and Time"))?
                    getButtonStyle(Colors.blue.shade900):getButtonStyle(Colors.grey)
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void whenPressed(WidgetRef ref, List<LabTest> testsList,BuildContext context){
    ref.watch(labTestsLocalDataSourceProvider).testsBox.clear();
    testsList.forEach((element) async {
      await showNotification(element.name+" has been successfully purchased");
      await Future.delayed(Duration(seconds: 2));
    });
    NavigateTo(context, SuceesScreen());
  }

}
