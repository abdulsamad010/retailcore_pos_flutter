import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:retailcore_pos/core/widgets/custom_app_bar.dart';
import 'package:retailcore_pos/features/supplier/supplier_controller.dart';

class SupplierScreen extends StatelessWidget {
  SupplierScreen({super.key});

  SupplierController pC=Get.put(SupplierController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(name: "VIEW PRODUCTS"),

        body: Obx(()=> pC.suppliers.isNotEmpty ? ListView.builder(itemCount: pC.suppliers.length,itemBuilder:(context,index){
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
                        Text("Id: ${pC.suppliers[index]["ID"]}",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.black,),),
                        Text("Name: ${pC.suppliers[index]["NAME"]}",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.black,)),
                        Text("Phone Number: ${pC.suppliers[index]["PHONE"]}",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.black,)),
                        ],
                    ),
                  ),
                ),

                ElevatedButton(onPressed: ()async{
                  await pC.deleteSupplier(pC.suppliers[index]["ID"]);
                  await pC.showSuppliers();
                },
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent,padding: EdgeInsets.all(4))
                    ,child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Delete Supplier",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,)),
                      ),
                    )),
              ],

            ),
          );
        })
            : Text("No Supplier Added",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,))));
  }
}
