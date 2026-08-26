import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:retailcore_pos/core/widgets/custom_app_bar.dart';

import 'customer_controller.dart';

class CustomerScreen extends StatelessWidget {
  CustomerScreen({super.key});

  CustomerController pC=Get.put(CustomerController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(name: "VIEW PRODUCTS"),

        body: Obx(()=> pC.customers.isNotEmpty ? ListView.builder(itemCount: pC.customers.length,itemBuilder:(context,index){
          return Container(
            padding: EdgeInsets.all(8),
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.blueAccent,width: 1)
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(8),
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.greenAccent,width: 1)
                    ),
                    child: Column(
                      children: [
                        Text("Id: ${pC.customers[index]["ID"]}",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.black,),),
                        Text("Name: ${pC.customers[index]["NAME"]}",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.black,)),
                        Text("Quantity: ${pC.customers[index]["QUANTITY"]}",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.black,)),
                        Text("Price: ${pC.customers[index]["PRICE"]}",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.black,)),
                        Text("Barcode: ${pC.customers[index]["BARCODE"]}",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.black,)),
                      ],
                    ),
                  ),
                ),

                ElevatedButton(onPressed: ()async{
                  await pC.deleteCustomer(pC.customers[index]["ID"]);
                  await pC.showCustomers();
                },
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent,padding: EdgeInsets.all(4))
                    ,child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Delete Customer",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,)),
                      ),
                    )),

              ],

            ),
          );
        })
            : Text("No Customer Found",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,))));
  }
}
