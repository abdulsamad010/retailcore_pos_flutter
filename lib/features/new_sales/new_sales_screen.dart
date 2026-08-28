import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../core/widgets/custom_app_bar.dart';
import '../cart/cart_screen.dart';
import 'new_sales_controller.dart';

class NewSalesScreen extends StatelessWidget {
   NewSalesScreen({super.key});

  NewSalesController pC=Get.put(NewSalesController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(name: "Buy PRODUCTS"),
        
        floatingActionButton: Padding(
          padding: const EdgeInsets.fromLTRB(33,0,0,0),
          child: SizedBox(
            width: double.infinity,
            child: FloatingActionButton.extended(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>CartScreen()));
            },
              backgroundColor: Colors.greenAccent,
            label: Row(
              children: [
                Text("View Cart",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,)),
                SizedBox(width: 8,),
                Icon(Icons.trolley,color: Colors.white,)
              ],
            ),),
          ),
        ),

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
          Obx(()=>Text("Cart: ${pC.screenQuantityDisplay[index]}",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.black,))),


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
                            if(pC.productsQuantity[i]["QUANTITY"] >= pC.products[index]["QUANTITY"])
                              {
                                return;
                              }
                            isFound=true;
                            k=i;
                          }
                        }

                        if(isFound==true){
                          pC.productsQuantity[k]["QUANTITY"]++;
                          pC.screenQuantityDisplay[index]++;

                          pC.productsQuantity.refresh();
                          pC.screenQuantityDisplay.refresh();
                        }
                        else{
                          pC.productsQuantity.add({
                            "ID":pC.products[index]["ID"],
                            "QUANTITY":1,
                            "INDEX":index
                          });
                          pC.screenQuantityDisplay[index]++;
                          pC.screenQuantityDisplay.refresh();
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
                          pC.productsQuantity.refresh();
                          pC.screenQuantityDisplay.refresh();
                        }
                        else{
                          pC.productsQuantity[k]["QUANTITY"]--;
                          pC.screenQuantityDisplay[index]--;
                          pC.productsQuantity.refresh();
                          pC.screenQuantityDisplay.refresh();
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
