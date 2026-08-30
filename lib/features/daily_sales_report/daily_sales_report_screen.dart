import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get.dart';
import 'daily_sales_report_controller.dart';

class DailySalesReportScreen extends StatelessWidget {
  DailySalesReportScreen({super.key});

  DailySalesReportController pC=Get.put(DailySalesReportController());



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Row(
              children: [
                IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back,color: Colors.black,)),
                Text("Back",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black,)),
              ],
            ),

            Container(
              margin: EdgeInsets.all(8),
            decoration: BoxDecoration(color: Colors.white,border: Border.all(color: Colors.black)),
                child:Column(
                mainAxisSize: MainAxisSize.min,
                children: [
            Container(color: Colors.blueAccent,child: Center(child: Text("Daily Sales Report",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white,)))),

            Flexible(
              child: Container(
                height: 25,
                decoration: BoxDecoration(
                  border: Border.all(),
                color: Colors.black12,
    ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Id",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.grey,)),
                    VerticalDivider(color: Colors.black,thickness: 1,),
                    Text("Custome Id",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.grey,)),
                    VerticalDivider(color: Colors.black,thickness: 1,),
                    Text("Price",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.grey,)),
                    VerticalDivider(color: Colors.black,thickness: 1,),
                    Text("Date",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.grey,)),
                  ],
                ),
              ),
            ),


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
                : Center(child: Text("No Sales Added",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey,fontSize: 10)))),

            Divider(color: Colors.black,),
            Container(decoration: BoxDecoration(color: Colors.greenAccent,borderRadius: BorderRadius.circular(5)),width: double.infinity,padding: EdgeInsets.all(8),margin: EdgeInsets.all(8),child: Center(child:  Obx(()=>Text("Total Sales Today: ${pC.total}",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black,))))),
    ]))
          ],
        ),
      ),
    );
  }
}
