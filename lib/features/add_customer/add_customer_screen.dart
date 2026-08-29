import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:retailcore_pos/core/widgets/custom_app_bar.dart';

import '../invoice/invoice_screen.dart';
import 'add_customer_controller.dart';


class AddCustomerScreen extends StatelessWidget {
  AddCustomerScreen({super.key});

  AddCustomerController aPC=Get.put(AddCustomerController());

  final nC=TextEditingController();
  final p2C=TextEditingController();

  final formKey=GlobalKey<FormState>();

  String? nV(String? v) {
    if (v == null || v.trim().isEmpty) {
      return "Name is required";
    }
    return null;
  }


  String? p2V(String? value) {
    if (value == null || value.isEmpty || value.length<11) {
      return "Enter phone number";
    }
    return null;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(name: "Add Customer First"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                TextFormField(
                  decoration: InputDecoration(
                    label: Text("Enter Customer Name"),
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
                    label: Text("Enter Customer Phone Number"),
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.phone,color: Colors.blueAccent,),
                  ),
                  controller: p2C,
                  validator: p2V,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),


                SizedBox(height: 8,),

                ElevatedButton(onPressed: ()async{
                  if(formKey.currentState!.validate()){await aPC.addCustomer(nC.text,p2C.text);
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => InvoiceScreen()));

                  }
                },
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent,padding: EdgeInsets.all(4))
                    ,child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Add Customer and View Invoice",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,)),
                    )),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
