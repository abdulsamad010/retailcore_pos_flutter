import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:retailcore_pos/features/invoice/invoice_screen.dart';

import '../../core/widgets/custom_app_bar.dart';
import '../add_customer/add_customer_screen.dart';
import '../new_sales/new_sales_controller.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});

  NewSalesController pC=Get.find<NewSalesController>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(name: "View Cart"),

        floatingActionButton: Padding(
          padding: const EdgeInsets.fromLTRB(33,0,0,0),
          child: SizedBox(
            width: double.infinity,
            child: FloatingActionButton.extended(onPressed: (){
              pC.showTotal();
              if(pC.productsQuantity.isNotEmpty) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddCustomerScreen()));
              }
            },
              backgroundColor: Colors.greenAccent,
              label: Obx(()=>Text("Checkout with Total\n Rs: ${pC.total}",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,)),
              ),),
          ),
        ),

        body: Obx(()=> pC.products.isNotEmpty ? ListView.builder(itemCount: pC.productsQuantity.length,itemBuilder:(context,index){
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
                        Text("Id: ${pC.products[pC.productsQuantity[index]["INDEX"]]["ID"]}",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.black,),),
                        Text("Name: ${pC.products[pC.productsQuantity[index]["INDEX"]]["NAME"]}",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.black,)),
                        Text("Quantity: ${pC.products[pC.productsQuantity[index]["INDEX"]]["QUANTITY"]}",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.black,)),
                        Text("Price: ${pC.products[pC.productsQuantity[index]["INDEX"]]["PRICE"]}",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.black,)),
                        Text("Barcode: ${pC.products[pC.productsQuantity[index]["INDEX"]]["BARCODE"]}",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.black,)),
                        Obx(()=>Text("Cart: ${pC.screenQuantityDisplay[pC.productsQuantity[index]["INDEX"]]}",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.black,))),


                      ],
                    ),
                  ),
                ),

                Column(
                  children: [
                    ElevatedButton(onPressed: (){

                        if(pC.productsQuantity[index]["QUANTITY"]>= pC.products[pC.productsQuantity[index]["INDEX"]]["QUANTITY"]){
                          return;
                        }
                        pC.productsQuantity[index]["QUANTITY"]++;
                        pC.screenQuantityDisplay[pC.productsQuantity[index]["INDEX"]]++;

                        pC.productsQuantity.refresh();
                        pC.screenQuantityDisplay.refresh();
                        pC.showTotal();
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

                        if(pC.productsQuantity[index]["QUANTITY"]==1){
                          pC.screenQuantityDisplay[pC.productsQuantity[index]["INDEX"]]--;
                          pC.productsQuantity.removeAt(index);
                          pC.productsQuantity.refresh();
                          pC.screenQuantityDisplay.refresh();
                          pC.showTotal();
                        }
                        else{
                          pC.productsQuantity[index]["QUANTITY"]--;
                          pC.screenQuantityDisplay[pC.productsQuantity[index]["INDEX"]]--;
                          pC.productsQuantity.refresh();
                          pC.screenQuantityDisplay.refresh();
                          pC.showTotal();
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
