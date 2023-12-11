import 'package:alemeno_assignment/core/utils/constants.dart';
import 'package:alemeno_assignment/core/utils/functions.dart';
import 'package:alemeno_assignment/features/presentation/providers/lab_test_providers.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neat_and_clean_calendar/flutter_neat_and_clean_calendar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:intl/intl.dart';
class BookAppointment extends ConsumerWidget {

  final timeList =TIME_LIST;
  String date=DateFormat("dd-MM-yyyy").format(DateTime.now());
  String time="08:00";

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Book Appointment'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text('Select Date',style: TextStyle(color: Colors.black),),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 350,
              child: Calendar(
                startOnMonday: true,
                weekDays: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
                isExpandable: true,
                eventDoneColor: Colors.green,
                selectedColor: Colors.blue.shade900,
                selectedTodayColor: Colors.green,
                todayColor: Colors.blue,
                eventColor: null,
                isExpanded: true,
                expandableDateFormat: 'EEEE, dd. MMMM yyyy',
                datePickerType: DatePickerType.date,
                dayOfWeekStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.w800, fontSize: 11),
                onDateSelected: (value) {
                  print('Date selected $value');
                  String v = DateFormat("dd-MM-yyyy").format(value);
                  date=v;
                  print(v);
                },
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text('Select Time',style: TextStyle(color: Colors.black),),
            ),
            Container(
              margin: EdgeInsets.all(3),
              width: MediaQuery.of(context).size.width,
              child: GridView.builder(
                  gridDelegate: getDelegate(3, 0, 10, 2.5),
                  itemCount: timeList.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context,index){
                    return RadioButton(
                        description: timeList[index],
                        value: index,
                        groupValue: ref.watch(selectedOptionProvider).option,
                        onChanged: (value){
                          int v =int.parse(value.toString());
                          ref.watch(selectedOptionProvider.notifier).setOption(v);
                          time=timeList[index];
                        }
                    );
                  }
                  ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: ElevatedButton(onPressed: (){
                  ref.watch(selectDateTimeProvider.notifier).state = date+" "+time;
                  Navigator.of(context).pop();
              },
                  child: Text('Confirm',style: TextStyle(color: Colors.white),),
                style: getButtonStyle(Colors.blue.shade900),
              ),
            )
          ],
        ),
      ),
    );
  }
}
