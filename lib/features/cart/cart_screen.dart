import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import '../../core/widgets/custom_app_bar.dart';
import '../add_customer/add_customer_screen.dart';
import '../new_sales/new_sales_controller.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});

  NewSalesController pC=Get.find<NewSalesController>();


  final iconColor=[
    Colors.orange,
    Colors.red,
    Colors.blueAccent,
    Colors.purpleAccent,
    Colors.redAccent,
    Colors.blueAccent,
  ];

  int i=0;
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


        body:  Obx(()=> pC.products.isNotEmpty ? ListView.builder(itemCount: pC.productsQuantity.length,itemBuilder:(context,index){
          if(i<5)
          {
            i++;
          }
          else{
            i=0;
          };
          return Container(
            padding: EdgeInsets.all(8),
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(color: Colors.blueAccent,spreadRadius: 1,blurRadius: 1)
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.blueAccent,width: 1)
            ),
            child: Row(
              children: [

                Column(
                  children: [
                    Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [Colors.greenAccent,Colors.blueAccent],begin: Alignment.bottomCenter,end: Alignment.topCenter),
                            border: Border.all(color: Colors.blueAccent),
                            borderRadius: BorderRadius.circular(25)
                        )
                        ,child: Icon(Icons.shopping_bag,color: iconColor[i],)),

                    Text("#0${index+1}",style: TextStyle(fontWeight: FontWeight.bold),)
                  ],
                ),


                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [

                        Container(
                          decoration: BoxDecoration(
                              color: Colors.greenAccent,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Colors.black,width: 1)
                          ),
                          height: 20,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("Id",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.grey,),),
                              VerticalDivider(),

                              Text("Name",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.grey,),),
                              VerticalDivider(),

                              Text("Quantity",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.grey,),),

                            ],
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("${pC.products[pC.productsQuantity[index]["INDEX"]]["ID"]}",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.black,),),
                              Text("${pC.products[pC.productsQuantity[index]["INDEX"]]["NAME"]}",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.black,)),
                              Text("${pC.products[pC.productsQuantity[index]["INDEX"]]["QUANTITY"]}",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.black,)),

                            ],
                          ),
                        ),

                        Divider(color: Colors.blueAccent,),

                        SizedBox(height: 8,),

                        Container(
                          decoration: BoxDecoration(
                              color: Colors.greenAccent,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Colors.black,width: 1)
                          ),
                          height: 20,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("Price",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.grey,),),

                              VerticalDivider(),

                              Text("Barcode",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.grey,),),
                            ],
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("Price: ${pC.products[pC.productsQuantity[index]["INDEX"]]["PRICE"]}",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.black,)),
                              Text("Barcode: ${pC.products[pC.productsQuantity[index]["INDEX"]]["BARCODE"]}",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.black,)),
                            ],
                          ),
                        ),],
                    ),
                  ),
                ),

                Column(
                  children: [
                    IconButton(onPressed: ()async{
                      if(pC.productsQuantity[index]["QUANTITY"]>= pC.products[pC.productsQuantity[index]["INDEX"]]["QUANTITY"]){
                        return;
                      }
                      pC.productsQuantity[index]["QUANTITY"]++;
                      pC.screenQuantityDisplay[pC.productsQuantity[index]["INDEX"]]++;

                      pC.productsQuantity.refresh();
                      pC.screenQuantityDisplay.refresh();
                      pC.showTotal();
                    }, icon: Icon(Icons.add,color: Colors.redAccent,)),

                    Obx(()=>Text("Cart: ${pC.screenQuantityDisplay[pC.productsQuantity[index]["INDEX"]]}",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.black,))),

                    IconButton(onPressed: ()async{
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
                    }, icon: Icon(Icons.minimize,color: Colors.redAccent,)),

                  ],
                )
              ],

            ),
          );
        })
            : Center(child: Text("No Product Added",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey,)))));
  }
}