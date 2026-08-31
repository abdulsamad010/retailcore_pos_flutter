import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:retailcore_pos/core/widgets/custom_app_bar.dart';

import 'barcode_controller.dart';

class BarcodeScreen extends StatelessWidget {
  BarcodeScreen({super.key});

  BarcodeController pC=Get.put(BarcodeController());

  final iconColor=[
    Colors.orange,
  ];

  int i=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(name: "Search Product By Barcode"),

        body: Obx(()=> pC.products.isNotEmpty ? Container(
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

                    Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [Colors.greenAccent,Colors.blueAccent],begin: Alignment.bottomCenter,end: Alignment.topCenter),
                            border: Border.all(color: Colors.blueAccent),
                            borderRadius: BorderRadius.circular(25)
                        )
                        ,child: Icon(Icons.shopping_bag,color: iconColor[i],)),


                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
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
                              Text("      Id",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.grey,),),
                              VerticalDivider(),

                              Text("    Name",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.grey,),),
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
                              Text("${pC.products[0]["ID"]}",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.black,),),
                              Text("${pC.products[0]["NAME"]}",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.black,)),
                              Text("${pC.products[0]["QUANTITY"]}",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.black,)),

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
                              Text("  Price",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.grey,),),

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
                              Text("${pC.products[0]["PRICE"]}",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.black,)),
                              Text("${pC.products[0]["BARCODE"]}",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.black,)),
                            ],
                          ),
                        ),],
                    ),
                  ),
                ),

                IconButton(onPressed: ()async{
                  showDialog(context: context, builder: (context){
                    return AlertDialog(
                      title: Text("Are you sure to Delete?"),
                      actionsAlignment: MainAxisAlignment.spaceBetween,
                      actions: [

                        ElevatedButton(
                            style:ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent)
                            ,onPressed: ()async{
                          Navigator.pop(context);
                        }, child: Text("No",style: TextStyle(color: Colors.white),)),

                        ElevatedButton(
                            style:ElevatedButton.styleFrom(backgroundColor: Colors.redAccent)
                            ,onPressed: ()async{
                          await pC.deleteProduct(pC.products[0]["ID"]);
                          await pC.findProduct(pC.barcode.value);
                          Navigator.pop(context);
                        }, child: Text("Yes",style: TextStyle(color: Colors.white),)),

                      ],
                    );
                  });
                }, icon: Icon(Icons.delete,color: Colors.redAccent,))
              ],

            ),
          )
         : Center(
           child:
           pC.barcode=="" ? Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [

               Container(
                 margin: EdgeInsets.all(8),
                   padding: EdgeInsets.all(8),
                   decoration: BoxDecoration(
                       gradient: LinearGradient(colors: [Colors.greenAccent,Colors.blueAccent],begin: Alignment.bottomCenter,end: Alignment.topCenter),
                       border: Border.all(color: Colors.blueAccent),
                       borderRadius: BorderRadius.circular(55)
                   )
                   ,child: Icon(Icons.barcode_reader,color: iconColor[i],size: 80,)),




               ElevatedButton(
                   style:ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent)
                   ,onPressed: () {
                 showDialog(
                   context: context,
                   builder: (context) {
                     return AlertDialog(
                       content: SizedBox(
                         height: 400,
                         width: 300,
                         child: MobileScanner(
                           onDetect: (capture) {
                             pC.barcode.value =
                                 capture.barcodes.first.rawValue ?? "";

                             if (pC.barcode.isNotEmpty) {
                               pC.findProduct(pC.barcode.value);
                               Navigator.pop(context);
                             }
                           },
                         ),
                       ),

                     );
                   },
                 );



               }, child: Text("Open Barcode Scanner",style: TextStyle(color: Colors.white),))
             ],
           ) : Center(
             child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Text("No Product Found Against This Barcode: ${pC.barcode}",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.black,)),

                 SizedBox(height: 8,),

                 ElevatedButton(
                     style:ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent)
                     ,onPressed: () {
                   pC.barcode.value='';
                 }, child: Text("Click To Try Again",style: TextStyle(color: Colors.white),))
               ],
             ),
           )
         ),
        )
    );}
}