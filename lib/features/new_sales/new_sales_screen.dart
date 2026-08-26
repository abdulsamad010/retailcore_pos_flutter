import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../core/widgets/custom_app_bar.dart';
import 'new_sales_controller.dart';

class NewSalesScreen extends StatelessWidget {
   NewSalesScreen({super.key});

  NewSalesController pC=Get.put(NewSalesController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(name: "Buy PRODUCTS"),

        body: Obx(()=> pC.products.isNotEmpty ? ListView.builder(itemCount: pC.products.length,itemBuilder:(context,index){
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
                        Text("Id: ${pC.products[index]["ID"]}",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.black,),),
                        Text("Name: ${pC.products[index]["NAME"]}",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.black,)),
                        Text("Quantity: ${pC.products[index]["QUANTITY"]}",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.black,)),
                        Text("Price: ${pC.products[index]["PRICE"]}",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.black,)),
                        Text("Barcode: ${pC.products[index]["BARCODE"]}",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.black,)),
                        Text("Cart: ${pC.screenQuantityDisplay[index]}",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.black,)),


                      ],
                    ),
                  ),
                ),

                Column(
                  children: [
                    ElevatedButton(onPressed: (){
                        int k=0;
                        bool isFound=false;

                        for(int i=0;i<pC.productsQuantity.length; i++){
                          if(pC.productsQuantity[i]["INDEX"]==index){
                            isFound=true;
                            k=i;
                          }
                        }

                        if(isFound==true){
                          pC.productsQuantity[k]["QUANTITY"]++;
                          pC.screenQuantityDisplay[index]++;
                        }
                        else{
                          pC.productsQuantity.add({
                            "ID":pC.products[index]["ID"],
                            "QUANTITY":1,
                            "INDEX":index
                          });
                          pC.screenQuantityDisplay[index]++;
                        }

                    },
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent,padding: EdgeInsets.all(4))
                        ,child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("+",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,)),
                          ),
                        )),

                    ElevatedButton(onPressed: (){
                      int k=0;
                      bool isFound=false;

                      for(int i=0;i<pC.productsQuantity.length; i++){
                        if(pC.productsQuantity[i]["INDEX"]==index){
                          isFound=true;
                          k=i;
                        }
                      }

                      if(isFound==true){

                        if(pC.productsQuantity[k]["QUANTITY"]==1){
                          pC.productsQuantity.removeAt(k);
                          pC.screenQuantityDisplay[index]--;
                        }
                        else{
                          pC.productsQuantity[k]["QUANTITY"]--;
                          pC.screenQuantityDisplay[index]--;
                        }
                      }

                    },
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent,padding: EdgeInsets.all(4))
                        ,child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("-",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,)),
                          ),
                        )),
                  ],
                ),
              ],

            ),
          );
        })
            : Text("No Product Added",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,))));;
  }
}
