import 'package:alemeno_assignment/core/utils/functions.dart';
import 'package:flutter/material.dart';
class PopularPackages extends StatelessWidget {
  String name;int price;
  PopularPackages(this.name,this.price);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      margin: EdgeInsets.all(13),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          color: Colors.white,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Image(image: AssetImage("assets/images/image.png"),width: 120,height: 120,),
                SizedBox(width: 50,),
                Icon(Icons.check,color: Colors.green,),
              ],
            ),
          ),
          Text(name,style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
          Text('Includes 92 tests',style: TextStyle(color: Colors.grey,fontSize: 14,),),
          Text('* Blood Glucose Fasting',style: TextStyle(color: Colors.grey,fontSize: 14,),),
          Text('* Liver Function Test',style: TextStyle(color: Colors.grey,fontSize: 14,),),
          TextButton(onPressed: (){}, child: Text('View More',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),),),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('  \$ ${price} ',style: TextStyle(color: Colors.cyan,fontSize: 20,fontWeight: FontWeight.bold),),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(onPressed: (){}, child: Text('Add to cart'),style: getButtonStyle(Colors.white),),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
