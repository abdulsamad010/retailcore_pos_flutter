import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get.dart';
import 'package:retailcore_pos/features/sales_history/sales_history_controller.dart';

class SalesHistoryScreen extends StatelessWidget {
  SalesHistoryScreen({super.key});

  SalesHistoryController pC=Get.put(SalesHistoryController());



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back,color: Colors.black,)),
                Expanded(child: Center(child: Text("Sales History",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.black,)))),
              ],
            ),

            Divider(),

            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Id",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black,)),
                  Text("Custome Id",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black,)),
                  Text("Price",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black,)),
                  Text("Date",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black,)),
                ],
              ),
            ),

            Divider(),

            Obx(()=> pC.sales.isNotEmpty ? Expanded(
              child: ListView.builder(itemCount: pC.sales.length,itemBuilder:(context,index){
                return Container(
                  padding: EdgeInsets.all(8),
                  margin: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.blueAccent,width: 1)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(child: Text("${pC.sales[index]["ID"]}",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.black,))),
                      Expanded(child: Obx(()=>Text("${pC.sales[index]["CUSTOMER_ID"]}",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.black,)))),
                      Expanded(child: Text("${pC.sales[index]["TOTAL_AMOUNT"]}",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.black,))),
                      Text("${pC.sales[index]["DATE"].substring(0,10)}",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.black,)),
                    ],

                  ),
                );
              }),
            )
                : Text("No Sales Added",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,))),

            Divider(),
            Container(decoration: BoxDecoration(color: Colors.blueAccent,borderRadius: BorderRadius.circular(5)),width: double.infinity,padding: EdgeInsets.all(8),margin: EdgeInsets.all(8),child: Center(child: Obx(()=>Text("Total Sales: ${pC.total}",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.black,))))),
            Divider(),

          ],
        ),
      ),
    );
  }
}
