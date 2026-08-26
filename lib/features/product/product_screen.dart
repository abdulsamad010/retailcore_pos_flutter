import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:retailcore_pos/core/widgets/custom_app_bar.dart';
import 'package:retailcore_pos/features/product/product_controller.dart';

class ProductScreen extends StatelessWidget {
   ProductScreen({super.key});

  ProductController pC=Get.put(ProductController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(name: "VIEW PRODUCTS"),

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
                    ],
                  ),
                ),
              ),

                  ElevatedButton(onPressed: ()async{
                    await pC.deleteProduct(pC.products[index]["ID"]);
                    await pC.showProducts();
                  },
        style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent,padding: EdgeInsets.all(4))
        ,child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Delete Product",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,)),
          ),
        )),
            ],

          ),
        );
      })
      : Text("No Product Added",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,))));
  }
}
