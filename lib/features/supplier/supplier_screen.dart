import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:retailcore_pos/core/widgets/custom_app_bar.dart';
import 'package:retailcore_pos/features/supplier/supplier_controller.dart';

class SupplierScreen extends StatelessWidget {
  SupplierScreen({super.key});

  SupplierController pC=Get.put(SupplierController());


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
        appBar: CustomAppBar(name: "Suppliers"),

        body:   Obx(()=> pC.suppliers.isNotEmpty ? ListView.builder(itemCount: pC.suppliers.length,itemBuilder:(context,index){
          if(i<5)
          {
            i++;
          }
          else{
            i=0;
          }
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
                        ,child: Icon(Icons.person,color: iconColor[i],)),

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
                            ],
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text("${pC.suppliers[index]["ID"]}",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.black,),),
                              Text("${pC.suppliers[index]["NAME"]}",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.black,)),
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Phone Number",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.grey,),),
                            ],
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("${pC.suppliers[index]["PHONE"]}",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.black,)),
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


                          await pC.deleteSupplier(pC.suppliers[index]["ID"]);
                          await pC.showSuppliers();
                          Navigator.pop(context);
                        }, child: Text("Yes",style: TextStyle(color: Colors.white),)),

                      ],
                    );
                  });
                }, icon: Icon(Icons.delete,color: Colors.redAccent,))
              ],

            ),
          );
        })
            : Center(child: Text("No Supplier Added",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey,))))

    );}
}













































