import 'package:alemeno_assignment/core/utils/functions.dart';
import 'package:alemeno_assignment/core/utils/navigation.dart';
import 'package:alemeno_assignment/features/presentation/pages/available_health_tests.dart';
import 'package:alemeno_assignment/features/presentation/providers/lab_test_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
class SuceesScreen extends ConsumerWidget {

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Success"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.all(25),
              width: MediaQuery.of(context).size.width,
              height: 400,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 60,),
                  Center(child: Image(image: AssetImage("assets/images/success_calendar.png"),width: 120,height: 120,),),
                  SizedBox(height: 35,),
                  Container(
                    margin: EdgeInsets.all(10),
                      child: Center(child: Text('Lab tests have been scheduled successfully, You will receive a mail of the same',
                        style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                      )
                      )
                  ),
                  SizedBox(height: 35,),
                  Text(ref.watch(selectDateTimeProvider.notifier).state,style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 250,
            height: 50,
            child: ElevatedButton(onPressed: (){
              ref.watch(selectDateTimeProvider.notifier).state = "Select Date and Time";
              NavigateToWithoutLookBack(context, AvailableHealthTestsScreen());
              },
                child: Text("Back to home",style: TextStyle(color: Colors.white),),
              style: getButtonStyle(Colors.blue.shade900),
            ),
          )
        ],
      ),
    );
  }
}
