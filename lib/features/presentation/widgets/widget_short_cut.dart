import 'package:flutter/material.dart';

Widget HeaderRow(String heading){
  return Row(
    children: [
      SizedBox(width: 8,),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(heading,style: TextStyle(color: Colors.black,fontSize: 19,fontWeight: FontWeight.bold),),
      ),
      SizedBox(width: 30,),
      Text('View more',style: TextStyle(color: Colors.blue),),
      SizedBox(width: 4,),
      IconButton(onPressed: (){}, icon: Icon(Icons.arrow_right_alt,color: Colors.blue,)),
    ],
  );
}