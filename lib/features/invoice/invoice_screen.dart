import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get.dart';
import 'package:retailcore_pos/features/home/home_screen.dart';
import '../new_sales/new_sales_controller.dart';

class InvoiceScreen extends StatelessWidget {
  InvoiceScreen({super.key});

  NewSalesController pC=Get.find<NewSalesController>();





  @override
  Widget build(BuildContext context) {
    return Scaffold(

      floatingActionButton: Padding(
        padding: const EdgeInsets.fromLTRB(33,0,0,0),
        child: SizedBox(
          width: double.infinity,
          child: FloatingActionButton.extended(onPressed: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen(),));
          },
            backgroundColor: Colors.greenAccent,
            label: Text("GoTo Home",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,),
            ),),
        ),
      ),

      body: SafeArea(
        child: Container(
            margin: EdgeInsets.fromLTRB(8,16,8,80),
            decoration: BoxDecoration(color: Colors.white,border: Border.all(color: Colors.black)),
            child:Column(
                children: [
                  Container(color: Colors.blueAccent,child: Center(child: Text("Invoice",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white,)))),

                  Container(
                    height: 25,
                    decoration: BoxDecoration(
                      border: Border.all(),
                      color: Colors.black12,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("       Item   ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.grey,)),
                        VerticalDivider(color: Colors.black,thickness: 1,),
                        Text("Quantity",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.grey,)),
                        VerticalDivider(color: Colors.black,thickness: 1,),
                        Text("Price/Item",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.grey,)),
                        VerticalDivider(color: Colors.black,thickness: 1,),
                        Text("Barcode",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.grey,)),
                      ],
                    ),
                  ),



                  Obx(()=> pC.products.isNotEmpty ? Expanded(
                    child: ListView.builder(itemCount: pC.productsQuantity.length,itemBuilder:(context,index){
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
                            Expanded(child: Text("${pC.products[pC.productsQuantity[index]["INDEX"]]["NAME"]}",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.black,))),
                            Expanded(child: Obx(()=>Text("${pC.screenQuantityDisplay[pC.productsQuantity[index]["INDEX"]]}",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.black,)))),
                            Expanded(child: Text("${pC.products[pC.productsQuantity[index]["INDEX"]]["PRICE"]}",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.black,))),
                            Text("${pC.products[pC.productsQuantity[index]["INDEX"]]["BARCODE"]}",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.black,)),
                          ],

                        ),
                      );
                    }),
                  )
                      : Center(child: Text("No Product Added",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey,fontSize: 10)))),

                  Divider(color: Colors.black,),

                  Container(decoration: BoxDecoration(color: Colors.blueAccent,borderRadius: BorderRadius.circular(5)),width: double.infinity,padding: EdgeInsets.all(8),margin: EdgeInsets.all(8),child: Center(child: Text("Total Bill Paid: ${pC.total}",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.black,)))),
                ])),
      ),
    );
  }
}















































