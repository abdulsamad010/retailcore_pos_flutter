import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
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

      body: Obx(()=>ListView.builder(itemCount: pC.products.length,itemBuilder:(context,index){
        return Column(
          children: [
            Row(
              children: [
                Text("Id: ${pC.products[index]["ID"]}"),
                Text("Name: ${pC.products[index]["NAME"]}"),
                Text("Quantity: ${pC.products[index]["QUANTITY"]}"),
                Text("Price: ${pC.products[index]["PRICE"]}"),
                Text("Barcode: ${pC.products[index]["BARCODE"]}"),
              ],
            ),
            Row(
              children: [
                ElevatedButton(onPressed: ()async{
                  await pC.deleteProduct(pC.products[index]["ID"]);
                  await pC.showProducts();
                }, child: Text("Delete Product")),

              ],
            )
          ],
        );
      })
      ));
  }
}
