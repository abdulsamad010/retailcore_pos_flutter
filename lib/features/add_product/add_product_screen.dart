import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:retailcore_pos/core/widgets/custom_app_bar.dart';

import 'add_product_controller.dart';

class AddProductScreen extends StatelessWidget {
  AddProductScreen({super.key});

  AddProductController aPC=Get.put(AddProductController());

  final nC=TextEditingController();
  final qC=TextEditingController();
  final pC=TextEditingController();
  final bC=TextEditingController();

  final formKey=GlobalKey<FormState>();

  String? nV(String? v) {
    if (v == null || v.trim().isEmpty) {
      return "Name is required";
    }
    return null;
  }

  String? bV(String? v) {
    if (v == null || v.trim().isEmpty) {
      return "Barcode is required";
    }

    final barcode = v.trim();

    if (!RegExp(r'^\d{8}$|^\d{12}$|^\d{13}$').hasMatch(barcode)) {
      return "Enter a valid barcode";
    }

    return null;
  }

  String? qV(String? v) {
    if (v == null || v.trim().isEmpty) {
      return "Quantity is required";
    }
    return null;
  }

  String? pV(String? v) {
    if (v == null || v.trim().isEmpty) {
      return "Price is required";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(name: "Add Product"),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              TextFormField(
                decoration: InputDecoration(
                  label: Text("Enter Product Name"),
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person,color: Colors.blueAccent,),
                ),
                controller: nC,
                validator: nV,
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),

              SizedBox(height: 8,),

              TextFormField(
                decoration: InputDecoration(
                  label: Text("Enter Product Quantity"),
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.production_quantity_limits_outlined,color: Colors.blueAccent,),
                ),
                controller: qC,
                validator: qV,
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),

              SizedBox(height: 8,),

              TextFormField(
                decoration: InputDecoration(
                  label: Text("Enter Product Price"),
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.money,color: Colors.blueAccent,),
                ),
                controller: pC,
                validator: qV,
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),

              SizedBox(height: 8,),

              TextFormField(
                decoration: InputDecoration(
                  label: Text("Enter Product Barcode"),
                  hintText: "e.g. 8901234567890",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.barcode_reader,color: Colors.blueAccent,),
                ),
                controller: bC,
                validator: bV,
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),


              SizedBox(height: 8,),

              ElevatedButton(onPressed: ()async{
                await aPC.addProduct(nC.text,qC.text as int,pC.text as int,bC.text);
              },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent,padding: EdgeInsets.all(4))
                  ,child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Add Product",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,)),
                  )),


            ],
          ),
        ),
      ),
    );
  }
}
