import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:retailcore_pos/features/add_product/add_product_screen.dart';
import 'package:retailcore_pos/features/customer/customer_controller.dart';
import 'package:retailcore_pos/features/customer/customer_screen.dart';
import 'package:retailcore_pos/features/new_sales/new_sales_controller.dart';
import 'package:retailcore_pos/features/sales_history/sales_history_controller.dart';

import '../../core/widgets/custom_app_bar.dart';
import '../Barcode/barcode_controller.dart';
import '../Barcode/barcode_screen.dart';
import '../daily_sales_report/daily_sales_report_controller.dart';
import '../daily_sales_report/daily_sales_report_screen.dart';
import '../new_sales/new_sales_screen.dart';
import '../product/product_controller.dart';
import '../product/product_screen.dart';
import '../sales_history/sales_history_screen.dart';
import '../stock_movement/stock_movement_controller.dart';
import '../stock_movement/stock_movement_screen.dart';
import '../supplier/supplier_controller.dart';
import '../supplier/supplier_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> listOptions=["Products",
    "Stock In / Out",
    "Customers",
    "Suppliers",
    "New Sale (POS)",
    "Sales History",
    "Daily Sales Reports",
    "Add Product",
  "Barcode Scanning"];

  final icon=[
    Icons.production_quantity_limits_sharp,
    Icons.history,
    Icons.loop,
    Icons.people,
    Icons.next_week,
    Icons.shopping_cart_sharp,
    Icons.newspaper,
    Icons.add,
    Icons.barcode_reader,
  ];

  final iconColor=[
    Colors.green,
    Colors.blueAccent,
    Colors.purpleAccent,
    Colors.redAccent,
    Colors.orange,
    Colors.blueAccent,
    Colors.amberAccent,
    Colors.deepPurple,
    Colors.redAccent,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(name: "RetailCore POS"),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [

            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.blueAccent,
                boxShadow: [
                  BoxShadow(color: Colors.blueAccent,
                  blurRadius: 1,
                  spreadRadius: 1,
                  blurStyle: BlurStyle.solid)
                ],
              ),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                      Center(
                        child: Text("Manage your business smarter, faster, and effortlessly",style: TextStyle(
                          color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15
                        ),),
                      ),


                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(onPressed: (){
                          Get.delete<DailySalesReportController>();
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>DailySalesReportScreen()));
                        },
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.lightBlueAccent)
                        ,child: Text("Recent Sales Transactions",style: TextStyle(color: Colors.white),)),

                        Image.asset("assets/icon/icon9.png",fit: BoxFit.contain,height: MediaQuery.sizeOf(context).height*0.1,)
                      ],
                    ),
                  
                     ],
              ),
            ),

            SizedBox(height: 14,),

            Center(child: Container(decoration: BoxDecoration(border: Border.all(color: Colors.blueAccent,width: 1),borderRadius: BorderRadius.circular(5)),padding: EdgeInsets.all(8),child: Text("Offline Inventory & Point-of-Sale System",style: TextStyle(color: Colors.greenAccent,fontWeight: FontWeight.bold,fontSize: 20),))),
            SizedBox(height: 8,),
            Expanded(
              child: GridView.builder(itemCount: listOptions.length,gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(childAspectRatio: 1,crossAxisCount: 3), itemBuilder: (context,index){
                return Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [Colors.greenAccent,Colors.white],begin: AlignmentGeometry.bottomCenter,end: AlignmentGeometry.center),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.blueAccent,width: 1,),
                  ),
                  padding: EdgeInsets.all(8),
                  margin: EdgeInsets.all(8),
                  child:GestureDetector(
                    onTap: (){
                      if(index==0){
                        Get.delete<ProductController>();
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductScreen()));
                      }
                      else if(index==1){
                        Get.delete<StockMovementController>();
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>StockMovementScreen()));
                      }
                      else if(index==2){
                        Get.delete<CustomerController>();
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>CustomerScreen()));
                      }
                      else if(index==3){
                        Get.delete<SupplierController>();
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>SupplierScreen()));
                      }
                      else if(index==4){
                        Get.delete<NewSalesController>();
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>NewSalesScreen()));
                      }
                      else if(index==5){
                        Get.delete<SalesHistoryController>();
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>SalesHistoryScreen()));
                      }
                      else if(index==6){
                        Get.delete<DailySalesReportController>();
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>DailySalesReportScreen()));
                      }
                      else if(index==7){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>AddProductScreen()));
                      }
                      else if(index==8){
                        Get.delete<BarcodeController>();
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>BarcodeScreen()));
                      }
                      },
                    child:  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(icon[index],color: iconColor[index],size: MediaQuery.sizeOf(context).width*0.08),
                        Center(child: Text("${listOptions[index]}")),
                      ],
                    ),
                    ),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
